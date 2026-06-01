# ROSI — Resonant OS Interface Design System

> Public design system for the [ResonantOS](https://github.com/ResonantOS) community.
> Built from the real Browser extension UI, extracted into atomic tokens, and shipped as a living system.

## Quick Start

```css
@import url('./tokens/tokens.css');

.my-card {
  background-color: var(--rosi-color-surface-raised);
  border: 1px solid var(--rosi-color-border-default);
  color: var(--rosi-color-text-primary);
}
```

## Structure

```
├── tokens/                  ← Source of truth
│   ├── tokens.json          W3C Design Tokens spec (60 tokens)
│   ├── tokens.css           CSS custom properties (--rosi-color-*)
│   ├── color-palette-v0.2.md  Current palette documentation
│   └── color-palette-v0.1.md  Archived (Phosphor Green era)
├── guide/                   ← Visual documentation
│   └── rosi-color-design-system-guide.html
├── reference/               ← Source material from Browser extension
│   ├── browser-live.css     Live CSS from ResonantOS Browser module
│   ├── base-styles.css      Base CSS variables from the app shell
│   ├── shell-styles.css     App shell layout styles
│   ├── ADR-017-resonant-browser-addon.md  Architecture decision
│   ├── UX-001-resonantos-app-shell.md     UX specification
│   └── screenshots/         UI reference screenshots
├── components/              ← Phase 1 (coming soon)
│   ├── atoms/
│   ├── molecules/
│   └── organisms/
├── dashboard/               ← Phase 2 (self-updating status)
├── .github/workflows/       ← CI/CD (token-sync, visual-regression)
└── ROADMAP.md               ← Full project roadmap
```

## Token System

**v0.2 — 60 tokens across 12 categories:**

| Category | Tokens | Description |
|----------|--------|-------------|
| Surfaces | 5 | Depth layers `#1A1E21` → `#323940` |
| Borders | 3 | default, subtle, strong |
| Text | 4 | primary, secondary, tertiary, inverse |
| Accent | 4 | Muted sage green family |
| Semantic | 6 | success, warning, error (fg + bg) |
| Chrome | 4 | Tab bar, active tab, toolbar |
| Typography | 9 | Family, sizes, weights, line-height |
| Spacing | 8 | 2px → 64px scale |
| Radius | 4 | 4/8/12/16px |
| Elevation | 4 | Shadow levels |
| Motion | 4 | Duration tokens |
| Z-Index | 7 | Layer stacking |

## Design Principles

1. **The token layer is the contract.** No raw values in components.
2. **Dark only.** No light theme for ROSI.
3. **One accent.** Sage green `#8AB4A0`. No violet, no phosphor.
4. **Tonal layering, no shadows.** Surfaces differentiate by lightness.
5. **system-ui first.** Inter for display only.
6. **Source of truth = the real Browser UI.** Not a concept, not a mockup.

## Credits

- **Michel Navarra** — Lead Designer
- **Maestro** — Orchestrator
- **Sokar** — Design Architecture
- **Luma** — Visual Guide
- **Nstudio** — Build System

## License

MIT

---

*Part of the [ResonantOS](https://github.com/ResonantOS) project.*
