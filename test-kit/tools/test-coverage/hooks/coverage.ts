import type { Coverage } from '../types'

export type Kind = keyof Coverage

export const KINDS: readonly Kind[] = ['validated', 'revalidate', 'problem', 'untested']

const LABELS: Readonly<Record<string, Kind>> = {
  'Validé': 'validated',
  'À revalider': 'revalidate',
  'Problème constaté': 'problem',
  'Non testé': 'untested',
}

// A status cell, with or without its emoji: "✅ Validé", "⚠️ À revalider", "Non testé".
const STATUS = /^(?:\S+\s+)?(Validé|À revalider|Problème constaté|Non testé)$/u

export function empty(): Coverage {
  return { validated: 0, revalidate: 0, problem: 0, untested: 0 }
}

export type Section = { title: string; coverage: Coverage }

// The status of a table row: its first cell that is a status alone.
function rowStatus(line: string): Kind | undefined {
  if (!line.startsWith('|')) return undefined
  for (const cell of line.split('|')) {
    const label = STATUS.exec(cell.trim().normalize('NFC'))?.[1]
    if (label !== undefined) return LABELS[label]
  }

  return undefined
}

// Counts the status cell of every table row under the heading it falls in;
// prose lines such as the legend are ignored, sections without a status are left out.
export function parseSections(text: string): Section[] {
  const sections: Section[] = []
  let title = ''
  let current: Section | undefined
  for (const raw of text.split(/\r?\n/)) {
    const line = raw.trim()
    const heading = /^#{1,6}\s+(.*)$/.exec(line)
    if (heading?.[1] !== undefined) {
      title = heading[1].trim()
      current = undefined
      continue
    }
    const kind = rowStatus(line)
    if (kind === undefined) continue
    if (current === undefined) {
      current = { title, coverage: empty() }
      sections.push(current)
    }
    current.coverage[kind] += 1
  }

  return sections
}

export function parse(text: string): Coverage {
  const coverage = empty()
  for (const section of parseSections(text)) {
    for (const kind of KINDS) coverage[kind] += section.coverage[kind]
  }

  return coverage
}

// "Scénarios à satisfaire pour l'issue #12 (kit de test…)" reads "Scénarios #12".
export function shortTitle(title: string): string {
  const issue = /issue (#\d+)/.exec(title)?.[1]
  if (issue !== undefined) return `Scénarios ${issue}`
  const label = title.replace(/\s*\(.*\)\s*$/, '')

  return label.length > 40 ? `${label.slice(0, 39)}…` : label
}

export const SQUARE: Readonly<Record<Kind, string>> = {
  validated: '🟩',
  revalidate: '🟨',
  problem: '🟥',
  untested: '⬜',
}

export const LABEL: Readonly<Record<Kind, string>> = {
  validated: 'Validé',
  revalidate: 'À revalider',
  problem: 'Problème',
  untested: 'Non testé',
}

// U+2007, as wide as a digit in proportional fonts too.
const FIGURE_SPACE = ' '

// One line per section and a total line. Every line holds the same glyphs at the same
// places (each number right-aligned after its square with figure spaces) and ends with the title,
// so the columns line up in a proportional font (VS Code) as in a terminal.
export function sectionTable(sections: readonly Section[]): string {
  const all = empty()
  for (const section of sections) {
    for (const kind of KINDS) all[kind] += section.coverage[kind]
  }
  const digits = String(total(all)).length
  // Figure spaces also keep the gaps where a webview collapses runs of plain spaces.
  const gap = FIGURE_SPACE.repeat(4)
  const line = (title: string, coverage: Coverage) =>
    [
      String(total(coverage)).padStart(digits, FIGURE_SPACE),
      ...KINDS.map(kind => `${SQUARE[kind]}${String(coverage[kind]).padStart(digits, FIGURE_SPACE)}`),
      title,
    ].join(gap)
  const legend = `Lignes · ${KINDS.map(kind => `${SQUARE[kind]} ${LABEL[kind]}`).join(' · ')} · Section`

  return [
    legend,
    '',
    ...sections.map(section => line(shortTitle(section.title), section.coverage)),
    '',
    line('Total', all),
  ].join('\n')
}

export function total(coverage: Coverage): number {
  return KINDS.reduce((sum, kind) => sum + coverage[kind], 0)
}

// Splits `size` units across the kinds by largest remainder, so the parts add up to `size`.
// With `isVisible`, every kind that has zones gets at least one unit, taken from the largest.
export function allocate(coverage: Coverage, size: number, isVisible = false): Coverage {
  const sum = total(coverage)
  const parts = empty()
  if (sum === 0 || size <= 0) return parts

  const exact = KINDS.map(kind => ({ kind, value: (coverage[kind] * size) / sum }))
  for (const { kind, value } of exact) parts[kind] = Math.floor(value)
  let left = size - total(parts)
  const byRemainder = [...exact].sort(
    (a, b) => b.value - Math.floor(b.value) - (a.value - Math.floor(a.value)),
  )
  for (const { kind } of byRemainder) {
    if (left === 0) break
    parts[kind] += 1
    left -= 1
  }

  if (isVisible) {
    for (const kind of KINDS) {
      if (coverage[kind] === 0 || parts[kind] > 0) continue
      const donor = [...KINDS].sort((a, b) => parts[b] - parts[a])[0]
      if (donor === undefined || parts[donor] <= 1) continue
      parts[donor] -= 1
      parts[kind] += 1
    }
  }

  return parts
}
