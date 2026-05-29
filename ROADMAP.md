# ROSI — Roadmap
**Date:** 2026-05-28
**Status:** Active — Phase 0 in progress
**Owner:** Nami (Orchestrator) + Michel (Lead Designer)
**Repo (target):** `github.com/michelnavarra/ROSI-design-system` → `ResonantOS/ROSI-design-system`

---

## The Vision

**ROSI = Resonant OS Interface** — the public design system for the ResonantOS community.

Built from the real Browser extension UI (browser-first architecture), extracted into atomic tokens, and shipped as a living system the dev team can pull from.

```
Source: ResonantOS Browser Extension (built by Tom + Manolo + Analog 6)
   ↓
Extraction: Atomic design tokens (v0.2 — blue-gray + sage green)
   ↓
ROSI Design System: tokens.json + CSS + HTML guide + components
   ↓
GitHub Repo: dev team syncs, auto-updates flow both ways
```

---

## Identity Shift: v0.1 → v0.2

| | Old (v0.1 — Sokar Dashboard) | New (v0.2 — Browser Extension) |
|---|---|---|
| Backgrounds | Forest green #060F0A | Blue-gray #1A1E21 |
| Accent | Phosphor Green #4ADE80 (loud) | Sage Green #8AB4A0 (muted) |
| Violet accent | Yes #A855F7 | Gone. One accent only |
| Light theme | Planned | No. Dark only |
| Depth | Shadows | Tonal layering, no shadows |
| Typography | Poppins/Inter/JetBrains | system-ui + Inter display only |
| Source | Internal concept | Real Browser extension UI |

---

## Current State (May 28, 2026)

### ✅ Completed
- [x] v0.2 color palette extracted from Browser UI (60 tokens, 12 categories)
- [x] HTML Color Design System Guide built (~1,207 lines, Luma)
- [x] Too-green issue fixed (v0.1 → v0.2 palette)
- [x] Component contrast improved against body background
- [x] Claude extraction: 8 atoms, 17 molecules, 9 organisms, 2 templates
- [x] Reference screenshots and design docs archived

### 📁 File Inventory
```
design-system/
├── design-tokens/
│   ├── color-palette-v0.1.md          ← archived (old Sokar dashboard)
│   ├── color-palette-v0.2.md          ← canonical (new Browser)
│   └── rosi-color-design-system-guide.html  ← Luma's HTML guide
└── reference/
    ├── dashboard-live.css              ← old
    ├── DESIGN-spec.md                  ← old Sokar spec
    ├── DESIGN-browser-community.md     ← new — from Claude extraction
    ├── ui-extraction-browser.md        ← new — full atomic extraction
    ├── screenshot01-browser-home.png
    └── screenshot04-browser-agent.png
```

---

## Phases

### Phase 0 — Token Contract + GitHub Setup
**Status:** 🔄 In Progress
**Owner:** Michel + Nami

| # | Task | Owner | Status |
|---|------|-------|--------|
| 0.1 | Create `tokens.json` (W3C Design Tokens spec) from v0.2 palette | Nami | Not started |
| 0.2 | Create `tokens.css` (CSS custom properties) | Nami | Not started |
| 0.3 | Create GitHub repo `ResonantOS/ROSI-design-system` | Michel | Not started |
| 0.4 | Push initial structure to GitHub | Nami | Blocked by 0.3 |
| 0.5 | Set up auto-sync cron (pull dev team changes daily, alert us) | Nami | Blocked by 0.4 |
| 0.6 | Discuss sync strategy with Tom (Zoom 20h tonight) | Michel | Scheduled |

### Phase 1 — Component Foundation
**Status:** 🔜 Next
**Owner:** Michel + Luma/Eiko

| # | Task | Owner | Status |
|---|------|-------|--------|
| 1.1 | Define first 5 atoms from Browser UI extraction | Michel + Agent | Not started |
| 1.2 | Build atoms: Button, Badge, Input, Tag, Icon | Agent | Blocked by 1.1 |
| 1.3 | Build key molecules: Card, Panel, NavItem, FormField | Agent | Blocked by 1.2 |
| 1.4 | Build organisms: SidePanel, WalletPanel, ChatPanel | Agent | Blocked by 1.3 |
| 1.5 | Integrate with actual Browser extension CSS | Nami + Tom | Blocked by 1.4 |

### Phase 2 — Dashboard + Self-Updating
**Status:** 🔜 Future
**Owner:** Nami + Dev Team

| # | Task | Owner | Status |
|---|------|-------|--------|
| 2.1 | Build self-updating status dashboard | Nami + Agent | Blocked by Phase 1 |
| 2.2 | Dashboard shows: token version, component count, sync status | Agent | Blocked by 2.1 |
| 2.3 | Connect to GitHub webhook for live updates | Nami | Blocked by 2.1 |
| 2.4 | Visual regression testing (automated) | Agent | Blocked by Phase 1 |

### Phase 3 — Community Distribution
**Status:** 🔜 Future
**Owner:** Michel + Community

| # | Task | Owner | Status |
|---|------|-------|--------|
| 3.1 | Chrome Web Store listing design assets | Michel | Not started |
| 3.2 | Community onboarding guide (design tokens usage) | Agent | Blocked by Phase 1 |
| 3.3 | Contribution guidelines for community designers | Michel | Not started |

---

## Dev Team Context (from Tom's Report — May 25-26)

The Legendary Session delivered:
- Chrome/Brave/Edge extension with 8 side panels
- Augmentor AI (13 models, 6 providers)
- Resonant Context SDK (the moat — viewport tracking, dwell time, behavioral patterns)
- Resonant Blackboard (6 rendering modes)
- 4 installation paths (macOS dmg, macOS curl, Linux, Windows)
- 2 security audits passed, ~12,000+ lines of code

**Their next priorities:**
| Priority | Task | Owner |
|---|---|---|
| 🔴 HIGH | On-chain token integration (Anchor programs for RES/RCT) | Tom + Manolo |
| 🔴 HIGH | Publish to Chrome Web Store | Tom |
| 🟡 MEDIUM | Build Resonator (visual guide layer) | Dev sprint |
| 🟡 MEDIUM | Deploy Context SDK to verticals | Dev sprint |

**Sync needed:**
- Our v0.2 tokens → their Browser extension CSS
- Their code changes → our design system updates
- Resonator sprint → needs our design system components

---

## Key Design Principles (from Melodi Blueprint, adapted)

1. **The token layer is the contract.** No raw values in components.
2. **Dark only.** No light theme for ROSI.
3. **One accent.** Sage green #8AB4A0. No violet, no phosphor.
4. **Tonal layering, no shadows.** Surfaces differentiate by lightness, not elevation.
5. **system-ui first.** Inter for display only. No Poppins, no JetBrains for ROSI.
6. **Accessible contrast is measurable.** 3:1 large text/UI, 4.5:1 small text.
7. **Source of truth = the real Browser UI.** Not a concept, not a mockup.

---

## GitHub Repo Structure (target)
```
ROSI-design-system/
├── README.md
├── CHANGELOG.md
├── LICENSE
├── tokens/
│   ├── tokens.json          ← W3C Design Tokens (source of truth)
│   ├── tokens.css           ← CSS custom properties (auto-generated)
│   └── tokens.tailwind.js   ← Tailwind config (if needed)
├── guide/
│   ├── rosi-color-design-system-guide.html
│   └── assets/
├── reference/
│   ├── screenshots/
│   ├── ui-extraction-browser.md
│   └── DESIGN-browser-community.md
├── components/              ← Phase 1
│   ├── atoms/
│   ├── molecules/
│   └── organisms/
├── dashboard/               ← Phase 2
└── .github/
    └── workflows/
        ├── token-sync.yml
        └── visual-regression.yml
```

---

## Team Assignments

| Agent | Role | Current Task |
|-------|------|-------------|
| Nami 🌊 | Orchestrator | Roadmap, GitHub setup, auto-sync cron |
| Michel | Lead Designer | Token review, Tom sync, design decisions |
| Luma ✨ | UI Designer | HTML guide delivered, ready for Phase 1 |
| Eiko 🌸 | Visual Designer | Assist with component design (Phase 1) |
| Tom + Dev Team | Engineering | Browser extension, on-chain, Chrome Store |
| Manolo | Architecture | browser-first branch, sync strategy |

---

## Open Questions (for Tom Zoom tonight)

1. **Sync strategy** — How does the dev team want to consume our tokens? npm package? Git submodule? Copy-paste CSS?
2. **Auto-update flow** — GitHub webhook on their repo → we get notified? Or cron pull?
3. **Resonator sprint** — Timeline? We need to have atoms ready before they start.
4. **Chrome Web Store** — Do they need design assets from us? Screenshots, listing graphics?

---

## References

- **Dev team report:** Tom's Session Report (May 25-26, "The Legendary Session")
- **Design system files:** `/Nstudio/public-community/projects/resonant-os/design-system/`
- **Melodi roadmap:** `/Nstudio/Projects/blueprint/melodi/ROADMAP.md`
- **Main repo:** `resonantos-alpha` (ManoloRemiddi/resonantos-alpha, private)

---

*Last updated: 2026-05-28 14:45 GMT+2 by Nami*
*Next update: After Tom Zoom (20h tonight)*
