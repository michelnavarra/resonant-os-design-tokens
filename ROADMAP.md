# ROSI: Roadmap
**Date:** 2026-06-15 (refreshed after repo restructure + browser-first audit)
**Status:** Phase 0 complete. Phase 1 atoms in planning, grounded in actual current dev team CSS.
**Owner:** Maestro (Orchestrator) + Michel (Lead Designer)
**Repo:** https://github.com/ResonantOS/2.0.0-alpha (branch `dev`)
**Local mirror:** `Nstudio/public-community/projects/resonant-os/`

---

## The Vision

ROSI = Resonant OS Interface. The public design system for the ResonantOS community.

Built from the real Browser extension UI (browser-first architecture), extracted into atomic tokens, and shipped as a living system the dev team can pull from.

```
Source: ResonantOS Browser Extension (browser-first architecture)
   ↓
Extraction: Atomic design tokens (W3C spec, v0.2, blue-gray + sage green, DRAFT)
   ↓
ROSI Design System: tokens.json + CSS + HTML guide + components
   ↓
Dev team consumes tokens in their extension CSS
```

---

## Important Update (2026-06-15)

### Repo restructure (d-023)
- Old: `ResonantOS/resonantos-vnext` (branch `main`)
- New: `ResonantOS/2.0.0-alpha` (branch `dev`)
- Architecture: `browser-first/resonantos-side-panel-extension/` replaces the legacy `src/modules/...` paths
- ROSI auto-sync (cron `rosi-repo-sync`) was silently broken for 3+ days because it requested `?ref=main` on a repo whose default is now `dev`. **Fixed 2026-06-15.** REPO, BRANCH, and WATCH_PATHS updated.

### Design system alignment: path (c) decided (2026-06-15, late session)

Michel chose path (c): **align both sides around a coherent palette drawn from
the v0.2 sage family and the current dev team vibrant green.** The Luma audit
and palette proposal (delivered same session) recommended **Coherent
Verdant** as the middle ground. Decision is in. Migration is in motion.

The drift:

| | v0.2 docs (sage on blue-gray) | Current impl (vibrant on near-black) | **v0.3 docs + impl (Coherent Verdant)** |
|---|---|---|---|
| Accent | `#8AB4A0` sage | `#24d18f` phosphor | **`#3FB286` Coherent Verdant** |
| Background | `#1A1E21` blue-gray | `#070a08` near-black | **`#0F1411` green-warm dark** |
| Text primary | `#E8EAED` neutral | `#EEF7F0` green-tint | **`#EAF1EC` green-warmth** |
| Borders | neutral gray | green-tinted | **green-tinted, calibrated alphas** |

**What changed:**

- `tokens/tokens.json` and `tokens/tokens.css` bumped from v0.2 to v0.3, with
  the new palette and a few new sizing tokens.
- New file: `reference/ui-extraction-browser-v3.md`. Replaces v0.2 as the
  canonical reference. Includes a full migration map (v0.2 → v3, and
  current impl → v3) plus the 5-atom spec grounded in the 9 screenshots.
- The dev team's `base-rail.css` 8 variables map cleanly to the new
  64-token system. Proposed patch is in
  `reference/ui-extraction-browser-v3.md` (section 0.2) and in
  `DEV-TEAM-REPORT.md`. The dev team will apply it themselves.

**5-atom spec, decided:**

Button, Card, Input, Badge (with Pill / Eyebrow / Dot sub-variants), Icon.
The "Tag" name from earlier was retired in favor of "Badge", the rendered
UI shows no removable tag pattern, only the "New" pill and the status dots.
Status dot is folded into Badge as the Dot sub-variant rather than its own
atom (recommendation from Luma; can be split out if it grows).

---

## Current State (2026-06-15)

### Done
- [x] v0.2 color palette extracted from Browser UI (60 tokens, 12 categories)
- [x] HTML Color Design System Guide built
- [x] Phase 0, tokens.json (W3C spec), tokens.css (CSS variables), shipped
- [x] Phase 0, GitHub repo `michelnavarra/resonant-os-design-tokens` (will transfer to ResonantOS/ org once invite clears)
- [x] Phase 0, auto-sync cron (rosi-repo-sync) registered and fixed to watch 7 files in the new browser-first architecture
- [x] Repo restructure: 10 → 7 watch paths on the new repo + branch
- [x] Audit of the actual current UI rendered (main-workspace + side-panel)

### In Progress
- [x] Phase 1, 5 atoms specced (Button, Card, Input, Badge, Icon) in `reference/ui-extraction-browser-v3.md`
- [x] Doc refresh (t-rosi-04), this file + DEV-TEAM-REPORT.md + new v3 extraction doc
- [ ] Michel sign-off on the v0.3 palette and the atom spec
- [ ] Phase 1.4, build atoms (CSS, HTML, accessibility patterns)
- [ ] Phase 1.5, document atom API for dev team consumption

---

## Phases

### Phase 0: Token Contract + GitHub Setup
**Status:** Done

| # | Task | Status |
|---|------|--------|
| 0.1 | tokens.json (W3C spec) | Done |
| 0.2 | tokens.css (CSS variables) | Done |
| 0.3 | GitHub repo creation | Done (`michelnavarra/resonant-os-design-tokens`) |
| 0.4 | Push initial structure | Done |
| 0.5 | Auto-sync cron (rosi-repo-sync) | Done, fixed 2026-06-15 to watch 7 paths on `dev` branch of new repo |
| 0.6 | Discuss sync strategy with Tom | Done (May 25-26 legendary session) |

### Phase 1: Component Foundation
**Status:** Atom spec drafted, awaiting Michel sign-off

| # | Task | Status |
|---|------|--------|
| 1.1 | Audit actual current dev team CSS variables, surfaces, and component patterns | Done 2026-06-15 |
| 1.2 | Decide design system alignment (a/b/c) | Done 2026-06-15, path (c) chosen, Coherent Verdant palette |
| 1.3 | Define 5 atoms: Button, Card, Input, Badge (Pill/Eyebrow/Dot), Icon, spec against current dev team CSS | Done 2026-06-15, see `reference/ui-extraction-browser-v3.md` |
| 1.4 | Build atoms (CSS, HTML, accessibility patterns) | Not started, blocked on Michel sign-off |
| 1.5 | Document atom API for dev team consumption | Not started, blocked on 1.4 |
| 1.6 | Hand off atoms to dev team | Blocked by 1.4 |

### Phase 2: Dev Team Sync + Consumption
**Status:** Next after Phase 1

| # | Task | Status |
|---|------|--------|
| 2.1 | Sync the new atoms to the dev team's extension CSS | Not started |
| 2.2 | Migrate legacy `src/modules/*.css` to use atom classes | Not started |
| 2.3 | Decide consumption mechanism (npm, Git submodule, copy-paste CSS, raw URL) | Open question for Tom |
| 2.4 | Org transfer (michelnavarra → ResonantOS) | Open question |

### Phase 3: Community Distribution
**Status:** Future

| # | Task | Status |
|---|------|--------|
| 3.1 | Chrome Web Store listing design assets | Open (do they need our design help?) |
| 3.2 | Community onboarding guide (design tokens usage) | Not started |
| 3.3 | Contribution guidelines for community designers | Not started |

---

## Dev Team Context (Current)

### Resonator sprint
The dev team needs our atoms before they start. Currently in planning.

### Chrome Web Store
Listing graphics + screenshots may need design help. Open question for Tom.

### Org access
We still need `ResonantOS/` org membership to transfer the repo. Open question.

### Sync mechanism
5 options on the table (npm, Git submodule, copy-paste CSS, raw URL, monorepo). Open question.

---

## Key Design Principles (from Melodi Blueprint, adapted for ROSI)

1. **The token layer is the contract.** No raw values in components.
2. **Dark only.** No light theme for ROSI.
3. **One accent.** Coherent Verdant (`#3FB286`), single accent family handles
   all primary interaction. Status tones (warning amber, error red, info
   blue) break from green only when semantics demand.
4. **Tonal layering, no shadows.** Surfaces differentiate by lightness and
   translucency, not elevation. Shadows reserved for overlays (popovers,
   modals).
5. **system-ui first.** Inter for display only. No Poppins, no JetBrains for
   ROSI. Mono is `ui-monospace` system stack.
6. **Accessible contrast is measurable.** Coherent Verdant on surface-base
   clears 7:1 (AAA). Primary text clears 16:1. Tertiary text is AA Large /
   AA UI only, never body text.
7. **Borders carry the brand.** Borders are green-tinted at calibrated
   alphas (0.14 to 0.55), not neutral gray. This is the visual signature
   that the v0.2 blue-gray path missed.
8. **Source of truth = the real Browser UI.** Not a concept, not a mockup.
   The 9 screenshots from 2026-06-15 are the reference.

---

## References

- Upstream repo: https://github.com/ResonantOS/2.0.0-alpha (branch `dev`)
- Our public tokens repo: https://github.com/michelnavarra/resonant-os-design-tokens
- Auto-sync watch script: `Nstudio/public-community/projects/resonant-os/design-system/.github/sync-watch.sh`
- Local clone for discovery: `/tmp/resonantos-alpha-tmp/`
- STATE.json references: rosi-public-series, t-rosi-01 through t-rosi-04, d-020 through d-023

---

*Last updated: 2026-06-15 23:05 GMT+2 by Luma (palette alignment + atom spec)*
*Previous update: 2026-06-15 21:14 GMT+2 by Maestro (doc refresh)*
*Next: Michel sign-off on v0.3 → Phase 1.4 atom build*
