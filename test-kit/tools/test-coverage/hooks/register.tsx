import { atom, read, update } from 'claude-code'
import type { EngineInterface, Register } from 'claude-code'

import type { Coverage } from '../types'
import { KINDS, LABEL, SQUARE, allocate, parse, parseSections, sectionTable, total } from './coverage'
import type { Kind } from './coverage'

const LOG = 'docs/test-log.md'
const PANE = 'test-coverage'
const COMMAND = 'test-coverage'
const POLL_MS = 3000
const MAX_BAR = 60

const coverage = atom({ plugin: 'test-coverage', key: 'coverage' } as const, null)

const COLOR: Readonly<Record<Kind, string>> = {
  validated: 'green',
  revalidate: '#e08a00',
  problem: '#d83d65',
  untested: 'gray',
}

type Elements = ReturnType<EngineInterface['ui']['resolve']>

function bar(ui: Elements, counts: Coverage, columns: number) {
  const { Box, Text } = ui
  const width = Math.max(10, Math.min(MAX_BAR, columns - 16))
  const cells = allocate(counts, width, true)
  const percents = allocate(counts, 100)

  return (
    <Box flexDirection="column">
      <Box>
        <Text bold>Tests </Text>
        {KINDS.filter(kind => cells[kind] > 0).map(kind => (
          <Text key={`bar-${kind}`} color={COLOR[kind]}>
            {'█'.repeat(cells[kind])}
          </Text>
        ))}
        <Text dimColor> – {total(counts)} au total</Text>
      </Box>
      <Box>
        {KINDS.map((kind, index) => (
          <Text key={`legend-${kind}`} color={COLOR[kind]}>
            {index === 0 ? '' : '  '}■ {LABEL[kind]} {counts[kind]} ({percents[kind]} %)
          </Text>
        ))}
      </Box>
    </Box>
  )
}

const STATUS_CELLS = 20

// Plain-text bar returned by the command, the one view every surface shows: the bar on
// its own line (below the engine's "test-coverage:" prefix), then the counts per status.
function textBar(counts: Coverage): string {
  const cells = allocate(counts, STATUS_CELLS, true)
  const percents = allocate(counts, 100)
  const squares = KINDS.map(kind => SQUARE[kind].repeat(cells[kind])).join('')
  const legend = KINDS.map(kind => `${SQUARE[kind]} ${LABEL[kind]} ${counts[kind]} (${percents[kind]} %)`).join('   ')

  return `
Tests ${squares}   – ${total(counts)} au total
${legend}`
}

let lastMtime = -1

// Re-reads the log only when its modification time changed.
async function refresh($: EngineInterface): Promise<void> {
  try {
    const path = `${await $.session.cwd()}/${LOG}`
    if (!(await $.fs.exists(path))) {
      lastMtime = -1
      await update($, coverage, () => null)
      return
    }
    const { mtimeMs } = await $.fs.stat(path)
    if (mtimeMs === lastMtime) return
    const counts = parse(await $.fs.read(path))
    lastMtime = mtimeMs
    await update($, coverage, () => (total(counts) === 0 ? null : counts))
  } catch {
    // A log being rewritten can fail to read; the next tick tries again.
    lastMtime = -1
  }
}

export const register: Register = on => {
  lastMtime = -1

  on('session.start', async ($, e, next) => {
    await $.command.register({
      name: COMMAND,
      description: 'Affiche la couverture des tests (-v : détail par section)',
      argumentHint: '[-v]',
    })
    await refresh($)
    $.clock.every(POLL_MS, () => void refresh($))

    return next(e)
  })

  on('turn.complete', async ($, e, next) => {
    await refresh($)

    return next(e)
  })

  on('command.run', { command: COMMAND }, async ($, e) => {
    const args = e.args.trim().split(/\s+/).filter(arg => arg !== '')
    const isVerbose = args.some(arg => arg === '-v' || arg === '--verbose')
    if (args.some(arg => arg !== '-v' && arg !== '--verbose')) {
      return { text: `Usage : /${COMMAND} [-v | --verbose]` }
    }

    lastMtime = -1
    await refresh($)
    const counts = await read($, coverage)
    if (counts === null) {
      return { text: `Aucun statut de test trouvé dans ${LOG}.` }
    }
    // VS Code reports the pane as placed without drawing it: the command's own text is the reliable view.
    await $.ui.open({ id: PANE, title: 'Couverture des tests' })

    const summary = textBar(counts)
    if (!isVerbose) return { text: summary }
    const sections = parseSections(await $.fs.read(`${await $.session.cwd()}/${LOG}`))

    return { text: `${summary}\n\n${sectionTable(sections)}` }
  })

  on('ui.render', { component: 'AbovePrompt' }, async ($, e, next) => {
    const counts = await read($, coverage)
    if (e.props.hasSurvey || counts === null) return next(e)

    return bar($.ui.resolve(e), counts, e.props.bodyColumns)
  })

  on('ui.render', { component: 'Pane', requestId: PANE }, async ($, e) => {
    const ui = $.ui.resolve(e)
    const counts = await read($, coverage)
    if (counts === null) return <ui.Text dimColor>Aucun statut de test trouvé dans {LOG}.</ui.Text>

    return bar(ui, counts, e.props.bodyColumns)
  })
}
