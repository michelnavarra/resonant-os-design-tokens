# ROSI Color Palette v0.1 — ResonantOS Design System

**Created:** 2026-05-27
**Author:** Nami 🌊 (extracted from existing ResonantOS dashboard + Sokar's DESIGN.md)
**Status:** APPROVED — Michel sign-off on all 4 decisions. Ready for Luma to build HTML guide.
**Identity:** Cyberdeck DNA — raw, functional, retro-futuristic, always in construction

---

## Design Rationale

ResonantOS is a cyberdeck — not a polished product, a custom rig that evolves with its user. The palette is built around **Phosphor Green** as the signature. Dark backgrounds with green undertones create a "forest at night" atmosphere. Every pixel earns its place. No decoration. Essential only.

---

## Source

Colors extracted from two existing sources:
1. **`/resonantos-alpha/dashboard/static/css/dashboard.css`** — the live dashboard CSS variables
2. **`/Nstudio/Projects/blueprint/Dashboard/DESIGN.md`** — Sokar's design specification

### Decisions Made (Michel, 2026-05-27)
1. **Backgrounds → Forest green** (#060F0A). Gray is generic, green-tinted is the cyberdeck DNA.
2. **Text → High contrast** (#F8FAFC). Better accessibility.
3. **Electric Violet → Keep.** AI agent indicators need it.
4. **Success ≠ Accent.** Differentiate — accent is brand, success is status.

---

## 1. Base — Dark Theme

### From Live CSS (dashboard.css)

| Token | Hex | Role |
|-------|-----|------|
| `--bg-primary` | `#1A1A1A` | Main background |
| `--bg-secondary` | `#2A2A2A` | Sidebar, panels |
| `--bg-tertiary` | `#333333` | Tertiary surfaces |
| `--bg-hover` | `#3A3A3A` | Hover state |
| `--border` | `#3A3A3A` | Borders |
| `--border-light` | `#444444` | Lighter borders |

### From DESIGN.md (Sokar's spec)

| Token | Hex | Role |
|-------|-----|------|
| `--bg-primary` | `#060F0A` | Deepest background — deep forest |
| `--bg-secondary` | `#0A1F14` | Card and panel backgrounds — deep emerald |
| `--border` | `#1E293B` | Borders, dividers — slate neutral |

**✅ Decision:** Forest green (#060F0A) — green-tinted is the ResonantOS identity.

---

## 2. Text

### From Live CSS

| Token | Hex | Role |
|-------|-----|------|
| `--text-primary` | `#E0E0E0` | Primary text |
| `--text-secondary` | `#9CA3AF` | Secondary text |
| `--text-muted` | `#6B7280` | Muted text |

### From DESIGN.md

| Token | Hex | Role |
|-------|-----|------|
| `--text-primary` | `#F8FAFC` | High contrast — "Light Text" |
| (secondary) | (not specified separately) | |
| (muted) | (not specified separately) | |

**✅ Decision:** High contrast (#F8FAFC) — better accessibility.

---

## 3. Brand / Accent

### From Both Sources (Aligned)

| Token | Hex | Role | Why |
|-------|-----|------|-----|
| `--accent` | `#4ADE80` | Primary accent — Phosphor Green | The signature of ResonantOS. Growth, vitality, "green light" for decentralized coordination |
| `--accent-hover` | `#22C55E` | Hover state on green | Darker, more saturated |
| `--accent-muted` | `rgba(74, 222, 128, 0.2)` | Green at 20% opacity | Subtle backgrounds, badges |

### From DESIGN.md Only

| Token | Hex | Role | Why |
|-------|-----|------|-----|
| `--secondary` | `#0D4D32` | Deep Emerald — supporting green | Backgrounds, depth layers, hover states |
| `--tertiary` | `#A855F7` | Electric Violet | AI agent indicators, premium features, creative/synthesis moments. **Kept** — adds character |

### Success vs Accent (Differentiated)

| Token | Hex | Role | Why
|-------|-----|------|----
| `--success` | `#34D399` | Status: online, healthy, completed | Softer emerald — status, not brand. Distinct from the Phosphor Green accent |
| `--accent` | `#4ADE80` | Brand accent — Phosphor Green | The signature. Interactive elements, brand moments |

---

## 4. Semantic — Status Colors

### From Live CSS (Aligned)

| Token | Hex | Role |
|-------|-----|------|
| `--success` | `#34D399` | Online, healthy, completed (softer emerald, differentiated from accent) |
| `--warning` | `#FBBF24` | Degraded, slow, attention |
| `--error` | `#F87171` | Offline, failed, critical |
| `--info` | `#60A5FA` | Neutral updates, new data |

---

## 5. Light Theme Variant

### From Live CSS

| Token | Hex | Role |
|-------|-----|------|
| `--bg-primary-light` | `#F9FAFB` | Main background |
| `--bg-secondary-light` | `#FFFFFF` | Panels, cards |
| `--bg-tertiary-light` | `#F3F4F6` | Tertiary surfaces |
| `--bg-hover-light` | `#E5E7EB` | Hover state |
| `--text-primary-light` | `#1F2937` | Primary text |
| `--text-secondary-light` | `#4B5563` | Secondary text |
| `--text-muted-light` | `#9CA3AF` | Muted text |
| `--accent-light` | `#10B981` | Green adjusted for light backgrounds |
| `--accent-hover-light` | `#059669` | Hover on light |
| `--border-light` | `#E5E7EB` | Borders |
| `--border-light-light` | `#D1D5DB` | Lighter borders |

---

## 6. Typography (from DESIGN.md)

| Token | Value | Role |
|-------|-------|------|
| Font headings | `Poppins` | Geometric, modern, slightly humanist |
| Font body | `Inter` | Screen readability |
| Font mono | `JetBrains Mono` | Data, addresses, code, timestamps |

---

## 7. Spacing (from DESIGN.md)

| Token | Value |
|-------|-------|
| `--spacing-xs` | `4px` |
| `--spacing-sm` | `8px` |
| `--spacing-md` | `16px` |
| `--spacing-lg` | `24px` |
| `--spacing-xl` | `32px` |
| `--spacing-xxl` | `48px` |

---

## 8. Border Radius (from DESIGN.md)

| Token | Value |
|-------|-------|
| `--radius-sm` | `4px` |
| `--radius-md` | `8px` |
| `--radius-lg` | `12px` |

---

## All Decisions Locked ✅

1. ✅ **Forest green backgrounds** (#060F0A)
2. ✅ **High contrast text** (#F8FAFC)
3. ✅ **Electric Violet kept** (#A855F7)
4. ✅ **Success differentiated from accent** (#34D399 vs #4ADE80)

---

*Migrated by Nami from existing ResonantOS dashboard codebase + Sokar's DESIGN.md*
*Decisions locked by Michel — 2026-05-27*
*Next: Luma builds HTML guide → canonical tokens.json*
