# Pass 2: Scenario Friction (10 Classes)

> **Run on a live build, not from code.** Walk 5–8 real end-to-end jobs per role on the running application ([personas.md](personas.md)).

## Ten Friction Classes

1. **Silently Stale Dashboard Data:** A live shift screen ("Now") shows a snapshot from 1 hour ago without a timestamp or background refresh, or flashes a full-screen skeleton every minute. *Fix:* Show `"Updated HH:MM"` + non-disruptive background refresh (paused when tab is hidden).
2. **Asking for Input the User Cannot Know:** Filter or form demands a UUID/internal key instead of a human name or substring search. *Fix:* Search/select by human name while keeping ID lookup as a fallback.
3. **Multi-Step Detour for a Single Action:** A one-time access code or invite link is buried in a table cell without a one-click copy/share button. *Fix:* Complete the user's downstream action inside the product (copy button + confirmation).
4. **Unnotified Async Outcome:** User submits an order/request that freezes funds or blocks work, and must manually pull-to-refresh a list to learn the result. *Fix:* Push/SSE notification localized in the user's language.
5. **Missing Drill-Down Link:** A statement total, debtor row, or device alert has no clickable link to the underlying receipt, invoices, or device. *Fix:* Make every summary or alert row navigate directly to its source.
6. **Blank First-Run State Without an Action:** Empty screen says "Nothing here yet" with no next-step guidance or primary CTA button (or conversely, the "Create" button disappears once the list is non-empty). *Fix:* Actionable empty state + persistent primary action.
7. **Form Asking for Redundant Input:** Mandatory fields computable from context, manual date pickers when 99% of entries are "today/now", or empty defaults instead of the most common choice. *Fix:* Pre-fill smart defaults and cut derivable fields.
8. **Broken Locale Handoff:** App UI is localized, but emails/SMS/push notifications arrive in another language, or the language switcher is hidden behind login. *Fix:* Put language selection on the very first screen and propagate locale end-to-end.
9. **Action Without Immediate Feedback:** Tapping a button (especially search, test-send, or export) produces zero visual response for seconds. *Fix:* <100 ms press state, delayed progress indicator, and clear completion feedback.
10. **Asymmetric Confirmation Gates:** Irreversible destructive actions fire immediately without confirmation/reason, while harmless routine clicks nag with modal dialogs. *Fix:* Reserve confirmation (with consequence summary and reason/undo) strictly for irreversible actions.
