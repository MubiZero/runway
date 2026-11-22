# Phase 6: Release Gate & Stopping Criteria

A gate criterion without a verification command or protocol is a wish, not a gate.

## Gate Criteria (G1–G12)

| # | Criterion | Verification Method |
|---|---|---|
| **G1** | Clean build & fresh install on target environment | Build release artifact, install from scratch on `PROFILE.md` target |
| **G2** | Upgrade from previous version preserving data + rollback | Install old version, seed data, upgrade, verify data, test rollback |
| **G3** | Zero open P0 or P1 items | Check `STATE.md` queue |
| **G4** | Primary scenarios for each role pass E2E without dead ends | Role personas + Editor pass on live build (`docs/release/simulations/`) |
| **G5** | Baseline green: full test suite, types, lint, build (and CI) | Run full suite after final edit; record exact numbers |
| **G6** | Resource budgets met: cold start, RAM, network payload, bundle size | Measure on target environment (`mobile-release` for Flutter apps) |
| **G7** | Offline & poor-network behavior verified | Disconnect/throttle network mid-operation; verify recovery & zero duplicates |
| **G8** | Security: zero secrets in repo/history, server-side auth on all routes, no critical CVEs | Secret scan, dependency audit, out-of-UI authorization test |
| **G9** | Data safety: backup & tested restore on clean instance, safe migrations | Run restore drill; run `postgres-migrations` `check_migration.sh` |
| **G10** | Observability: logs & crash traces accessible to pilot support | Trigger an error and trace it end-to-end |
| **G11** | Pilot documentation: install, first run, daily ops, troubleshooting | Run `docs-hygiene` (`doc_audit.sh`) and verify newcomer readability |
| **G12** | Pilot launch checklist completed | Named pilot site owner, support channel, known-limits note, rollback plan, success/abort metrics |

*(Minimal gate when selected by owner: G1, G2, G3, G4 for critical role, G5, G8.)*

## Execution Protocol
- **Never self-certify command-based gates (G1, G2, G5, G6, G9):** run the actual command *after* the final file edit (or via `unlazy` `gate-check.mjs --reverify docs/release/GATES.md` if installed) and record the literal exit code and numbers in `STATE.md`.
- Report command outputs and gate verdicts separately in the final report.
- A green gate does **not** authorize deployment: propose the rollout plan and wait for the owner's explicit command (R5).
