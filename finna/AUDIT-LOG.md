# Finna Audit Log

## Jul 19, 2026 - Edge reversed the privacy migration: repo public, GitHub Pages restored

- Runtime: Claude Code.
- Confirmed source: Edge, direct instruction in chat, after Finna explained the practical tradeoff (private+local-only breaks his phone PWA/home-screen access to the dashboard).
- Change: `edgeclock/finances` set back to **public** visibility (`gh repo edit --visibility public`). GitHub Pages re-enabled on `main` / `/root` (`gh api repos/edgeclock/finances/pages`), confirmed `status: building`, `html_url: https://edgeclock.github.io/finances/`.
- This directly reverses the "Made the GitHub repository private and disabled GitHub Pages" line in the migration entry below. Edge made this call knowingly — do not re-apply the private/local-only setting without asking him again first.
- Updated `finna/FINNA.md` and `finna/CLAUDE-CODE-HANDOVER.md` "Current State" to reflect public + Pages-enabled as the current state, so this isn't re-flipped by mistake in a future session (either runtime).
- No ledger (`index.html`) data changed. `finna-validate.ps1` run as a sanity check regardless, per the shared write protocol.

## Jul 19, 2026 - Dual-runtime setup

- Established `index.html` as the sole live ledger for Codex and Claude Code.
- Created canonical Finna instructions, skills, documentation, validation, runtime sync, and a local write lease.
- Made the GitHub repository private and disabled GitHub Pages. The dashboard is now local-only.
- Rebuilt the account snapshot from the Jul 18, 2026 ledger state.
- Preserved the prior Claude vault as a read-only recovery snapshot; it is no longer a documentation source.

Future entries go above this section and must identify the date, runtime, confirmed source, ledger change, and validation result.
