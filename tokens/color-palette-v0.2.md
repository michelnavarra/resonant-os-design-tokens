# ROSI Color Palette v0.2 — ResonantOS Design System

**Created:** 2026-05-27
**Author:** Maestro 🌊 (from ResonantOS Browser community build + Claude UI extraction)
**Status:** CANONICAL — extracted directly from the new ResonantOS Browser
**Identity:** Functional minimalism — mission control terminal, dense with information, calm in color

---

## Design Rationale

The ResonantOS Browser is a dark-themed, AI-native Chromium browser. The visual identity is **functional minimalism** — every element earns its place. Deep blue-gray neutrals with a single muted sage green accent. No light theme. No decoration. Depth through tonal layering, not shadows.

This palette is extracted directly from the community-built ResonantOS Browser interface (May 2026). It replaces the earlier v0.1 which was based on the old dashboard and Sokar's spec.

---

## 1. Base — Dark Theme (Only Theme)

### Surface Family (Blue-Gray Neutrals)

| Token | Hex | Role | Why |
|-------|-----|------|-----|
| `--surface-deepest` | `#1A1E21` | Main content background | Darkest ground layer. Blue-gray undertone — warm, not cold |
| `--surface-deep` | `#1E2327` | Sidebar, chat area background | One step lighter — spatial boundary without borders |
| `--surface-raised` | `#262B30` | Cards, input fields, interactive containers | Lifts content one layer above |
| `--surface-overlay` | `#2A3038` | Browser Layer panel, elevated surfaces | Right sidebar panel |
| `--surface-hover` | `#323940` | Hover state for all interactive surfaces | Visible but not aggressive |

### Border Family

| Token | Hex | Role | Why |
|-------|-----|------|-----|
| `--border-subtle` | `#363D44` | Card borders, input borders, dividers | Barely there — structural, not visual |
| `--border-strong` | `#4A5259` | Active borders, separator lines | Visible when needed |

---

## 2. Text

| Token | Hex | Role | Contrast on surface-deepest |
|-------|-----|------|---------------------------|
| `--text-primary` | `#E8EAED` | Primary body text, headings, chat messages | ~10:1 ✅ AAA |
| `--text-secondary` | `#9AA0A6` | Timestamps, helper text, placeholders | ~5.5:1 ✅ AA |
| `--text-tertiary` | `#6B7280` | Disabled text, inactive history items | ~3.5:1 ✅ AA (large text) |
| `--text-on-accent` | `#1A1E21` | Text on green accent (send button) | High contrast on green |

---

## 3. Accent — Sage Green

A single green accent family handles all interaction. Cognitive load stays minimal.

| Token | Hex | Role | Why |
|-------|-----|------|-----|
| `--accent` | `#8AB4A0` | Primary accent — active nav, tab labels, links | Muted sage green. Calm enough for sustained reading |
| `--accent-strong` | `#6BC49F` | Send button, agent status dots, RUNNING badges | Strongest chromatic signal — used sparingly |
| `--accent-muted` | `#3D5A4D` | Accent card background tint | Subtle highlight backgrounds |
| `--accent-hover` | `#7ECFAA` | Hover state on accent | Brighter, invites interaction |

---

## 4. Semantic — Status Colors

| Token | Hex | Role | Usage |
|-------|-----|------|-------|
| `--status-success` | `#6BC49F` | DONE badge, active pulse dot | Same as accent-strong — success IS the green |
| `--status-running` | `#6BC49F` | RUNNING badge background | Active agent state |
| `--status-info` | `#8AB4A0` | System message label | Same as accent |
| `--status-warning` | `#F0B429` | Percentage indicator, attention | Amber — warm urgency |
| `--status-error` | `#EF4444` | Error, critical | Standard red |

**Note:** Success/Running/Info reuse the accent green. This is intentional — the system has ONE color language. Only warning (amber) and error (red) break from green.

---

## 5. Chrome Integration Tokens

For the Chromium browser shell:

| Token | Hex | Role |
|-------|-----|------|
| `--chrome-tab-bg` | `#292D32` | Tab bar background |
| `--chrome-tab-active` | `#1E2327` | Active tab (matches surface-deep) |
| `--chrome-toolbar` | `#1E2327` | URL bar area background |
| `--chrome-icon` | `#9AA0A6` | Extension icons, nav arrows |

---

## 6. Typography

| Token | Family | Size | Weight | Tracking | Line-height | Usage |
|-------|--------|------|--------|----------|-------------|-------|
| `--font-display` | Inter | 48px | 800 | -0.03em | 1.1 | "ResonantOS" hero wordmark only |
| `--font-heading-md` | system-ui | 15px | 600 | 0 | 1.4 | Panel titles, section labels |
| `--font-body` | system-ui | 14px | 400 | 0 | 1.55 | Chat messages, body text |
| `--font-body-sm` | system-ui | 13px | 400 | 0 | 1.45 | Card labels, history items |
| `--font-label` | system-ui | 11px | 600 | 0.05em | 1.3 | Uppercase section headers, badges |
| `--font-label-sm` | system-ui | 10px | 500 | 0 | 1.3 | Timestamps, connection status |
| `--font-code` | ui-monospace | 13px | 400 | 0 | 1.5 | Job IDs, position data |
| `--font-nav-tab` | system-ui | 14px | 500 | 0 | 1 | Tab labels |
| `--font-button-label` | system-ui | 13px | 500 | 0 | 1 | Button text |

---

## 7. Spacing

| Token | Value | Usage |
|-------|-------|-------|
| `--sp-1` | 2px | Micro: indicator dot offset |
| `--sp-2` | 4px | Icon-to-text gap, focus ring offset |
| `--sp-3` | 8px | Compact padding, icon buttons |
| `--sp-4` | 12px | Card padding, chat message padding |
| `--sp-5` | 16px | Sidebar section padding |
| `--sp-6` | 24px | Chat area margins |
| `--sp-7` | 32px | Major section gaps |
| `--sp-8` | 48px | Hero section padding |

---

## 8. Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `--radius-sm` | 4px | Badges, history items |
| `--radius-md` | 8px | Cards, inputs, dropdowns |
| `--radius-lg` | 12px | Chat bubbles |
| `--radius-full` | 9999px | Avatars, send button, step numbers |

---

## 9. Elevation

| Token | Value | Usage |
|-------|-------|-------|
| `--shadow-none` | none | Default — depth by tonal layering |
| `--shadow-panel` | 0 0 20px rgba(0,0,0,0.3) | Browser Layer panel |
| `--shadow-card` | 0 1px 3px rgba(0,0,0,0.15) | Action cards on hover only |
| `--shadow-dropdown` | 0 4px 12px rgba(0,0,0,0.25) | Dropdown menus |

---

## 10. Motion

| Token | Value | Easing | Usage |
|-------|-------|--------|-------|
| `--motion-fast` | 100ms | ease-out | Button hover, badge appear |
| `--motion-base` | 200ms | ease-out | Panel slide, tab switch |
| `--motion-slow` | 350ms | ease-in-out | Browser Layer slide-in |
| `--motion-pulse` | 1.5s | ease-in-out | Agent thinking dot (infinite) |

---

## 11. Z-Index

| Token | Value | Usage |
|-------|-------|-------|
| `--z-base` | 0 | Page content |
| `--z-sidebar` | 10 | Left sidebar |
| `--z-tabs` | 20 | Content tabs |
| `--z-input` | 30 | Input composer (sticky bottom) |
| `--z-browser-layer` | 40 | Right sidebar panel |
| `--z-dropdown` | 50 | Dropdowns |
| `--z-chrome` | 100 | Chromium chrome |

---

## Design Rules (from community)

- ✅ Dark at all times — **no light theme**
- ✅ Green accent is for interactive/live elements only — not decoration
- ✅ Left-align sidebar text. Center-align only hero wordmark
- ✅ Uppercase + tracking for section labels (HISTORY, AGENT CONTROL)
- ✅ Depth by tonal layering, not shadows (except overlays)
- ❌ No colors beyond green accent without functional reason
- ❌ No shadows except overlaying panels and dropdowns
- ❌ No center-aligned body text
- ❌ No rounded corners > 12px except circles

---

## Summary

| Category | Count |
|----------|-------|
| Surface colors | 5 |
| Border colors | 2 |
| Text colors | 4 |
| Accent colors | 4 |
| Status colors | 5 |
| Chrome colors | 4 |
| Typography tokens | 9 |
| Spacing tokens | 8 |
| Radius tokens | 4 |
| Elevation tokens | 4 |
| Motion tokens | 4 |
| Z-index tokens | 7 |
| **Total** | **60** |

---

## Changelog

- **v0.1** (2026-05-27) — Extracted from old dashboard CSS + Sokar spec. Forest green backgrounds, Phosphor Green accent. Superseded.
- **v0.2** (2026-05-27) — Extracted directly from the new ResonantOS Browser community build. Blue-gray surfaces, muted sage green accent. No light theme. Complete token system: colors, typography, spacing, radius, elevation, motion, z-index.

---

*Extracted by Maestro from ResonantOS Browser community build + Claude UI extraction (2026-05-27)*
*Reference screenshots: screenshot01-browser-home.png, screenshot04-browser-agent.png*
*Next: Luma builds HTML guide → canonical tokens.json → handoff to dev team*
