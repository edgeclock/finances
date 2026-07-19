# Finna for Claude Code

Claude Code is one of two Finna runtimes. Codex may be active in the same repository.

Before acting, read these files in order:

1. `finna/CLAUDE-CODE-HANDOVER.md`
2. `finna/FINNA.md`
3. The relevant skill in `finna/skills/`

`index.html` is the live ledger. Acquire a `claude` lease with `scripts/finna-lock.ps1` before any write. Validate, commit, push, and release the lease in that order. Do not edit `C:\Users\PC\.claude\projects\Finna\Finna\`; it is a legacy recovery snapshot.
