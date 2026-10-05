import { expect, test } from 'claude-code/testing'

import { allocate, parse, parseSections, sectionTable, total } from '../hooks/coverage'

const LOG = [
  '# Journal des tests réalisés',
  '',
  'Statuts : ✅ Validé · ⚠️ À revalider · 🐞 Problème constaté · ⬜ Non testé',
  '',
  '| Zone | Statut | Premier test | Dernier test | Remarques |',
  '| --- | --- | --- | --- | --- |',
  '| Build | ✅ Validé | 2026-09-30 | 2026-10-05 | Rejoué. |',
  '| Déploiement | ⚠️ À revalider | 2026-09-30 | 2026-10-02 | Non-régression : impacté par #15. |',
  '| Rollback | ⬜ Non testé | — | — | Remarque qui cite « Validé » en texte. |',
  '| Section | Joker | 🐞 Problème constaté | 2026-10-05 | 2026-10-05 | |',
  '| Section | Autre | ✅ Validé | 2026-10-01 | 2026-10-01 | |',
].join('\r\n')

test('counts one status per table row and ignores the legend and remarks', async () => {
  expect(parse(LOG)).toEqual({ validated: 2, revalidate: 1, problem: 1, untested: 1 })
})

test('a log without status rows counts nothing', async () => {
  expect(total(parse('# Titre\n\nTexte libre.'))).toBe(0)
})

test('percentages add up to 100', async () => {
  const parts = allocate({ validated: 39, revalidate: 20, problem: 1, untested: 28 }, 100)
  expect(total(parts)).toBe(100)
  expect(parts).toEqual({ validated: 44, revalidate: 23, problem: 1, untested: 32 })
})

test('a single problem stays visible on a narrow bar', async () => {
  const cells = allocate({ validated: 60, revalidate: 20, problem: 1, untested: 19 }, 20, true)
  expect(total(cells)).toBe(20)
  expect(cells.problem).toBe(1)
})

test('counts each section under its heading and leaves out sections without status', async () => {
  const text = ['## Synthèse', '| Zone | ✅ Validé |', '## Notes', 'Texte.', "### Scénarios à satisfaire pour l'issue #8 (confidentialité)", '| A | ⬜ Non testé |', '| B | 🐞 Problème constaté |'].join('\n')
  const sections = parseSections(text)
  expect(sections.map(section => section.title)).toEqual(['Synthèse', "Scénarios à satisfaire pour l'issue #8 (confidentialité)"])
  expect(sections[1]?.coverage).toEqual({ validated: 0, revalidate: 0, problem: 1, untested: 1 })
})

test('the verbose table shortens issue titles and ends with the total', async () => {
  const table = sectionTable(parseSections(LOG.replace('| Section | Joker', "### Scénarios à satisfaire pour l'issue #18 (joker)\r\n| Section | Joker")))
  const lines = table.split('\n')
  expect(lines[0]?.startsWith('Lignes · 🟩 Validé')).toBe(true)
  expect(lines.some(line => line.endsWith('Scénarios #18'))).toBe(true)
  expect(lines[lines.length - 1]).toBe(['5', '🟩2', '🟨1', '🟥1', '⬜1', 'Total'].join(' '.repeat(4)))
})

test('numbers are right-aligned with figure spaces so every line lines up before the title', async () => {
  const table = sectionTable([
    { title: 'Longue section au titre très long', coverage: { validated: 9, revalidate: 1, problem: 0, untested: 0 } },
    { title: 'B', coverage: { validated: 1, revalidate: 0, problem: 0, untested: 0 } },
  ])
  const lines = table.split('\n')
  const gap = '\u2007'.repeat(4)
  expect(lines[2]).toBe(['10', '🟩 9', '🟨 1', '🟥 0', '⬜ 0', 'Longue section au titre très long'].join(gap))
  expect(lines[3]).toBe([' 1', '🟩 1', '🟨 0', '🟥 0', '⬜ 0', 'B'].join(gap))
})
