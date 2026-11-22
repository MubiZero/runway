# Phase 5: Autonomous Execution Loop

Work top-down through the queue in `STATE.md` without asking "continue?" between slices.

## Iteration Algorithm (Per Slice)
1. Read top queue item, `PROFILE.md` (commands & boundaries), and slice notes in `STATE.md`.
2. Recon the slice and run its baseline package tests.
3. **Pass 1 (Defects):** close applicable classes from [pass-1-defects.md](pass-1-defects.md) & [pass-1b-systems.md](pass-1b-systems.md).
4. **Pass 2 (Friction):** walk role scenarios on a **running build** ([pass-2-friction.md](pass-2-friction.md), [personas.md](personas.md)).
5. **Pass 3 (Design):** inspect live rendered screenshots across all states and widths ([pass-3-design.md](pass-3-design.md); use `interface-limb` standards).
6. **Seams (Связки):** verify cross-slice transitions, cross-role handoffs (guest ↔ staff), consistent terminology, and shared state (offline, expired session, no permission).
7. Run affected + regression tests, compiler/types, and linter; commit one defect class per commit/PR; update `STATE.md`.

*(Never run Pass 2/3 polish on a slice while P0/P1 blockers remain open in the queue.)*

## Verification & Subagent Rules
- **Tests:** Before every commit, run affected package tests + surrounding regression, typecheck, lint, and i18n catalog guards. The full repository test suite runs once by the lead agent at Phase 6 Gate (never by subagents).
- **Subagents:** Launch only if authorized by the owner / `PROFILE.md` (≤2 test/build agents, ≤4 read-only; non-overlapping files; verify every finding yourself before fixing).
- **Stop Conditions:** Stop and deliver the Russian report when: (1) Gate is green, (2) only owner-blocked questions remain, (3) two consecutive loops make zero progress, or (4) an R5 action is required to proceed.
