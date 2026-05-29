---
version: "alpha"
name: ResonantOS Dashboard
colors:
  primary: "#1AE882"
  secondary: "#0D4D32"
  tertiary: "#A855F7"
  neutral: "#F8FAFC"
  dark: "#060F0A"
  darkSecondary: "#0A1F14"
  darkNeutral: "#1E293B"
typography:
  h1:
    fontFamily: "Poppins"
    fontSize: "32px"
    fontWeight: "600"
    lineHeight: "1.2"
  h2:
    fontFamily: "Poppins"
    fontSize: "24px"
    fontWeight: "600"
    lineHeight: "1.3"
  h3:
    fontFamily: "Poppins"
    fontSize: "18px"
    fontWeight: "500"
    lineHeight: "1.4"
  body-md:
    fontFamily: "Inter"
    fontSize: "16px"
    fontWeight: "400"
    lineHeight: "1.5"
  body-sm:
    fontFamily: "Inter"
    fontSize: "14px"
    fontWeight: "400"
    lineHeight: "1.5"
  caption:
    fontFamily: "JetBrains Mono"
    fontSize: "12px"
    fontWeight: "400"
    lineHeight: "1.4"
rounded:
  sm: "4px"
  md: "8px"
  lg: "12px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "16px"
  lg: "24px"
  xl: "32px"
  xxl: "48px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.dark}"
    rounded: "{rounded.md}"
    fontFamily: "{typography.body-md.fontFamily}"
    fontWeight: "500"
  button-secondary:
    backgroundColor: "transparent"
    textColor: "{colors.primary}"
    borderColor: "{colors.primary}"
    borderWidth: "1px"
    rounded: "{rounded.md}"
  card:
    backgroundColor: "{colors.darkSecondary}"
    borderColor: "{colors.darkNeutral}"
    borderWidth: "1px"
    rounded: "{rounded.lg}"
    padding: "{spacing.md}"
  input:
    backgroundColor: "{colors.darkSecondary}"
    borderColor: "{colors.darkNeutral}"
    borderWidth: "1px"
    rounded: "{rounded.md}"
    textColor: "{colors.neutral}"
    padding: "{spacing.sm} {spacing.md}"
  badge:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.dark}"
    rounded: "{rounded.sm}"
    fontSize: "12px"
    fontWeight: "500"
---

## Overview

ResonantOS is a modular AI agent dashboard — a cyberdeck for human-AI collaboration.

**Philosophy: Cyberdeck DNA**
Inspired by the cyberdeck movement: recycle what exists, combine it, create something new. The dashboard is not a polished product — it's a custom rig that evolves with its user. Always in construction. Never finished. Raw, functional, alive.

**Design principles:**
1. **No decorative design** — every pixel earns its place
2. **Essential only** — information density over whitespace
3. **Retro-futuristic, unpolished** — working prototype that ships
4. **Always in construction** — grows, gets modded, rebuilt. Visible structure
5. **User-adaptive** — molds to the user, not the other way around
6. **Modular** — every feature can be turned on/off (n8n approach)
7. **Recycle + combine** — integrate existing tools, don't replace them

**Three pillars:** Communication (Comms) + Knowledge (Brain) + Infrastructure (Engine). One surface, zero context switching.

The dashboard should feel like a command center built into a forest. Technologically sophisticated but never precious. Functional but never cold. A living tool that grows with its operator.

## Colors

### Primary — Phosphor Green (#1AE882)
The signature of ResonantOS. Used for primary actions, active states, and key data visualizations. Represents growth, vitality, and the "green light" for decentralized coordination.

### Secondary — Deep Emerald (#0D4D32)
Supporting green for backgrounds, depth layers, and hover states. Darker cousin of primary — maintains the green family without competing for attention.

### Tertiary — Electric Violet (#A855F7)
Used sparingly for special states: AI agent indicators, premium features, or creative/synthesis moments. Adds technological sophistication.

### Dark Backgrounds
- **Base:** #060F0A — deepest background, page canvas
- **Secondary:** #0A1F14 — card and panel backgrounds
- **Neutral:** #1E293B — borders, dividers, subtle separations

### Light Text (#F8FAFC)
High contrast against dark backgrounds. Used for primary text content. Never place on primary green — green on white/light is the brand moment.

## Typography

### Font Families
- **Headings:** Poppins (600/500 weight) — geometric, modern, slightly humanist
- **Body:** Inter (400 weight) — optimized for screen readability
- **Monospace:** JetBrains Mono — for data, addresses, code, timestamps

### Type Scale
- **H1:** 32px/600 — page titles, major sections
- **H2:** 24px/600 — card titles, subsection headers
- **H3:** 18px/500 — component headers, labels
- **Body-md:** 16px/400 — primary content, descriptions
- **Body-sm:** 14px/400 — secondary content, metadata
- **Caption:** 12px/400 — timestamps, tags, monospace data

## Layout

### Grid System
- **Base unit:** 8px
- **Page margins:** 24px (mobile), 48px (desktop)
- **Card gaps:** 16px
- **Section spacing:** 48px vertical rhythm

### Structure
1. **Sidebar navigation** — Fixed left, 240px wide, dark with subtle border
2. **Main content area** — Fluid, max-width 1400px centered
3. **Card grid** — Responsive: 1 col mobile, 2 col tablet, 3-4 col desktop

### Spacing Philosophy
Generous whitespace within dark environments. Dark doesn't mean cramped — it means intentional contrast. Breathing room signals premium quality.

## Components

### Button Primary
- Phosphor green background, dark text
- 8px border-radius, 16px horizontal padding
- Hover: brightness increase to 110%
- Active: scale to 98%

### Button Secondary
- Transparent background, phosphor green border (1px)
- Same sizing as primary
- Hover: background shifts to rgba(26, 232, 130, 0.1)

### Cards
- Dark secondary background (#0A1F14)
- 1px border in dark neutral (#1E293B)
- 12px border-radius
- 16px internal padding
- Subtle shadow: 0 4px 24px rgba(0, 0, 0, 0.4)

### Input Fields
- Dark secondary background
- 1px border in dark neutral
- 8px border-radius
- Focus state: border shifts to primary green with subtle glow

### Badges
- Phosphor green background, dark text
- 4px border-radius (nearly square)
- Small caps style, 12px font

## Motion

- **Transitions:** 200-300ms ease-out
- **Hover states:** Subtle brightness/shadow shifts
- **Page transitions:** Fade in with 150ms stagger
- **Data updates:** Pulse animation on phosphor green for live indicators

---

*Last updated: 2026-04-27 by Sokar ⚒️*
