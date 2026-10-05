export type Coverage = {
  validated: number
  revalidate: number
  problem: number
  untested: number
}

declare module 'claude-code' {
  interface PluginState {
    'test-coverage': { coverage: Coverage | null }
  }
}
