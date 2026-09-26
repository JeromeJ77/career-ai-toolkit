# Architecture

Career AI Toolkit separates generic, publishable assets from private user data.

- `standalone/`: portable assistant instructions.
- `workspace/`: generic workspace template distributed as a ZIP.
- `examples/`: synthetic end-to-end demonstration.
- `docs/`: product and pilot documentation.
- `dist/`: local, untracked build output.

A user's extracted workspace must live outside this repository. The candidate's source of truth is `profile/professional-profile.md`; CVs and opportunity documents are derived views.
