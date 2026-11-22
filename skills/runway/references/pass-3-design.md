# Pass 3: Design & Perception (11 Classes)

> **Judge from rendered screenshots across all states and widths, never from code.** Load `interface-limb` when available for exact contrast, touch-target, motion, and i18n standards.

Question: **Does this read as a considered product, or as a database dump wired by an engineer?**

## Eleven Visual & Perception Classes

1. **Flat Hierarchy (Everything Equally Loud):** Six identical buttons in a row; section header larger than the primary number; destructive action styled like routine export. *Fix:* One primary focal point and one primary CTA per screen; secondary actions muted; destructive actions separated.
2. **Missing Data States:** Only the happy populated state is designed; missing loading, empty (with CTA), error (with reason + retry), partial failure, offline, or no-permission states. *Fix:* Build a shared state wrapper handling all 6 states consistently.
3. **Missing Micro-States on Quiet Controls:** Primary button has hover/disabled, but tabs, table rows, chips, icon buttons, and breadcrumbs lack `:focus-visible`, `:active`, `:hover`, or visual `:disabled`. *Fix:* Bake all interaction states into shared kit components.
4. **Perceived Slowness & Layout Shift:** Spinners instead of geometry-matched skeletons; spinner flashing on <150 ms responses; background refresh wiping the screen; no <100 ms touch feedback. *Fix:* Delayed skeletons matching final layout, optimistic updates where rollback is cheap.
5. **Broken Rhythm, Density & Number Alignment:** Magic pixel spacing (`7px`, `13px`, `22px`) instead of a 4/8 scale; numbers left-aligned with proportional digits; airy cards where an operator needs a dense table. *Fix:* Token spacing scale, right-aligned `tabular-nums` for numbers/money.
6. **Color Alone Carrying Meaning:** Income/expense or status distinguished only by red vs green; decorative gradients with no semantic role. *Fix:* Pair color with explicit sign (`+1 200` / `−1 200`), word, or icon.
7. **Engineer Jargon & Fragmented Copy (`interface-limb/references/i18n.md`):** Internal terms (`tenant`, `storno`, `stable`) shown to users; one concept named three ways across adjacent screens; concatenated string fragments breaking pluralization. *Fix:* Glossary guard test + full-sentence ICU MessageFormat strings.
8. **Accessibility & Semantic Violations:** Contrast below 4.5:1 (3:1 UI/large text), touch targets below 44 pt / 48 dp, `<div onClick>` instead of `<button>`, button inside `<label>`, icon buttons without `aria-label`/tooltip. *Fix:* Semantic controls, visible focus ring, standard target sizes.
9. **Kit & Token Drift:** Inline hex colors and one-off dialogs next to a shared UI kit (`ds_audit.sh` >10% literals). *Fix:* Move variants into the shared kit and delete screen-level overrides.
10. **Asymmetric Half-Features:** "Collapse" and "Close" exist without "Expand"; "Create" without "Delete"; filter on column A but not adjacent column B. *Fix:* Complete the lifecycle symmetry or state explicitly why an inverse is absent.
11. **"Database Schema on Screen":** Form fields ordered by SQL columns, raw UUIDs visible, ungrouped long tables, or missing totals forcing the user to do mental arithmetic. *Fix:* Group by user task, hide internal IDs, pre-calculate totals and deltas.
