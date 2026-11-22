# Working Method: Recon, PR Discipline, Guard Tests & Merging

## 1. Pre-Pass Recon
1. Scope & size (file count, LOC, boundaries).
2. Architecture map (routes/screens, API clients, shared layers, server handlers).
3. Baseline test run of the target slice/package.
4. Project conventions (commit style, i18n catalog guard tests, no AI attribution).

## 2. Delegating Inventory (Only When Subagents Are Authorized)
When the owner or `PROFILE.md` authorizes subagents, fan out up to 4 read-only inventory tasks:
- **A. Double-Tap Audit:** Inspect all mutating buttons/forms in `<path>` for busy state and `disabled` styling; return protected vs unprotected tables (`file:line`, action, duplicate risk).
- **B. Section States Audit:** Inspect every data-loading view for loading indicator, specific error parsing, retry action, and actionable empty state; list dead ends.
- **C. i18n & Formatter Bypass Audit:** Find hardcoded UI strings, custom date/number/money formatters bypassing shared utilities, manual pluralization, and untranslated enum codes.

*(Without explicit subagent authorization, run these checks directly in the main session using `rg` and `ds_audit.sh`.)*

## 3. One Defect Class = One Commit Series / PR
- **Title expresses an invariant**, not a category: `"Requests time out and retry without duplicates"` instead of `"fix: add timeouts"`.
- **Body covers 4 items:** (1) user impact in plain words, (2) root cause fixed in the shared layer, (3) verification numbers, (4) any user-visible behavior change.
- Close the entire class across the slice; a half-closed class is worse than untouched.

## 4. Guard Tests Explain *Why*
Write test descriptions and a 2-line comment stating the real-world failure mode the test prevents (e.g., lost response + second click reusing the same idempotency key) so future refactors never strip the invariant. Delete dead i18n keys in the same commit that removes their usage.

## 5. Pre-Commit Checks
```
Affected package + regression tests — green (full repo suite runs at Phase 6 Gate by lead agent)
Compiler / typecheck                — zero errors
Linter                              — zero warnings/errors
i18n / design-system guard tests    — green
Generated contracts / l10n          — regenerated with zero leftover git diff
```
