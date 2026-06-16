# ROSI Design System: Status Report for Dev Team
**Date:** 2026-06-15 (refreshed after palette alignment + atom spec; previous version 2026-05-29, then 21:14)
**From:** Michel Navarra + Maestro + Luma
**To:** Tom + ResonantOS Dev Team
**Subject:** Palette aligned (path c, Coherent Verdant), atom spec drafted, 8-var patch ready for your call

---

## TL;DR

- Sync restored after the `ResonantOS/resonantos-vnext` → `ResonantOS/2.0.0-alpha` (branch `dev`) restructure
- Audit complete on the actual current browser-first UI (9 screenshots)
- **Design system alignment: path (c) decided.** Palette is now Coherent
  Verdant, a calibrated middle ground between v0.2 sage and your current
  vibrant green. `tokens/tokens.json` and `tokens/tokens.css` are at v0.3.
- **5-atom spec is drafted** in `reference/ui-extraction-browser-v3.md`.
  The 8 variables in your `base-rail.css` map cleanly to the new
  64-token system with a small, low-risk patch.
- **Action requested:** review the proposed patch below, confirm timing on
  when the dev team can apply it. No migration is required on the
  class-by-class CSS, only the `:root` values change.

---

## Sync: Fixed

The ROSI auto-sync (`rosi-repo-sync` cron) was silently broken for 3+ days. The watch script requested `?ref=main` on a repo whose default branch is now `dev`, every watched path returned 404, the script silently skipped them, and the `.sync-state.json` `last_check` stopped updating.

**Fix applied 2026-06-15:**

- REPO: `ResonantOS/resonantos-vnext` → `ResonantOS/2.0.0-alpha`
- BRANCH: `main` → `dev`
- WATCH_PATHS: pivoted from 10 legacy `src/modules/...` paths to 7 paths in the new browser-first architecture
  - `browser-first/resonantos-side-panel-extension/src/main-workspace.css`
  - `browser-first/resonantos-side-panel-extension/src/side-panel.css`
  - `browser-first/resonantos-side-panel-extension/src/styles/main-workspace/base-rail.css`
  - `browser-first/resonantos-side-panel-extension/src/styles/main-workspace/workspace-modules.css`
  - `browser-first/resonantos-side-panel-extension/src/styles/side-panel/base-layout.css`
  - `browser-first/resonantos-side-panel-extension/src/styles/side-panel/messages.css`
  - `docs/architecture/ADR-017-resonant-browser-addon.md`

Manual run after the fix: all 7 paths returned real SHAs. From tomorrow's 9 AM Paris run onward, we'll get real change alerts.

---

## Audit: What the Current UI Actually Looks Like

We rendered the main workspace (full app shell, the new-tab override) and the side panel (Augmentor chat) locally and took screenshots. Key observations:

### Main workspace
- Sidebar (rail) with R logo, primary actions (New chat, Search, Add-ons, Artifacts), Tools section (Living Archive, Hermes, OpenCode), Projects (with "New" badge), Chats, User profile, Settings
- Hero: "Ask, browse, remember, delegate." in a large serif display face
- 6 suggestion cards (Strategy, Web, Page, Risk, Memory, Delegate) with category eyebrow + title
- BEM-style class names (`.workspace-shell`, `.rail-item`, `.addons-hero`, etc.), inline SVG icons, no external icon font, no CSS framework

### Side panel
- Minimal chat shell
- Bottom message input with toolbar (attach, model selector "Minimal", mic, sparkle, 0% quota, send)
- Same design language as the main workspace

### Visual observations
- Dark green-tinted radial gradient at the top-left as ambient accent
- Typography: system-ui body, large serif display headline
- Restrained color usage (one accent, in eyebrows + send button)
- Clean visual hierarchy
- Borders across all cards and inputs are green-tinted, not neutral, this
  is the design character that v0.2 missed and that we want to preserve

---

## Design System Alignment: Path (c) Decided

Michel chose path (c), align both sides around a coherent palette. Luma's
audit and palette proposal recommended **Coherent Verdant** as the
middle-ground option. Both sides converged.

### The drift: before and after

| | v0.2 docs (sage on blue-gray) | Your `base-rail.css` (vibrant on near-black) | **v0.3 aligned (Coherent Verdant)** |
|---|---|---|---|
| Accent | `#8AB4A0` sage | `#24d18f` phosphor | **`#3FB286` Coherent Verdant** |
| Background | `#1A1E21` blue-gray | `#070a08` near-black | **`#0F1411` green-warm dark** |
| Text primary | `#E8EAED` neutral | `#EEF7F0` green-tint | **`#EAF1EC` green-warmth** |
| Borders | neutral gray | green-tinted | **green-tinted, calibrated alphas** |

The new green is between your current phosphor and the v0.2 sage. It keeps
the visual energy of what shipped, calibrated for longer sessions and
slightly more legible on the rail surface. The new background drops the
blue-gray and lands on a green-warm dark that matches the green-tinted
character your borders already have.

### What changed in the design system

- `tokens/tokens.json` and `tokens/tokens.css` bumped from v0.2 to v0.3.
  Token count: 60 → 64. New tokens cover calibrated border alphas
  (subtle/default/strong/glow) and sizing (icon, avatar, control heights)
  that came out of the audit. All other categories preserved.
- New file: `reference/ui-extraction-browser-v3.md`. Replaces v0.2 as the
  canonical reference. Includes a full migration map (v0.2 → v3, and
  current impl → v3) plus the 5-atom spec.
- The 8 variables in your `base-rail.css` map cleanly to the new token
  system. The class-by-class work in `workspace-modules.css` and
  `settings.css` is unaffected. Only the `:root` values change.

---

## Proposed CSS Patch for the Dev Team

This is a proposal, not an edit. We will not touch the extension files.
Apply when you're ready.

```diff
--- a/browser-first/resonantos-side-panel-extension/src/styles/main-workspace/base-rail.css
+++ b/browser-first/resonantos-side-panel-extension/src/styles/main-workspace/base-rail.css
@@ -1,11 +1,13 @@
 :root {
   color-scheme: dark;
-  --bg: #070a08;
-  --rail: rgba(255, 255, 255, 0.045);
-  --panel: rgba(17, 22, 19, 0.86);
-  --line: rgba(148, 255, 198, 0.13);
-  --text: #eef7f0;
-  --muted: #909d95;
-  --accent: #24d18f;
-  --accent-strong: #18bd7d;
+  --bg: #0F1411;
+  --rail: rgba(255, 255, 255, 0.055);
+  --panel: rgba(28, 36, 31, 0.94);
+  --line: rgba(63, 178, 134, 0.14);
+  --text: #EAF1EC;
+  --muted: #A3B1A8;
+  --accent: #3FB286;
+  --accent-strong: #2DA176;
 }
```

### Why these specific values

- **`--bg` `#070a08` → `#0F1411`:** Drops the pure-near-black, picks up
  green-warmth. ~2 hex points lighter, blends with the green-tinted
  borders instead of fighting them.
- **`--rail` `rgba(255,255,255,0.045)` → `rgba(255,255,255,0.055)`:** Slight
  alpha bump for a touch more hover contrast. The hover state was hard to
  read against the deep base.
- **`--panel` `rgba(17,22,19,0.86)` → `rgba(28,36,31,0.94)`:** Same character,
  slightly more opaque (0.86 → 0.94) and slightly more green-shifted. The
  current panel reads as muddy against the new base.
- **`--line` `rgba(148,255,198,0.13)` → `rgba(63,178,134,0.14)`:** Calibrates
  the border tint to the new accent. Same family, same alpha, but no longer
  tuned to a brighter green than the accent itself.
- **`--text` `#EEF7F0` → `#EAF1EC`:** Slight convergence with the
  text-secondary warmth. Maintains ~16:1 contrast on the new base.
- **`--muted` `#909d95` → `#A3B1A8`:** Brightness lift for AA contrast on
  the new base (~8.4:1, up from ~7.4:1).
- **`--accent` `#24d18f` → `#3FB286`:** The main shift. New green is
  calmer, more legible on long sessions, still vibrant. ~7.2:1 on
  surface-base.
- **`--accent-strong` `#18bd7d` → `#2DA176`:** Calibrated to the new default.
  Still darker than the default for pressed state.

### What this does NOT change

- The 8 variable names (`--bg`, `--rail`, `--panel`, `--line`, `--text`,
  `--muted`, `--accent`, `--accent-strong`) stay the same. The migration
  to the v3 token names is a separate, longer-term change. We can do that
  when the dev team is ready to consume `tokens.css` directly.
- Every class in `workspace-modules.css`, `settings.css`, `composer.css`,
  `answer-browser-jobs.css`, `responsive.css` is untouched. The values
  cascade from `:root`.
- The `body` background gradient and the `body[data-font-scale]` /
  `body[data-density]` rules are untouched. The new values are
  intentionally close enough that the visual character is preserved.

### What we need from you

- A "looks good" or "needs tweak" on the values above.
- Timing on when the dev team can apply. We do not need it before Phase 1
  atoms build, the v3 token doc is the contract for the new atoms, not
  for the running extension.
- A go/no-go on the longer-term question: consume `tokens.css` directly
  via `@import` (or copy-paste the `:root` block into `base-rail.css`),
  or keep your own 8 variables and use ours as a reference.

---

## Phase 1: Atoms (spec drafted, awaiting Michel sign-off)

Five atoms, grounded in the 9 screenshots. Full spec in
`reference/ui-extraction-browser-v3.md` section 2.

- **Button**, primary pill, secondary pill, send (circular), icon (square),
  ghost (nav). Five sub-variants. The current `addons-grid` cards and the
  settings subnav are atom compositions of Button + Card.
- **Card**, base, metric, status-tone, subnav, elevated, disclosure.
  Six sub-variants. Every "card-shaped" element in the screenshots
  (memory cards, add-on cards, settings subnav, settings provider card)
  is a Card atom.
- **Input**, text, search (with attached button), textarea, select.
  Four sub-variants. The form fields, the Augmentor system prompt
  textarea, the Add a Source form, and the Search Memory input all use
  this atom.
- **Badge**, Pill (the "New" tag, capability tags, status pills),
  Eyebrow (the uppercase labels above section titles), Dot (the
  8-10px status indicators). Three sub-variants. Status Dot is folded
  into Badge rather than being its own atom (Luma's recommendation , 
  can split out if it grows).
- **Icon**, inline SVG, 4 sizes (xs/sm/md/lg/xl), 1.5-2px stroke,
  `currentColor` fill. The current impl already uses this pattern
  uniformly; the atom just makes the sizing and color rules explicit.

**Naming change from earlier:** "Tag" was retired in favor of "Badge" since
the rendered UI shows no removable tag pattern. "Component-Label" was the
middle-ground suggestion, but "Badge" reads cleaner with the Pill /
Eyebrow / Dot sub-variants and matches common design system vocabulary
(Radix, Carbon, Spectrum all use "Badge" for the same pattern family).

---

## Open Questions

| # | Question | Status |
|---|----------|--------|
| 1 | Dev team to confirm the proposed patch (values, timing, consumption model) | New, awaiting dev team |
| 2 | How does the dev team want to consume tokens long-term? (npm / Git submodule / copy-paste / raw URL) | Still open. The short-term patch above is value-only, the long-term question is separate |
| 3 | Auto-update flow direction? (Option A watch / B import / C webhook) | Still open, but moot if both repos are in sync via the patch above |
| 4 | Resonator sprint timeline? | Still open. We need atoms built (Phase 1.4) before you start. Blocked on Michel sign-off + build |
| 5 | Chrome Web Store, do you need design assets from us? | Still open. We can produce listing graphics + screenshots once you confirm |
| 6 | Org access for `ResonantOS/` membership? | Still open. The repo is still under `michelnavarra/resonant-os-design-tokens` |

Resolved:
- ~~Design system alignment (a, b, or c)~~, path (c) decided, palette at v0.3

---

## What's Next

1. **You (dev team):** review the proposed patch, confirm timing
2. **Michel:** sign off on the v0.3 palette and the 5-atom spec
3. **Luma:** build the atoms (CSS, HTML, accessibility patterns) once Michel signs off
4. **Dev team:** apply the patch at your convenience; consume the new atoms as they ship
5. We can produce Chrome Web Store listing graphics and onboarding guide materials at any point

---

*Refreshed 2026-06-15 23:05 GMT+2 by Luma (palette alignment + atom spec)*
*Previous: 2026-06-15 21:14 GMT+2 by Maestro (doc refresh)*
*Original: 2026-05-29 (Michel + Maestro)*
