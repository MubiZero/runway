---
name: runway
description: >-
  Drives an existing codebase from almost-done to release/pilot (6 phases: analysis, interview, contracts
  RELEASE/PROFILE/STATE, three passes, role personas, release gate) or audits one area without a release goal.
  Use on: "доведи до релиза", "подготовь к пилоту", "продолжай по STATE.md", "пройдись по продукту/админке",
  "свежий взгляд", "второй проход", "доведи до ума", take to release, audit and ship, review the product, polish this part.
---

# runway: From Almost-Done to Pilot

Projects stall before release because of three gaps: no definition of "done", no priority order (polish outruns blockers), and no cross-session memory. This skill closes all three: **inspect code first**, **agree on contracts with the owner**, then **execute autonomously** until the release gate turns green or only owner decisions remain.

Always communicate with the owner in Russian.

## Six Phases

| # | Phase | Output | Details |
|---|---|---|---|
| 1 | **Analysis** | `docs/release/ANALYSIS.md`: clean areas, pain points, unknowns—all backed by evidence | [analysis.md](references/analysis.md) |
| 2 | **Interview** | Owner decisions, one question at a time, pre-filled with options | [interview.md](references/interview.md) |
| 3 | **Contracts** | `RELEASE.md`, `PROFILE.md`, `STATE.md` from [templates/](templates/) | this file |
| 4 | **Map & Queue** | `Role × Screen × Scenario` matrix, P0–P3 queue | this file |
| 5 | **Loop** | Slice by slice: 3 passes, one PR/commit-series per class, role personas, cross-slice seams | [loop.md](references/loop.md) |
| 6 | **Gate** | Gate criteria verification, pilot checklist, final report | [gate.md](references/gate.md) |

Supporting guides: [personas.md](references/personas.md), [tech-choices.md](references/tech-choices.md), [pass-1-defects.md](references/pass-1-defects.md), [pass-1b-systems.md](references/pass-1b-systems.md), [pass-2-friction.md](references/pass-2-friction.md), [pass-3-design.md](references/pass-3-design.md), [working-method.md](references/working-method.md), [honesty.md](references/honesty.md).

## Priorities (P0–P3)

- **P0 (Pilot Blocker):** fails to build/install, loses data, security hole, critical role's primary flow broken.
- **P1 (Flow Broken / Unsafe Ops):** dead ends, silent failures, no rollback, no diagnostics.
- **P2 (Quality & Consistency):** missing UI states, hierarchy, copy, accessibility.
- **P3 (Ideas Beyond Scope):** enhancements after gate.

## Entry: Pick the Mode

- **`docs/release/STATE.md` exists (Resume):** Read `STATE.md`, `RELEASE.md`, `PROFILE.md`. Refresh analysis only on the git delta since last run. Jump straight into Phase 5.
- **No state files (Full Run):** Execute Phases 1 → 6.
- **Assessment only ("оцени состояние"):** Run Phase 1, deliver a concise report, stop and ask whether to proceed.
- **Single-slice audit without release goal ("пройдись по админке", "свежий взгляд", "второй проход", "доведи до ума"):** Light mode. Skip Phase 2 (release interview) and Phase 6 (gate); do not create `RELEASE.md`. Run Phase 1 on that slice only, then run the 3 passes in Phase 5 + seams with adjacent slices.
- **Read project rules first (`CLAUDE.md`, `AGENTS.md`, CONTRIBUTING):** Project rules override this skill.

## Phase 1–4 Summary

1. **Phase 1 (Read-Only Analysis):** Run baseline build/lint/tests (in a temp copy or clean tree). Separate **red project** (test failed) from **environment missing** (daemon/SDK absent). Write `docs/release/ANALYSIS.md` ([analysis.md](references/analysis.md)).
2. **Phase 2 (Interview):** Show a 5–8 line summary of Phase 1, create draft contract files, and ask questions one by one with pre-filled options and `(рекомендую)` ([interview.md](references/interview.md)). Skip any question already answered by code or owner rules.
3. **Phase 3 (Contracts):**
   - `RELEASE.md`: goal, deadline, gate criteria (each tied to a verbatim owner quote or `ANALYSIS.md` finding), non-goals. Owner clarifications continue the task; additions reopen affected criteria; only an explicit re-aim rewrites `RELEASE.md`.
   - `PROFILE.md`: target environment, roles, autonomy boundaries, tech policy, subagent policy, build/test/run commands.
   - `STATE.md`: priority queue, decision log, questions for owner, consciously deferred items, next step.
   Show `RELEASE.md` and the autonomy table from `PROFILE.md` in full and wait for `"поехали"`.
4. **Phase 4 (Map & Queue):** Build the `Role × Screen × Scenario` matrix in `STATE.md` (or `docs/release/MAP.md`). Order the queue top-down (`P0 → P1 → P2 → P3`). Never polish P2 while P0/P1 remain open.

## Phase 5–6 Summary

5. **Phase 5 (Loop — [loop.md](references/loop.md)):** Take the top slice from the queue and run:
   - **Pass 1 (Defects):** [pass-1-defects.md](references/pass-1-defects.md) & [pass-1b-systems.md](references/pass-1b-systems.md).
   - **Pass 2 (Friction):** [pass-2-friction.md](references/pass-2-friction.md) on a **running build** via role personas ([personas.md](references/personas.md)).
   - **Pass 3 (Design):** [pass-3-design.md](references/pass-3-design.md) from live rendered screenshots across states and widths (load `interface-limb` when available).
   - **Seams (Связки):** transitions between slices and adjacent roles.
   - Close one defect class per commit/PR with a guard test explaining *why*. Update `STATE.md`. Do not ask "continue?" between slices.
6. **Phase 6 (Gate & Report — [gate.md](references/gate.md)):** Verify `RELEASE.md` criteria after the final edit, check the pilot checklist, and output the Russian report below.

## Default Autonomy Boundaries

| Do Autonomously | Explicit Owner Command Only (R5) |
|---|---|
| Code, tests, refactoring in scope | Production deploy, prod DB migrations |
| Local branches and commits | `git push`, opening/merging PRs, force-push |
| Local dev dependencies & local runs | Publishing to stores, sending messages, payments, deleting data |
| Research, reading docs; subagents if allowed in `PROFILE.md` | Changing permissions or weakening auth, validation, rate limits, or audit logs |

## Report Format (Reply to Owner in Russian)

```
**Что сделал:** <project, phases, N slices, N commits/PRs>.
**Анализ:** до пилота было <далеко/средне/близко>, потому что <1–2 facts>. Сейчас: <gate verdict>.
**Закрыто:** <by slice, in queue order: what hurt the user → what happens now>.
**Не сделано осознанно:** <item, reason, cost, threshold/owner decision>.
**Нужно от вас:** <up to 5 questions from STATE.md, with recommendation>.
**Проверено (команды и числа):** <build, test, lint, CI, simulations, benchmarks after final edit>. **Вердикт gate:** <G1..G12 separately from command outputs>. **Не проверено:** <what and why>.
**Дальше:** <next major project slice>.
```
