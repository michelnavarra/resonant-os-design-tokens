# ResonantOS Browser: UI Component & Token Extraction v3

> Aligned palette: Coherent Verdant. Replaces v0.2 (sage on blue-gray).
> Extracted from 9 screenshots of the current dev team build (June 2026) and the
> actual CSS in `Developer/resonant-os-extension/src/styles/main-workspace/`
> and `styles/side-panel/`. Path (c) alignment: docs and implementation converge
> on a single coherent palette drawn from v0.2 sage family and the dev team's
> current vibrant green.

---

## Changelog vs v0.2

- **2026-06-15 (v0.3)**, v3 alignment. Background shifted from blue-gray (`#1A1E21`) to
  green-warm dark (`#0F1411`). Accent shifted from sage (`#8AB4A0`) to Coherent
  Verdant (`#3FB286`), a calibrated middle ground between v0.2 sage and the
  current dev team vibrant green (`#24d18f`). Borders gained a calibrated
  green-tint (`rgba(63, 178, 134, 0.14-0.55)`) replacing v0.2's neutral gray
  borders. Token count adjusted: 60 → 64 to cover the new border and accent
  alphas, and to add icon/avatar/control sizing tokens that came out of the
  audit. Atom set is now 5: Button, Card, Input, Badge, Icon.

---

## 0. Migration Map

### 0.1 v0.2 → v3 (doc side)

| v0.2 token | v3 token | Note |
|---|---|---|
| `--surface-deepest` `#1A1E21` | `--surface-base` `#0F1411` | Renamed. Darker, green-warmth undertone |
| `--surface-deep` `#1E2327` | `--surface-deep` `#0B100E` | Renamed. Darker |
| `--surface-raised` `#1E2327` | `--surface-raised` `rgba(20,28,24,0.72)` | Translucent, matches impl pattern |
| `--surface-overlay` `#262B30` | `--surface-overlay` `rgba(28,36,31,0.94)` | Translucent |
| `--surface-hover` `#323940` | `--surface-hover` `rgba(255,255,255,0.055)` | Light overlay (impl pattern), not a fill |
| `--border-subtle` `#363D44` | `--border-subtle` `rgba(63,178,134,0.14)` | Green-tinted, low alpha |
| `--border-strong` `#4A5259` | `--border-strong` `rgba(63,178,134,0.40)` | Green-tinted, high alpha |
| `--text-primary` `#E8EAED` | `--text-primary` `#EAF1EC` | Slight green-warmth |
| `--text-secondary` `#9AA0A6` | `--text-secondary` `#A3B1A8` | Slight green-warmth |
| `--text-tertiary` `#6B7280` | `--text-tertiary` `#6E7C73` | Slight green-warmth |
| `--text-inverse` `#1A1E21` | `--text-on-accent` `#06110D` | Renamed (semantic) |
| `--accent-default` `#8AB4A0` | `--accent-default` `#3FB286` | Coherent Verdant |
| `--accent-bright` `#6BC49F` | `--accent-bright` `#5DCE9F` | Lighter hover state |
| `--accent-vivid` `#7ECFAA` | `--accent-default` `#3FB286` | Collapsed: vivid merged into default |
| `--accent-dark` `#3D5A4D` | `--accent-strong` `#2DA176` | Renamed and re-saturated |
| `--accent-on` `#1A1E21` | `--accent-on` `#06110D` | Darker for higher contrast |
| `--success` `#8AB4A0` | `--status-success` `#3FB286` | Aligned to accent |
| `--warning` `#E5A84B` | `--status-warning` `#E5A84B` | Unchanged |
| `--error` `#E06C75` | `--status-error` `#E06C75` | Unchanged |
| `--info` `#8AB4A0` | `--status-info` `#5BA3C7` | Now cool blue, distinct from accent |

### 0.2 Implementation → v3 (dev side)

| Impl variable (`base-rail.css`) | v3 token | Note |
|---|---|---|
| `--bg` `#070a08` | `--rosi-surface-base` `#0F1411` | Slight warmth added. Lift is ~2 hex points |
| `--rail` `rgba(255,255,255,0.045)` | `--rosi-surface-hover` `rgba(255,255,255,0.055)` | Slight alpha bump |
| `--panel` `rgba(17,22,19,0.86)` | `--rosi-surface-overlay` `rgba(28,36,31,0.94)` | Slight green-shift, more opaque |
| `--line` `rgba(148,255,198,0.13)` | `--rosi-border-subtle` `rgba(63,178,134,0.14)` | Calibrated to the new accent. Same family, slightly less neon |
| `--text` `#eef7f0` | `--rosi-text-primary` `#EAF1EC` | Slight green-warmth convergence |
| `--muted` `#909d95` | `--rosi-text-secondary` `#A3B1A8` | Slight brightness lift for AA contrast |
| `--accent` `#24d18f` | `--rosi-accent-default` `#3FB286` | The main shift. New green is calmer, more readable on long sessions, still vibrant |
| `--accent-strong` `#18bd7d` | `--rosi-accent-strong` `#2DA176` | Calibrated to the new default |

The 8-variable impl collapses to a 64-token system without breaking the
existing class structure. The dev team's class-by-class work is unaffected,
only the values in `:root` change.

---

## 1. Design Tokens

### 1.1 Color Tokens

#### Surface family (green-warm dark)

| Token                  | Value                       | Role                                              | Contrast note |
|------------------------|------------------------------|----------------------------------------------------|----------------|
| `--rosi-surface-base`  | `#0F1411`                   | Main content background, page ground              | darkest layer  |
| `--rosi-surface-deep`  | `#0B100E`                   | Deeper canvas, special surfaces                    | one step deeper |
| `--rosi-surface-raised` | `rgba(20, 28, 24, 0.72)`  | Cards, panels, first elevation                   | translucent over base |
| `--rosi-surface-overlay` | `rgba(28, 36, 31, 0.94)` | Modals, dropdowns, popovers                       | second elevation |
| `--rosi-surface-sunken` | `rgba(0, 0, 0, 0.20)`     | Inputs, wells, inset areas                        | darker than base |
| `--rosi-surface-hover` | `rgba(255, 255, 255, 0.055)` | Light overlay on hover (any surface)            | additive, not fill |

#### Border family (calibrated green-tint alphas)

| Token                  | Value                            | Role                                              |
|------------------------|----------------------------------|----------------------------------------------------|
| `--rosi-border-subtle` | `rgba(63, 178, 134, 0.14)`     | Default card border, dividers, input borders       |
| `--rosi-border-default`| `rgba(63, 178, 134, 0.20)`     | Default border on raised interactive surfaces       |
| `--rosi-border-strong` | `rgba(63, 178, 134, 0.40)`     | Active borders, hover emphasis                      |
| `--rosi-border-glow`   | `rgba(63, 178, 134, 0.55)`     | Focused card border, drag-over outline             |

#### Text hierarchy

| Token                  | Value       | Role                                              | Contrast on `--surface-base` |
|------------------------|-------------|----------------------------------------------------|-------------------------------|
| `--rosi-text-primary`  | `#EAF1EC`  | Headings, body text, chat messages                 | ~16.5:1 (AAA)                  |
| `--rosi-text-secondary`| `#A3B1A8`  | Descriptions, metadata, helper text                | ~8.4:1 (AAA)                   |
| `--rosi-text-tertiary` | `#6E7C73`  | Placeholders, disabled, hint                       | ~4.3:1 (AA Large, AA UI)       |
| `--rosi-text-on-accent`| `#06110D`  | Text/icons on accent backgrounds                   | ~7.4:1 on `--accent-default`   |

#### Accent (Coherent Verdant)

| Token                    | Value                          | Role                                              |
|--------------------------|--------------------------------|----------------------------------------------------|
| `--rosi-accent-default`  | `#3FB286`                     | Primary accent, between v0.2 sage and impl phosphor |
| `--rosi-accent-bright`   | `#5DCE9F`                     | Hover state on accent (lighter)                    |
| `--rosi-accent-strong`   | `#2DA176`                     | Pressed/active state (darker)                      |
| `--rosi-accent-muted`    | `rgba(63, 178, 134, 0.12)`   | Subtle backgrounds, secondary button fill          |
| `--rosi-accent-tint`     | `rgba(63, 178, 134, 0.08)`   | Lighter tint for gradient highlights               |
| `--rosi-accent-glow`     | `rgba(63, 178, 134, 0.18)`   | Radial gradient ambient accent                     |
| `--rosi-accent-on`       | `#06110D`                     | Text/icons on accent backgrounds                   |

#### Status (success and running share the accent)

| Token                    | Value       | Role                                              |
|--------------------------|-------------|----------------------------------------------------|
| `--rosi-status-success`  | `#3FB286`  | Healthy, completed, online (same as accent)         |
| `--rosi-status-running`  | `#3FB286`  | Active agent state (same as accent)                 |
| `--rosi-status-info`     | `#5BA3C7`  | Informational state, cool blue, distinct from green |
| `--rosi-status-warning`  | `#E5A84B`  | Caution, attention, pending                         |
| `--rosi-status-error`    | `#E06C75`  | Failure, critical, destructive action               |
| `--rosi-status-neutral`  | `#9AA0A6`  | Disabled, inactive, no semantic value               |

#### Chrome integration

| Token                          | Value       | Role                                              |
|--------------------------------|-------------|----------------------------------------------------|
| `--rosi-chrome-tab-bar`        | `#1E2327`  | Browser tab bar background                         |
| `--rosi-chrome-tab-active`     | `#161B17`  | Active tab background (green-shifted)              |
| `--rosi-chrome-toolbar`        | `#161B17`  | URL bar area background                             |

### 1.2 Typography Tokens

| Token              | Family                  | Size                          | Weight | Tracking    | Line-height | Usage                                  |
|--------------------|-------------------------|--------------------------------|--------|-------------|-------------|------------------------------------------|
| `--rosi-text-3xl`  | Display (Inter)         | `clamp(2rem, 4vw, 4.4rem)`   | 800    | -0.065em    | 0.95        | Hero/display titles                     |
| `--rosi-text-2xl`  | Display (Inter)         | `1.75rem` (28px)              | 800    | -0.045em    | 1.05        | Page-level titles, large section heads  |
| `--rosi-text-xl`   | System sans             | `1.35rem` (~22px)            | 800    | -0.04em     | 1.1         | Card titles, settings section heads     |
| `--rosi-text-lg`   | System sans             | `1.125rem` (18px)            | 800    | -0.02em     | 1.3         | Sub-section titles, large body strong   |
| `--rosi-text-base` | System sans             | `0.875rem` (14px)            | 400    | 0           | 1.45        | Default body text                       |
| `--rosi-text-sm`   | System sans             | `0.8125rem` (13px)           | 400    | 0           | 1.45        | Secondary text, button labels           |
| `--rosi-text-xs`   | System sans             | `0.6875rem` (11px)           | 950    | 0.05-0.14em | 1.3         | Eyebrow labels, badges (uppercase)      |
| `--rosi-text-mono` | Mono (ui-monospace)     | `0.75rem` (12px)             | 400    | 0           | 1.5         | Code, job IDs, data values              |

**Weight note:** The current impl uses weight 950 (extrabold) heavily for
button labels, eyebrow labels, and nav-item strong text. v3 adds an explicit
`--rosi-font-extrabold: 950` token (in addition to bold 700) so the system
documents the actual range in use.

### 1.3 Spacing Tokens

| Token             | Value     | px   | Usage                                                  |
|-------------------|-----------|------|----------------------------------------------------------|
| `--rosi-space-0`  | 0         | 0    | Reset                                                    |
| `--rosi-space-1`  | `0.25rem` | 4px  | Micro gaps, focus ring offset, micro-icon padding        |
| `--rosi-space-2`  | `0.5rem`  | 8px  | Compact padding, icon-to-text gaps                       |
| `--rosi-space-3`  | `0.75rem` | 12px | Card internal padding (matches impl 12-16px range)       |
| `--rosi-space-4`  | `1rem`    | 16px | Default section spacing                                 |
| `--rosi-space-5`  | `1.5rem`  | 24px | Section gaps                                            |
| `--rosi-space-6`  | `2rem`    | 32px | Large gaps                                              |
| `--rosi-space-7`  | `3rem`    | 48px | Page sections, hero top padding                         |
| `--rosi-space-8`  | `4rem`    | 64px | Major separators                                        |

### 1.4 Sizing Tokens

| Token                    | Value      | Usage                                              |
|--------------------------|------------|----------------------------------------------------|
| `--rosi-sidebar-w`       | `268px`    | Left rail width (matches impl)                      |
| `--rosi-icon-xs`         | `12px`     | Inline action icons, badges                        |
| `--rosi-icon-sm`         | `14px`     | Toolbar action icons                               |
| `--rosi-icon-md`         | `16px`     | Primary inline icons                               |
| `--rosi-icon-lg`         | `20px`     | Rail item icons, button icons                      |
| `--rosi-icon-xl`         | `24px`     | Large standalone icons                             |
| `--rosi-avatar-sm`       | `20px`     | Inline avatar (rail project icon)                  |
| `--rosi-avatar-md`       | `30px`     | User card avatar                                   |
| `--rosi-avatar-lg`       | `34px`     | Brand mark                                         |
| `--rosi-send-btn`        | `38px`     | Send button diameter                               |
| `--rosi-icon-button`     | `34px`     | Square icon button hit area                        |
| `--rosi-control-sm`      | `32px`     | Compact control height (rail action, search input) |
| `--rosi-control-md`      | `40px`     | Standard control height (input, select)            |
| `--rosi-touch-min`       | `42px`     | Touch mode minimum (body[data-density='touch'])     |

### 1.5 Border & Radius Tokens

| Token                 | Value                              | Usage                                              |
|-----------------------|-------------------------------------|----------------------------------------------------|
| `--rosi-border-card`  | 1px solid `--rosi-border-subtle`   | Default card border                                |
| `--rosi-border-input` | 1px solid `--rosi-border-subtle`   | Default input border                               |
| `--rosi-border-focus` | 1px solid `--rosi-border-glow`     | Focus ring on inputs and cards                     |
| `--rosi-radius-xs`    | `0.5rem` (8px)                    | Small elements                                     |
| `--rosi-radius-sm`    | `0.75rem` (12px)                  | Inputs, chips                                      |
| `--rosi-radius-base`  | `1rem` (16px)                     | Buttons, small cards                               |
| `--rosi-radius-lg`    | `1.25rem` (20px)                  | Cards (memory cards, addon cards)                  |
| `--rosi-radius-xl`    | `1.375rem` (22px)                 | Large cards, settings panels                       |
| `--rosi-radius-2xl`   | `1.5rem` (24px)                   | Settings subnav, large panels                      |
| `--rosi-radius-full`  | `9999px`                          | Pills, send button, avatars, status indicators     |

### 1.6 Elevation Tokens

| Token                | Value                              | Usage                                              |
|----------------------|-------------------------------------|----------------------------------------------------|
| `--rosi-shadow-0`    | `none`                              | Default, tonal layering, no shadow                |
| `--rosi-shadow-1`    | `0 1px 2px rgba(0,0,0,0.1)`        | Subtle, hover lift on cards                        |
| `--rosi-shadow-2`    | `0 18px 50px rgba(0,0,0,0.34)`     | Popover/panel, context popovers, dropdowns         |
| `--rosi-shadow-3`    | `0 24px 90px rgba(0,0,0,0.55)`     | Modal, full-screen overlay                         |

### 1.7 Motion Tokens

| Token                  | Value  | Easing      | Usage                                          |
|------------------------|--------|-------------|-------------------------------------------------|
| `--rosi-duration-fast` | 120ms  | ease-out    | Hover, opacity, transform                      |
| `--rosi-duration-normal` | 200ms | ease-out    | Panel slide, tab switch, focus                  |
| `--rosi-duration-slow` | 350ms  | ease-in-out | Page transition                                 |
| `--rosi-duration-deliberate` | 600ms | ease-in-out | Section open/close                          |

### 1.8 Z-Index Tokens

| Token              | Value | Usage                                              |
|--------------------|-------|----------------------------------------------------|
| `--rosi-z-base`    | 0     | Page content                                       |
| `--rosi-z-rail`    | 10    | Sidebar nav layer                                   |
| `--rosi-z-sticky`  | 20    | Sticky headers, content tabs                       |
| `--rosi-z-composer`| 30    | Input composer (sticky bottom)                     |
| `--rosi-z-dropdown`| 40    | Dropdowns, popovers                                |
| `--rosi-z-modal`   | 1000  | Full-screen modals                                 |

---

## 2. Component Inventory: Atomic Hierarchy

### 2.0 Component catalog from the 9 screenshots

The 9 screenshots surfaced these component patterns. Some are atoms
(Button, Card, Input, Badge, Icon), some are molecules (composer, action
chip, search-with-button), some are organisms (rail, hero, settings panel).
This doc specs the 5 atoms. Molecules and organisms are listed as
context for the atom usage.

| Pattern (in screenshots)             | Layer    | Covered by atom            | Screenshots         |
|---------------------------------------|----------|------------------------------|---------------------|
| Composer toolbar buttons             | Molecule | Button (secondary) + Icon    | 1, 2, 5             |
| Send button (circular, green)         | Atom     | Button (send)                | 1, 2                |
| Suggestion cards (eyebrow + title)   | Molecule | Card + Badge (eyebrow)       | 1                   |
| Hero (display title + subhead)       | Organism |,                            | 3, 4, 5, 7          |
| User chat message (right-aligned)     | Molecule | Card (compact)               | 2                   |
| System message (left-aligned)         | Molecule |,                            | 2                   |
| Action chip (gray pill, post-message) | Molecule | Badge (pill, neutral)        | 2                   |
| Error banner                          | Molecule | Card (status-error tone)     | 2, 3, 4, 6, 7       |
| Memory card (eyebrow + body + button)| Molecule | Card + Badge + Button        | 5                   |
| Memory metric (eyebrow + number)     | Molecule | Card (metric)                | 5                   |
| Pipeline step marker (dot)            | Atom     | Badge (dot variant)          | 5                   |
| Settings subnav (left column)         | Organism | Card (subnav variant)        | 8, 9                |
| Settings nav item (subnav entry)      | Atom     | Button (ghost, nav)          | 8, 9                |
| Settings provider card                | Molecule | Card                          | 8, 9                |
| Form label (uppercase)                | Molecule | Badge (eyebrow variant)      | 8, 9                |
| Text input                            | Atom     | Input                         | 5, 8, 9             |
| Textarea                              | Atom     | Input (textarea)              | 7, 8                |
| Select                                | Atom     | Input (select)                | 5, 8, 9             |
| Primary button (pill, green)          | Atom     | Button (primary)              | 6, 7, 8             |
| Secondary button (pill, outlined)     | Atom     | Button (secondary)            | 6, 7                |
| Icon button (square, transparent)     | Atom     | Button (icon)                 | 1, 2, 6             |
| Status pill (with border, uppercase)  | Atom     | Badge (pill, tone)            | 5, 6, 7, 8          |
| Status dot (8px, green/red)           | Atom     | Badge (dot)                   | 5, 6, 7             |
| Search input with attached button     | Molecule | Input (search) + Button       | 5                   |
| Expandable section (disclosure)       | Molecule | Card + Icon (chevron)         | 5, 8, 9             |
| Avatar (circular letter)              | Molecule | Badge (dot variant) sizing    | 1, 8, 9             |
| Inline SVG icon                        | Atom     | Icon                          | 1, 2, 3, 4, 5, 6, 7 |

### 2.1 Atoms

**A01. Button**

A button is a click target with text or icon content. Five sub-variants.

Sub-variants:

| Sub-variant   | Use case                                    | Examples (screenshots)                                |
|---------------|----------------------------------------------|--------------------------------------------------------|
| `primary`     | Main call to action, save, submit            | Save Identity (8), Start Dashboard (6), Add a Source (9) |
| `secondary`   | Supporting action, outlined                 | Stop (6), Refresh (4, 6), Reset Prompt (8)            |
| `send`        | Circular, composer-anchored                  | Send message (1, 2)                                    |
| `icon`        | Square, transparent, icon-only               | Rail toggle (1), toolbar attach (2), search (5)       |
| `ghost`       | Nav item, settings subnav entry              | Rail item (1), settings nav item (8, 9)               |

Visual spec (from the CSS in `workspace-modules.css` and `composer.css`):

- **Shape:** All buttons use `border-radius: 999px` (full pill), except icon
  buttons (also full pill, but square in proportions) and the settings subnav
  items (use `--rosi-radius-2xl: 24px`).
- **Primary fill:** `background: var(--rosi-accent-default)` and
  `color: var(--rosi-text-on-accent)`. The on-accent text is dark green
  (`#06110D`), giving ~7.4:1 contrast on the accent.
- **Secondary fill:** `background: var(--rosi-accent-muted)` (low-alpha green
  tint), `border: 1px solid var(--rosi-border-default)`, `color: var(--rosi-text-primary)`.
- **Send button:** 38px circle, `background: var(--rosi-accent-default)`, icon
  centered, `color: var(--rosi-text-on-accent)`. The Stop variant inverts to a
  red `rgba(255, 112, 112, 0.92)` fill with dark red text.
- **Icon button:** 34px circle, `background: transparent`,
  `color: var(--rosi-text-secondary)`. Hover applies `--rosi-surface-hover`.
- **Ghost (nav item):** Border 1px transparent default, border-strong on hover.
  Background transparent default, surface-hover on hover. Text color shifts
  from secondary to primary on hover.
- **Padding:** Primary/secondary use `10px 14px`. Icon button has no padding
  (the 34px hit area IS the padding). Send button has no padding.
- **Font:** `--rosi-text-sm` (13px), weight `--rosi-font-extrabold` (950),
  letter-spacing 0. No italic.
- **Height:** 32-38px for primary/secondary, 34px for icon, 38px for send.

States:

| State    | Primary                              | Secondary                                          | Send                              | Icon                                 | Ghost                                |
|----------|---------------------------------------|------------------------------------------------------|------------------------------------|--------------------------------------|---------------------------------------|
| default  | bg accent-default                    | bg accent-muted, border border-default              | bg accent-default                  | bg transparent, color text-secondary | bg transparent, color text-secondary  |
| hover    | bg accent-bright                     | bg accent-muted, border border-strong               | bg accent-bright                   | bg surface-hover, color text-primary  | bg surface-hover, color text-primary  |
| focus    | 1px ring border-glow, 2px offset     | same                                                | same                              | same                                 | same                                  |
| active   | bg accent-strong, scale(0.96)        | bg accent-tint, border border-glow                  | scale(0.96)                       | bg surface-hover                     | bg accent-muted, color accent-default |
| disabled | opacity 0.48, cursor not-allowed     | opacity 0.48, cursor not-allowed                   | opacity 0.48                       | opacity 0.4                          | opacity 0.4                           |
| loading  | cursor wait, opacity 0.56            | cursor wait, opacity 0.56                          | same                              | same                                 | same                                  |

Accessibility:

- Minimum hit area 32px (icon button), 38px (send), 40px (primary/secondary in
  standard density). Touch mode (body[data-density='touch']) bumps to 42px.
- Focus ring: 1px solid `--rosi-border-glow` with 2px offset, on every variant.
- `aria-label` required for icon-only buttons.
- Loading state: `aria-busy="true"`, swap text or add spinner.
- Disabled state: `aria-disabled="true"` plus the visual styling, not just
  the `disabled` attribute (which some assistive tech ignores when buttons
  are styled).

Naming convention: `--rosi-button-{variant}-{state}`. Variants: `primary`,
`secondary`, `send`, `icon`, `ghost`. States: `default`, `hover`, `active`,
`focus`, `disabled`. Example: `--rosi-button-primary-bg-hover`.

---

**A02. Card**

A card is a container with a border, optional radial highlight, and content
slots. Six sub-variants.

Sub-variants:

| Sub-variant     | Use case                                  | Examples (screenshots)                                |
|-----------------|--------------------------------------------|--------------------------------------------------------|
| `base`          | Default card                               | Memory card (5), Add-on card (3), settings provider card (8) |
| `metric`        | Number + eyebrow + small text              | Memory metric (5), settings health card (8)           |
| `status-tone`   | Color-coded by data-tone attribute         | Memory review next (`[data-tone=active|warning|blocked]`), OpenCode status card (`[data-ready=true|false]`) |
| `subnav`        | Settings subnav container                  | Settings subnav (8, 9)                                 |
| `elevated`      | Hero workspace containers with radial glow | Settings setup card, settings personalization panel (8) |
| `disclosure`    | Expandable section                         | Memory advanced, settings advanced (5, 8, 9)          |

Visual spec:

- **Border:** 1px solid `--rosi-border-subtle` (default), `--rosi-border-default`
  (hover), `--rosi-border-glow` (focused/active).
- **Background:** `--rosi-surface-raised` (translucent green-tinted) by default.
  Elevated variants add a top-left radial gradient:
  `radial-gradient(circle at 10% 0%, var(--rosi-accent-glow), transparent 38%)`.
- **Border-radius:** `--rosi-radius-lg` (20px) for memory/addon cards,
  `--rosi-radius-xl` (22px) for setup/personalization panels,
  `--rosi-radius-2xl` (24px) for settings subnav.
- **Padding:** 16-18px internal, 12-14px for compact metric variant.
- **Gap:** 8-12px between child blocks.

Sub-variant details:

- **Metric:** Compact padding (12-14px), large number (`--rosi-text-2xl`,
  weight 800, letter-spacing -0.04em), eyebrow label above in
  `--rosi-accent-default`.
- **Status-tone:** Border and background tint shift with the `data-tone`
  attribute. Active/success = `--rosi-border-default` +
  `--rosi-accent-muted` background. Warning = `--rosi-status-warning` at
  22% alpha border, 7% alpha background. Blocked/error =
  `--rosi-status-error` at 24% alpha border, 7% alpha background.
- **Subnav:** Sticky positioning, 10px padding, `--rosi-radius-2xl`,
  8px gap between nav items.
- **Elevated:** Adds the radial accent highlight in the top-left corner, with
  the same translucent base as a regular card.
- **Disclosure:** Uses the native `<details>`/`<summary>` pattern. Summary
  text is uppercase, `--rosi-text-xs`, weight 950, letter-spacing wider.

States:

| State         | Border                            | Background                            | Note                                  |
|---------------|------------------------------------|----------------------------------------|----------------------------------------|
| default       | `--rosi-border-subtle`            | `--rosi-surface-raised`                | Tonal layer, no shadow                 |
| hover         | `--rosi-border-default`           | `--rosi-surface-raised`                | Border strengthens                     |
| focused       | `--rosi-border-glow`              | `--rosi-surface-raised`                | For selectable cards                   |
| active (selected) | `--rosi-border-glow`          | `--rosi-accent-muted` overlay          | Settings nav item, focused memory card |
| disabled      | `--rosi-border-subtle`            | `--rosi-surface-raised`                | opacity 0.58                           |

Accessibility:

- Non-interactive cards: role="region" with `aria-labelledby` pointing to the
  card title. No focus ring needed.
- Interactive cards (settings subnav items, memory cards with actions):
  render as `<button>` elements, or apply `role="button"` with `tabindex="0"`.
  Use the standard button focus ring.
- Status-tone cards: include `data-tone` attribute and a text label or
  `aria-label` describing the tone (e.g., "Warning", "Failed"). The current
  v0.2 impl uses color alone for status-tone cards, the v3 atom spec
  recommends adding the text label for screen-reader parity.
- Disclosure cards: use native `<details>`/`<summary>`, the user agent handles
  keyboard and ARIA.

Naming convention: `--rosi-card-{sub-variant}-{state}`. Sub-variants: `base`,
`metric`, `status-tone`, `subnav`, `elevated`, `disclosure`.

---

**A03. Input**

A control that accepts user input. Four sub-variants.

Sub-variants:

| Sub-variant | Use case                                  | Examples (screenshots)                                |
|-------------|--------------------------------------------|--------------------------------------------------------|
| `text`      | Single-line text entry                     | User Name, Profile Label, Contact, AI Name (8)         |
| `search`    | Search input with attached button          | Search Memory (5)                                      |
| `textarea`  | Multi-line text entry                      | Augmentor System Prompt (8), OpenCode task (7)         |
| `select`    | Native select wrapper                      | Add a Source provider (9), settings appearance (8)    |

Visual spec:

- **Background:** `--rosi-surface-sunken` (translucent `rgba(0,0,0,0.20)`).
  Gives a slightly darker feel than the surrounding card, signaling "well".
- **Border:** 1px solid `--rosi-border-subtle` default,
  `--rosi-border-glow` on focus.
- **Border-radius:** `--rosi-radius-sm` (12px) for text/search/select,
  `--rosi-radius-base` (16px) for textarea.
- **Padding:** 10-13px horizontal, 8-13px vertical (depends on density).
- **Text:** `--rosi-text-base` (14px), weight 750, color `--rosi-text-primary`.
- **Placeholder:** `--rosi-text-tertiary`.
- **Min height:** 40px (control-md), 42px in touch density.
- **Search variant:** Has a 999px-radius icon button attached inline to the
  right side of the input. Border wraps both as one unit.

States:

| State    | Border                       | Background                | Note                                |
|----------|------------------------------|----------------------------|--------------------------------------|
| default  | `--rosi-border-subtle`       | `--rosi-surface-sunken`    | Quiet                               |
| hover    | `--rosi-border-default`      | `--rosi-surface-sunken`    | Border brightens slightly            |
| focus    | `--rosi-border-glow`         | `--rosi-surface-sunken`    | 1px ring, 2px offset                 |
| filled   | `--rosi-border-default`      | `--rosi-surface-sunken`    | Same as default, text is primary     |
| error    | `--rosi-status-error` 40%    | `--rosi-status-error` 7%   | Plus `aria-describedby` to error msg |
| disabled | `--rosi-border-subtle`       | `--rosi-surface-sunken`    | Text tertiary, cursor not-allowed    |

Form labels: separate atom (Badge, eyebrow variant), positioned above the
input with 5-6px gap. Color `--rosi-text-tertiary`, uppercase,
`--rosi-tracking-wider` (0.14em), `--rosi-font-extrabold` (950), size
`--rosi-text-xs` (11px). Examples: "USER NAME", "AI NAME", "PROFILE LABEL",
"CONTACT" in screenshot 8.

Accessibility:

- Each input must have an associated `<label>` (for/id), or `aria-label`.
- Error message: `aria-describedby="..."` linking to a `<p>` or `<span>` with
  `role="alert"`.
- Select: native `<select>` is preferred for accessibility. Custom select
  widgets need full keyboard support and ARIA combobox pattern.
- Textarea: resize: vertical only (matches the impl), with min-height 58-120px
  depending on context.
- Required fields: `aria-required="true"` plus visible indicator.

Naming convention: `--rosi-input-{sub-variant}-{state}`.

---

**A04. Badge**

A small visual marker. Three sub-variants: Pill, Eyebrow, Dot. The Pill
sub-variant has tone variants that map to status.

Sub-variants:

| Sub-variant | Use case                                    | Examples (screenshots)                                |
|-------------|----------------------------------------------|--------------------------------------------------------|
| `pill`      | Status badge, capability tag, "New" tag      | "New" on Projects (1), status pills (5, 6, 7, 8)       |
| `eyebrow`   | Uppercase text label, no border              | "STRATEGY", "WEB", "PAGE" in suggestion cards (1)      |
| `dot`       | 8-10px circle, status indicator              | Pipeline markers (5), rail status dot (1)              |

Pill sub-variant:

- **Shape:** `border-radius: 999px` (full pill), padding `4px 7-8px`.
- **Border:** 1px solid, color depends on tone (see below).
- **Background:** Tone-tinted, low alpha. Default = `--rosi-accent-muted`
  (`rgba(63, 178, 134, 0.12)`).
- **Text:** `--rosi-text-xs` (11px), weight 950, uppercase,
  `letter-spacing: 0.05-0.14em`. Color matches the tone border.
- **Min height:** 18-22px.

Pill tone variants:

| Tone     | Border                                | Background                          | Text color                          | Example                                      |
|----------|----------------------------------------|-------------------------------------|-------------------------------------|------------------------------------------------|
| accent   | `--rosi-border-default`               | `--rosi-accent-muted`               | `--rosi-accent-default`             | "New" tag (1), capability tags (5, 8)         |
| success  | `rgba(63, 178, 134, 0.32)`           | `--rosi-accent-muted`               | `--rosi-status-success`             | "RUNNING" (5)                                  |
| warning  | `rgba(229, 168, 75, 0.28)`           | `rgba(229, 168, 75, 0.10)`         | `rgba(255, 200, 130, 0.95)`         | "PENDING", "DEGRADED" (5)                      |
| error    | `rgba(224, 108, 117, 0.34)`          | `rgba(224, 108, 117, 0.10)`        | `rgba(255, 175, 175, 0.95)`         | "FAILED" (7), "REJECTED" (3)                   |
| info     | `rgba(91, 163, 199, 0.32)`           | `rgba(91, 163, 199, 0.10)`         | `rgba(160, 207, 235, 0.95)`         | "READY" (7)                                    |
| neutral  | `rgba(154, 160, 166, 0.28)`          | `rgba(154, 160, 166, 0.08)`        | `--rosi-text-secondary`             | Action chip (2), inactive state                |

Eyebrow sub-variant (text-only, no border or background):

- **Font:** `--rosi-text-xs` (11px), weight 950, uppercase,
  `letter-spacing: 0.05-0.14em`.
- **Color:** `--rosi-text-secondary` (default), `--rosi-accent-default`
  (emphasis, used in metric cards and section eyebrows).
- **Examples:** "STRATEGY" (1), "WEB" (1), "MEMORY PAGES" eyebrow on
  cards (5), "USER NAME" form label (8).

Dot sub-variant:

- **Size:** 8-10px circle.
- **Color:** `--rosi-accent-default` (default/success/running),
  `--rosi-status-warning` (caution), `--rosi-status-error` (failed).
- **Optional outer ring:** 3-4px alpha halo for active/connected state
  (matches impl `.memory-pipeline-marker`).
- **Examples:** Rail chat unread dot (1, 9px), memory pipeline markers
  (5, 8px with halo), connection line icon (composer).

States:

| State    | Pill                        | Eyebrow                 | Dot                          |
|----------|------------------------------|--------------------------|-------------------------------|
| default  | Tone-tinted border + bg     | text-secondary           | accent-default               |
| hover    | Border strengthens one step | text-primary             | (n/a, non-interactive)      |
| active   | Border-glow, text-primary   | text-primary             | (n/a)                         |
| pulsing  | (n/a)                        | (n/a)                    | scale 1→1.3→1, 1.5s infinite |

Accessibility:

- Pills with text: the text content is the accessible name. No `aria-label`
  needed unless the text is decorative (icon-only).
- Pills that are interactive: render as `<button>` with the text as
  accessible name.
- Dots: must have `aria-label` describing the state ("Connected", "Failed",
  "Active stage"). The current v0.2 impl uses color alone in some places.
  v3 spec recommends `aria-label` for parity.
- Eyebrow text labels: visual only. The semantic structure (heading, label,
  etc.) is handled by the parent element.

Naming convention: `--rosi-badge-pill-{tone}`, `--rosi-badge-eyebrow`,
`--rosi-badge-dot-{tone}`.

---

**A05. Icon**

An inline SVG that inherits color and scales with the parent. The 9
screenshots use only inline SVG, no icon font. All icons use a 24px viewBox
with 1.5-2px stroke and `currentColor` fill.

Sizes (from the impl):

| Size     | Value | Usage                                                | Examples (screenshots)                                |
|----------|-------|------------------------------------------------------|--------------------------------------------------------|
| `xs`     | 12px  | Inline action icon, kbd-adjacent                     | Rail chat action buttons (1)                           |
| `sm`     | 14px  | Toolbar, breadcrumb                                  | Composer tools menu (1)                                |
| `md`     | 16-17px | Default inline, rail item, send button icon       | Rail item icons (1), send arrow (1)                    |
| `lg`     | 20px  | Large inline, brand-adjacent                         | Composer connection line (1)                           |
| `xl`     | 24px  | Standalone                                           | Settings nav group label icons (8)                    |

Sub-variants by purpose:

| Sub-variant   | Stroke | Examples                                                |
|---------------|--------|----------------------------------------------------------|
| `interface`   | 2px    | Plus, search, settings, refresh, close, chevron, send arrow |
| `content`     | 1.5px  | Folder, file, code brackets, document                     |
| `brand`       | 1.5px  | R monogram in 34px square mark                            |
| `status`      | 2px    | Sparkle, live, connection pulse                           |

Visual spec:

- **Stroke:** 1.5-2px, `stroke-linecap: round`, `stroke-linejoin: round`.
- **Fill:** `none` (interface), `currentColor` (solid fills when needed).
- **Color:** Inherits from parent via `currentColor`. Parent color is set
  by the surrounding atom.
- **ViewBox:** `0 0 24 24` consistently across all icons.
- **Path:** Inline `<path>` elements, not external SVG sprites. No icon
  font, no `<img>` tags.

States (where interactive):

| State    | Color                           | Note                                     |
|----------|----------------------------------|-------------------------------------------|
| default  | `--rosi-text-secondary`         | Mid-contrast, settles back                 |
| hover    | `--rosi-text-primary`           | Full contrast on parent hover             |
| active   | `--rosi-accent-default`         | Brand color                               |
| disabled | `--rosi-text-tertiary`          | 40% opacity                              |

Accessibility:

- Decorative icons: `aria-hidden="true"`. Don't announce to screen readers.
- Standalone icons (icon buttons): wrapped in a `<button>` with
  `aria-label="..."`. The icon itself has `aria-hidden="true"`.
- Status icons: parent has the semantic meaning. Icon is decorative.
- Never use an icon as the only content of an interactive control without
  an accessible name.

Naming convention: `--rosi-icon-{size}` (sizing tokens), no per-icon
variable (icons are SVG components, not styled atoms).

---

### 2.2 Molecules (atom compositions, for context)

**M01. Composer**

Combines Input (textarea) + Icon buttons + Select (model) + Button (send).
- Textarea fills the available width, min-height 58px, max-height 180px,
  resize vertical.
- Toolbar row below, height 38px, gap 7px, all controls 34-38px circular.
- Send button on the right, 38px circle.
- Container: 1px solid `--rosi-border-subtle`, border-radius 22px,
  background `--rosi-surface-overlay` (translucent), padding 12px.
- Examples: screenshots 1, 2.

**M02. Search Input with Button**

Input (search) + Button (secondary) attached inline. The input is wider
(flex: 1), the button is fixed-width on the right.
- Examples: screenshot 5 (Search Memory).

**M03. Settings Subnav**

Card (subnav) + multiple Button (ghost) entries, sticky-positioned on the
left column of the settings workspace.
- Container: 220px max width, sticky top 12px, padding 10px.
- Each nav item: full width, padding 11px 12px, gap 3px between label and
  description.
- Active state: `--rosi-border-default` border, `--rosi-accent-muted`
  background, `--rosi-text-primary` text.
- Group labels above each group: uppercase, 9-10px, weight 950,
  letter-spacing 0.14em, color `--rosi-text-tertiary`.
- Examples: screenshots 8, 9.

**M04. Hero Workspace**

Module heading + subhead. Heading uses `--rosi-text-3xl` (clamp),
letter-spacing -0.065em, line-height 0.95. Subhead uses `--rosi-text-base`
with `--rosi-text-secondary` color, max-width 680-700px.
- Examples: screenshots 3, 4, 5, 7.

**M05. Action Chip**

Badge (pill, neutral tone) used below chat messages for quick actions.
- Pill shape, padding 5px 11px, border `rgba(154, 160, 166, 0.28)`,
  background `rgba(154, 160, 166, 0.10)`, text `--rosi-text-primary`,
  font `--rosi-text-sm`, weight 800.
- Examples: screenshot 2 (chips below the system error).

### 2.3 Organisms (for context only)

**O01. Workspace Rail** (left sidebar)

Card-pattern rail, 268px wide, full height. Contains brand lockup, primary
nav (rail items), search box, tools section, projects section, chats
section, user card, settings link. Sticky footer for user card.
- Examples: screenshots 1, 2, 3, 4, 5, 6, 7, 8, 9.

**O02. Workspace Hero**

Module heading + subhead + (optional) action button row + grid of cards.
Max-width 920px, centered, gap 18px.
- Examples: screenshots 3, 4, 5, 7.

**O03. Settings Workspace**

Two-column grid: subnav (220px) + main panel (1fr). Gap 18px, max-width
1180px, centered.
- Examples: screenshots 8, 9.

**O04. Error Banner**

Card (status-tone, error) with text. Inline, not a toast. 1px solid error
border at 22% alpha, 7% alpha background, error text color.
- Examples: screenshots 2, 3, 4, 6, 7.

**O05. Form Section**

Form label (eyebrow) + Input + helper text, stacked vertically, gap
8-12px. Optional sub-group inside a disclosure card.
- Examples: screenshots 8, 9.

---

## 3. Interaction States

| Atom / sub-variant     | Default                       | Hover                                | Active/Selected                | Focus                          | Disabled              |
|------------------------|--------------------------------|---------------------------------------|---------------------------------|---------------------------------|------------------------|
| Button, primary       | bg accent-default             | bg accent-bright                     | bg accent-strong                | 1px ring border-glow, 2px off | opacity 0.48          |
| Button, secondary     | bg accent-muted, border def  | border border-strong                  | border border-glow              | 1px ring border-glow           | opacity 0.48          |
| Button, send          | bg accent-default             | bg accent-bright                     | scale(0.96)                     | 1px ring                       | opacity 0.48          |
| Button, icon          | bg transparent, text-2        | bg surface-hover, text-1             | bg surface-hover                | 1px ring                       | opacity 0.4           |
| Button, ghost (nav)   | bg transparent, text-2        | bg surface-hover, text-1             | bg accent-muted, accent-default | 1px ring                       | opacity 0.4           |
| Card, base            | border-subtle                 | border-default                       | border-glow + bg accent-muted   | 1px ring border-glow           | opacity 0.58          |
| Card, metric          | border-subtle                 | (n/a, non-interactive)              | (n/a)                           | (n/a)                          | opacity 0.58          |
| Card, subnav item     | border transparent            | border-default, bg accent-muted      | border-glow, bg accent-muted    | 1px ring                       | opacity 0.58          |
| Input, text           | border-subtle                 | border-default                       | (n/a)                           | border-glow                    | opacity 0.6           |
| Input, textarea       | border-subtle                 | border-default                       | (n/a)                           | border-glow                    | opacity 0.6           |
| Input, search         | border-subtle                 | border-default                       | (n/a)                           | border-glow                    | opacity 0.6           |
| Input, select         | border-subtle                 | border-default                       | (n/a)                           | border-glow                    | opacity 0.6           |
| Badge, pill           | tone-tinted                   | border strengthens                   | border-glow                     | 1px ring                       | opacity 0.4           |
| Badge, eyebrow        | text-2                        | text-1                               | text-1                          | (n/a)                          | text-3                |
| Badge, dot            | accent-default                | (n/a)                                | (n/a)                           | 1px ring (on hit area)         | opacity 0.4           |
| Icon                   | text-2                        | text-1                               | accent-default                  | 1px ring on parent button      | opacity 0.4           |

### Transitions

| Trigger                 | Property          | Duration          | Easing     |
|-------------------------|-------------------|--------------------|------------|
| Button hover            | background, color | `--rosi-duration-fast` (120ms) | ease-out    |
| Card hover              | border-color      | `--rosi-duration-fast`          | ease-out    |
| Input focus             | border-color      | `--rosi-duration-normal` (200ms) | ease-out   |
| Send button press       | transform         | `--rosi-duration-fast`          | ease-out    |
| Settings nav switch     | background, color | `--rosi-duration-normal`        | ease-out    |
| Status dot pulse        | transform, opacity | 1.5s            | ease-in-out, infinite |

---

## 4. Responsive Breakpoints

| Breakpoint    | Behavior                                                     |
|---------------|--------------------------------------------------------------|
| ≥ 1280px     | Full layout: rail + content + composer fit side by side      |
| 920-1279px   | Composer and cards reflow within the workspace, content stays centered |
| ≤ 919px      | Rail collapses to icon-only, content takes full width        |
| ≤ 760px      | Memory source filterbar, addon/memory grid stack to single column |
| ≤ 600px      | Settings subnav stacks above the form                       |

The current implementation uses a 920px `min-width` on `body` and a 1180px
max-width on the settings workspace. v3 inherits this with the addition of
the 760px breakpoint already used in `workspace-modules.css`.

---

## 5. Accessibility Tokens

| Requirement           | Value                                                       |
|-----------------------|--------------------------------------------------------------|
| Focus ring            | 1px solid `--rosi-border-glow`, 2px offset                  |
| Min contrast (text)   | `--rosi-text-primary` on `--rosi-surface-base` → ~16.5:1 (AAA) |
| Min contrast (muted)  | `--rosi-text-secondary` on `--rosi-surface-base` → ~8.4:1 (AAA) |
| Min contrast (accent) | `--rosi-accent-default` on `--rosi-surface-base` → ~7.2:1 (AAA) |
| Min contrast (on-accent) | `--rosi-text-on-accent` on `--rosi-accent-default` → ~7.4:1 (AAA) |
| Touch target min      | 32px (icon), 38px (send), 40px (control), 42px (touch density) |
| ARIA roles            | `navigation` (rail), `main` (workspace), `complementary` (subnav), `textbox` (composer), `region` (cards) |
| Live regions          | Agent status messages → `aria-live="polite"`. Error banners → `aria-live="assertive"` |
| Required fields       | `aria-required="true"` plus visible asterisk or "(required)" |
| Error state           | `aria-invalid="true"`, `aria-describedby` linking to error message |
| Disclosure pattern    | Native `<details>`/`<summary>` for expandable sections      |

---

## 6. Open Items for Michel's Sign-off

1. **Palette direction:** Coherent Verdant is the recommended middle-ground
   option. Lean Implementation (keep `#24d18f`) is the smallest dev change.
   Lean Documentation (migrate to v0.2 sage) is the biggest. Mint Cyan and
   Warm Amber are larger departures.
2. **Atom count:** 5 atoms is the proposed set. Optional 6th: a separate
   Status Indicator atom if the dot pattern continues to multiply. Current
   recommendation: keep as Badge, Dot variant.
3. **Display font:** Current impl uses a serif display face for hero titles.
   v3 keeps Inter (matches v0.2). The serif is a separate decision worth
   flagging.
4. **Border tint:** All borders are now green-tinted. If the community
   prefers neutral gray borders (v0.2's choice), the alphas are the only
   thing that needs to change.
5. **Status color separation:** Info is now cool blue (`#5BA3C7`),
   distinct from success (which is the accent green). This is a deliberate
   break from v0.2's "all success/info = accent" pattern. Worth confirming.

---

## References

- v0.2 extraction (superseded): `reference/ui-extraction-browser.md`
- Current implementation: `Developer/resonant-os-extension/src/styles/`
- 9 source screenshots: captured 2026-06-15, in
  `reference/screenshots/` (main-workspace + side-panel)
- Auto-sync watch list (post-fix): 7 paths in
  `ResonantOS/2.0.0-alpha` (branch `dev`)

---

*Last updated: 2026-06-15 by Luma*
*Owner: Michel Navarra + Luma*
*Next: Michel sign-off → dev team consumes new tokens*
