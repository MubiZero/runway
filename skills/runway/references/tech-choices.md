# Technology Selection & Migration Policy

Newer is not better. Change a technology **only for a measurable gain under the project's actual constraints** (`PROFILE.md`), and migrate reversibly.

## When NOT to Migrate
- Current stack works and the gain is aesthetic or trendy.
- Migration costs more time than remains before the pilot.
- The candidate drops support for target pilot OS/hardware (e.g., WebView2/newer Electron on legacy Windows terminals, or Flutter web's ~2.6 MB engine floor on 50 KB/s public mobile links).
- The owner selected "fix in current stack" during the interview.

## Procedure
1. **List hard constraints** from `PROFILE.md` (target OS versions, RAM/CPU, network speed, bundle size, fleet update mechanism).
2. **Verify docs, not memory:** Check current release notes, OS support matrices, and EOL dates from primary sources.
3. **Compare 2–3 candidates in a matrix:** OS support, startup RAM & bundle size, offline/poor-network resilience, ecosystem maturity, migration cost (modules/days), license & CVEs.
4. **Benchmark on target environment:** Measure cold start, RAM, and payload size on a minimal prototype.
5. **Migrate incrementally behind an adapter/flag:** Keep the old path alive until parity is verified; never leave a half-migrated state between sessions.
6. **Record the ADR** in `docs/release/decisions/NNNN-slug.md` (even when deciding *not* to migrate, so future sessions do not reopen the debate).
