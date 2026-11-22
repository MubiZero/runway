# Phase 2: Owner Interview

The owner makes decisions; you compute facts and propose options. Every question is pre-filled from Phase 1 (`ANALYSIS.md`). Talk to the owner in Russian.

## Rules
1. **One question per turn (one decision).** Show question number (`Вопрос 3 из N`), 2–4 options with your recommendation first (`(рекомендую)` + half-line reason from code).
2. **`"ок"` selects Option 1; `"остальное по умолчанию"` accepts recommendations for all remaining questions** (mark those in `PROFILE.md` as `по умолчанию`).
3. **Skip any question already answered** by code, owner rules (`working-style`, `stack`), or the initial prompt—state what you assumed in one line and move on.
4. **Write answers immediately** into `RELEASE.md` / `PROFILE.md` / `STATE.md` so an interrupted interview loses nothing.

## The 10 Topics (Ask Only Unsettled Ones)
1. **Release Target:** Pilot on 1–2 live locations / closed beta / public store release / internal launch.
2. **Timeline:** By gate readiness (recommended if no external deadline) vs fixed date (give effort estimate in sessions for P0/P1).
3. **Operating Environment:** Target OS versions, hardware (RAM/CPU), network speed/offline, device count, deployment mechanism.
4. **Roles & Critical Scenarios:** Confirm discovered roles + 3–5 core jobs each; pick the #1 critical pilot role.
5. **Release Gate Criteria:** Full set ([gate.md](gate.md) G1–G12) vs minimal set (G1, G2, G3, G4, G5, G8) vs custom.
6. **Autonomy Boundaries:** Default table from `SKILL.md` vs custom git/PR permissions (R5 actions always stay manual).
7. **Tech Change Policy:** Fix in current stack vs targeted adapter swap on proven gain (recommended) vs major migration after P0/P1.
8. **Subagents:** Check owner rules first (`working-style` forbids subagents unless requested in chat—if active, skip this question and record `по просьбе в чате`).
9. **Cut Order Under Time Pressure:** Cut P3 ideas first → P2 polish → non-core features; never cut reliability/data safety.
10. **P3 Bonus Ideas:** Propose top 3 high-value/low-cost ideas from analysis; park the rest in `STATE.md`.

## Wrapping Up Phase 2
Show `RELEASE.md` and the autonomy table from `PROFILE.md` in full, state the first queue item, and wait for `"поехали"`.
