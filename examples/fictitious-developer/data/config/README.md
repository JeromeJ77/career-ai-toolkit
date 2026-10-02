# Configuration

`workspace.yaml` stores simple workspace preferences. Keep paths relative. The file is created on first use from `skills/init-workspace/assets/workspace.template.yaml` and never overwritten by an update. A key missing from an existing file (for example after an update adds a setting) is appended with its default value, in template order, and reported by the coach; existing keys, values and comments are never changed. Confirm the profile language before initializing the professional profile. Do not store passwords, API keys or secrets here.
