# ROSI Design System — Status Report for Dev Team
**Date:** Friday, May 29, 2026
**From:** Michel Navarra + Nami
**To:** Tom + ResonantOS Dev Team
**Subject:** ROSI Design Tokens are live on GitHub

---

## What We Built

A public design token system extracted from the real Browser extension UI — **not a concept, not a mockup**. This is the visual contract between design and engineering.

### GitHub Repo
**🔗 https://github.com/michelnavarra/resonant-os-design-tokens**
(Public — will transfer to `ResonantOS/` org once invite clears)

---

## What's Inside

### Token Files
| File | Format | Tokens | Description |
|------|--------|--------|-------------|
| `tokens/tokens.json` | W3C Design Tokens spec | 60 | Source of truth — machine-readable |
| `tokens/tokens.css` | CSS custom properties | 60 | Ready to `@import` — `--rosi-color-*` |
| `tokens/color-palette-v0.2.md` | Markdown | 60 | Human-readable palette documentation |

### 12 Token Categories
| Category | Tokens | Key Values |
|----------|--------|------------|
| Surfaces | 5 | `#1A1E21` → `#323940` (tonal depth layers) |
| Borders | 3 | default, subtle, strong |
| Text | 4 | primary `#E8EAED`, secondary, tertiary, inverse |
| Accent | 4 | Muted sage green `#8AB4A0` family |
| Semantic | 6 | success, warning, error (fg + bg) |
| Chrome | 4 | Tab bar `#292D32`, active tab, toolbar |
| Typography | 9 | system-ui + Inter display, 6 sizes |
| Spacing | 8 | 2px → 64px scale |
| Radius | 4 | 4/8/12/16px |
| Elevation | 4 | Shadow levels |
| Motion | 4 | Duration tokens |
| Z-Index | 7 | Layer stacking |

### Reference Material
All sourced from the live `resonantos-vnext` repo:
- `browser-live.css` — full Browser module CSS (698 lines)
- `base-styles.css` — app shell CSS variables
- `shell-styles.css` — layout styles
- `ADR-017-resonant-browser-addon.md` — architecture decision
- `UX-001-resonantos-app-shell.md` — UX specification
- UI screenshots (home + agent panel)

### Visual Guide
`guide/rosi-color-design-system-guide.html` — standalone interactive HTML with swatches, contrast ratios, live demos, copy-to-clipboard. Zero dependencies.

---

## Design Decisions (v0.1 → v0.2 Shift)

| | Old (v0.1) | New (v0.2 — Current) |
|---|---|---|
| Backgrounds | Forest green `#060F0A` | Blue-gray `#1A1E21` |
| Accent | Phosphor Green `#4ADE80` (loud) | Sage Green `#8AB4A0` (muted) |
| Violet accent | Yes `#A855F7` | **Gone. One accent.** |
| Light theme | Planned | **No. Dark only.** |
| Typography | Poppins/Inter/JetBrains | system-ui + Inter display |
| Source | Internal concept | **Real Browser extension UI** |

---

## How to Use

### CSS (simplest)
```css
@import url('https://raw.githubusercontent.com/michelnavarra/resonant-os-design-tokens/main/tokens/tokens.css');

.my-panel {
  background: var(--rosi-color-surface-raised);
  border: 1px solid var(--rosi-color-border-default);
  color: var(--rosi-color-text-primary);
  border-radius: var(--rosi-radius-md);
  padding: var(--rosi-spacing-4);
}
```

### JSON (build tools)
```js
import tokens from './tokens/tokens.json';
// tokens.color.surface.raised.$value → "#1E2327"
```

---

## Repo Structure
```
resonant-os-design-tokens/
├── tokens/                  ← Source of truth
│   ├── tokens.json          W3C spec
│   ├── tokens.css           CSS custom properties
│   ├── color-palette-v0.2.md  Current docs
│   └── color-palette-v0.1.md  Archived
├── guide/                   ← Visual docs
│   └── rosi-color-design-system-guide.html
├── reference/               ← Your source material
│   ├── browser-live.css
│   ├── base-styles.css
│   ├── shell-styles.css
│   ├── ADR-017-...
│   ├── UX-001-...
│   ├── screenshots/
│   └── ...
├── components/              ← Phase 1 (coming)
├── dashboard/               ← Phase 2 (self-updating)
├── .github/
│   ├── sync-watch.sh        Upstream change monitor
│   └── workflows/           CI/CD (coming)
├── README.md
├── CHANGELOG.md
├── LICENSE (MIT)
└── ROADMAP.md
```

---

## Auto-Sync

We're running an automated watch on the `ResonantOS/resonantos-vnext` repo. Every weekday at 9:00 AM Paris time, we check 10 CSS/design files for changes. If Tom or the team updates anything, we get alerted and pull the latest into our reference folder.

**Watched files:**
- `src/styles/base.css`, `shell.css`, `responsive.css`, `workspace-cards.css`
- `src/modules/browser/browser.css`, `chat-rail.css`, `messages.css`, `delegation.css`
- `docs/product/UX-001-...`, `docs/architecture/ADR-017-...`

---

## Open Questions for Tom (Tonight 20h)

1. **How does the dev team want to consume tokens?**
   - npm package?
   - Git submodule?
   - Copy-paste CSS?
   - Direct import from GitHub raw URL?

2. **Auto-update flow — which direction?**
   - Option A: We watch your repo → pull changes → update tokens
   - Option B: You import our CSS → we stay in sync via git
   - Option C: GitHub webhook on your repo → we auto-update

3. **Resonator sprint timeline?**
   - We need atoms ready before the Resonator build sprint starts
   - Phase 1 (components) is our next priority

4. **Chrome Web Store — do you need design assets from us?**
   - Screenshots, listing graphics, icons?

5. **Org access — can we get `ResonantOS/` org membership?**
   - To transfer the repo under the official org

---

*Built by Michel Navarra + Nami (OpenClaw agent) + Sokar + Luma*
*Nstudio — Build System*
