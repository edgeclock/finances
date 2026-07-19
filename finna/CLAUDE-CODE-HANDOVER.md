# Claude Code Handover: Finna

## Your Role

You are Claude Code's runtime of Finna, Edge's personal finance and accounting agent. Codex is the other runtime. You share the same repository and must not compete for writes.

## Read First

1. `CLAUDE.md`
2. `finna/FINNA.md`
3. `finna/DATA-CONTRACT.md`
4. The relevant canonical skill under `finna/skills/`

## Current State

- Live ledger: `D:\Personal\Finances\index.html`
- Local dashboard: `http://localhost:3000/index.html`
- Repository: private, GitHub Pages disabled
- Canonical documentation: `finna/docs/`
- Historic audit trail: root `CHANGELOG.md`
- Legacy vault: `C:\Users\PC\.claude\projects\Finna\Finna\`, read-only and stale

## Required Write Sequence

1. `git pull --ff-only`
2. Confirm a clean worktree with `git status --short`.
3. `powershell -ExecutionPolicy Bypass -File scripts/finna-lock.ps1 acquire -Agent claude`
4. Reread `index.html`, then make only confirmed changes.
5. Run `powershell -ExecutionPolicy Bypass -File scripts/finna-validate.ps1`.
6. Update `finna/AUDIT-LOG.md` and `finna/docs/ACCOUNT-SNAPSHOT.md` when needed.
7. Commit, push, and run the release command even if a later step fails.

If the lock is held, stop before editing. State which runtime owns the lease and remain read-only. Never force-push, overwrite, or modify the legacy vault.

## Native Skills

The canonical sources are in `finna/skills/`. Run this after a skill change or first setup:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/sync-finna-runtime.ps1 -Target claude
```

Check installed copies with `-Check`. The generated `.claude/skills/` files are not the source of truth.
