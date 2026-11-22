# Phase 1: Existing Codebase & State Analysis

Goal: build an evidence-backed picture of the project in one session to (1) judge distance to pilot, (2) pre-fill the interview, and (3) build the priority queue. **Read-only for the project** (creates only `docs/release/ANALYSIS.md`).

- **Evidence required:** every claim cites `file:line`, a command + output, or a measurement. Unchecked items go under `Неизвестно` with the reason.
- **State what is already clean** alongside pain points.
- **Separate "Project Red" from "Environment Missing":** a test that ran and failed is a P0/P1 finding; a missing local daemon/SDK/OS is an environment requirement for the owner, not a code failure.

## Inspection Checklist (A0–A13)

- **A0. Project Rules:** `CLAUDE.md`, `AGENTS.md`, CONTRIBUTING, README process sections. Note any conflict with `runway`.
- **A1. Stack & Structure:** Languages, frameworks, runtime versions, monorepo layout, LOC count (excluding vendor/locks/generated/l10n), entrypoints, target platforms.
- **A2. Git History:** Age, commit cadence, hotspot files (most frequently edited source files), stale branches/PRs, tags.
- **A3. Baseline Build & Tests:** Run install, build, typecheck, lint, and tests. Record exact command, exit code, and duration.
- **A4. Live Launch:** Boot the app/server and walk the primary role's happy path; capture screenshots.
- **A5. Feature & Role Map:** Routes/screens, API endpoints, background jobs, roles & permissions. Draft `Role × Screen` matrix; flag unreachable code or dead UI buttons.
- **A6. Dependencies:** Vulnerabilities (`govulncheck`, `npm audit`, `osv-scanner`), EOL runtimes, compatibility with target pilot OS/hardware ([tech-choices.md](tech-choices.md)).
- **A7. 1-Hour Security Scan:** Secret leaks in tree/history (never print secret values!), server-side auth checks per endpoint, input validation, debug routes, CORS.
- **A8. Data & Migrations:** Storage engine, schema constraints, migration reversibility, backup/restore status, offline local DB upgrade path.
- **A9. Test & CI Coverage:** Critical paths (money, auth, data writes), flaky tests, CI pipeline status.
- **A10. Release Readiness:** Versioning, installer/bundle build, update & rollback mechanism, env config, crash/error logging, pilot runbook.
- **A11. Tech Debt & Smells:** `TODO/FIXME` (with rationale = decision; without = debt, see [honesty.md](honesty.md)), dead code, monster files, workarounds bypassing i18n/formatters/kit.
- **A12. UX Snapshot:** Design tokens/kit adherence, i18n coverage, accessibility floor, "engineer-built" screens from A4 screenshots.
- **A13. Target Environment Footprint:** Startup time, RAM/CPU, initial network payload, offline behavior, bundle size.

## Output Template: `docs/release/ANALYSIS.md` (Write in Russian for the Owner)

Include sections:
1. `## Вердикт` (`близко / средне / далеко` + confidence + 2–3 lines why)
2. `## Что устроено` (stack, versions, LOC, platforms)
3. `## Базовая линия` (table: Check | Command | Result | Duration)
4. `## Что чисто` (verified healthy areas)
5. `## Что болит` (ordered by severity P0–P3 with `file:line` / command proof and user cost)
6. `## Карта функций (A5)`
7. `## Безопасность, данные, среда (A7, A8, A13)`
8. `## Снимок UX (A12)`
9. `## Неизвестно` & `## Кандидаты в блокеры пилота`
10. `## Предзаполнение интервью`
