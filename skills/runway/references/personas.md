# Role Personas & Editor Pass on a Live Build

Friction and perception bugs only surface when walking a live build end-to-end without the author's mental model.

## 1. Role Persona Protocol (Pass 2 & Gate G4)

Before launching a persona (or walking a role yourself when subagents are off):
1. Boot the real app/server with realistic seed data (plus a clean instance for first-run empty state).
2. Brief the persona with **only** the card below—never pass source files or your hypotheses:
   ```
   Role: <who, experience level, environment: rush hour, noise, slow network>
   Goal: <what they need to accomplish, in their own words>
   Constraints: <50 KB/s link, small screen, one-handed, non-native language>
   Environment: <URL / app launch command, demo credentials>
   Rules: interact strictly through the UI; never read source code. If a step is unclear, record it as a finding rather than guessing.
   ```
3. **Required output format:**
   - Step table: `# | Action | Expected | Observed | Stuck? | Severity (blocker/friction/minor)`
   - Outcome: goal reached? step count? where would a real user quit?
   - Confusing words/icons/states + screenshots at every stall point.
   - Verify every reported finding yourself before writing code; save logs in `docs/release/simulations/<date>-<role>.md`.

## 2. Editor Pass (Whole-Journey Check Before Delivery / Gate)

Built ≠ done, done ≠ cohesive. Passes 1–3 inspect slices and screens; the **Editor Pass** inspects the whole product after fixes, before handoff:
1. **Walk intentions, not screens:** Take 5–8 user goals in plain words ("receive stock", "see what's running low", "add a dish") and walk each from start to finish on the live build with a screenshot at every step.
2. **Cross-screen number & word reconciliation:** Status "all in stock" vs "6 running low", dashboard total vs report total, or one action under two names = a defect class, not a typo.
3. **Ask "Is it whole?":** On every screen along the path, check for half-finished dead ends (empty tab next to a populated counter, button with no next step, `"0 s."` instead of a starting prompt).
4. **Per-screen verdict (`≤10 lines` total):** `Ship` / `Refine (what)` / `Redesign (mockup)` + touch count per intention, cross-screen discrepancies, and what was not checked.
