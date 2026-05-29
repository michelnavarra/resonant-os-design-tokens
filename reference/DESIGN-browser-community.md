---
version: alpha
name: ResonantOS Browser
description: A dark-themed AI-native Chromium browser with agent control, multi-model chat, and a browser automation layer. The visual language is minimal, dark, and functional — built for power users operating AI agent fleets.
colors:
  surface-deepest: "#1a1e21"
  surface-deep: "#1e2327"
  surface-raised: "#262b30"
  surface-overlay: "#2a3038"
  surface-hover: "#323940"
  border-subtle: "#363d44"
  border-strong: "#4a5259"
  text-primary: "#e8eaed"
  text-secondary: "#9aa0a6"
  text-tertiary: "#6b7280"
  text-on-accent: "#1a1e21"
  accent: "#8ab4a0"
  accent-strong: "#6bc49f"
  accent-muted: "#3d5a4d"
  accent-hover: "#7ecfaa"
  status-success: "#6bc49f"
  status-warning: "#f0b429"
  status-error: "#ef4444"
typography:
  display:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: 800
    lineHeight: 1.1
    letterSpacing: -0.03em
  heading-md:
    fontFamily: system-ui
    fontSize: 15px
    fontWeight: 600
    lineHeight: 1.4
  body:
    fontFamily: system-ui
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.55
  body-sm:
    fontFamily: system-ui
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.45
  label:
    fontFamily: system-ui
    fontSize: 11px
    fontWeight: 600
    lineHeight: 1.3
    letterSpacing: 0.05em
  label-sm:
    fontFamily: system-ui
    fontSize: 10px
    fontWeight: 500
    lineHeight: 1.3
  code:
    fontFamily: ui-monospace, SFMono-Regular, Menlo, monospace
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.5
  nav-tab:
    fontFamily: system-ui
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1
  button-label:
    fontFamily: system-ui
    fontSize: 13px
    fontWeight: 500
    lineHeight: 1
rounded:
  sm: 4px
  md: 8px
  lg: 12px
  full: 9999px
spacing:
  xs: 2px
  sm: 4px
  md: 8px
  lg: 12px
  xl: 16px
  2xl: 24px
  3xl: 32px
  4xl: 48px
components:
  action-card:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.md}"
    padding: 12px
  action-card-hover:
    backgroundColor: "{colors.surface-hover}"
  send-button:
    backgroundColor: "{colors.accent-strong}"
    textColor: "{colors.text-on-accent}"
    rounded: "{rounded.full}"
    size: 32px
  send-button-hover:
    backgroundColor: "{colors.accent-hover}"
  input-composer:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.md}"
    padding: 12px
  nav-item:
    textColor: "{colors.text-primary}"
    padding: 8px
  nav-item-active:
    textColor: "{colors.accent}"
  history-item:
    textColor: "{colors.text-tertiary}"
    padding: 8px
  history-item-hover:
    backgroundColor: "{colors.surface-hover}"
    textColor: "{colors.text-primary}"
  content-tab:
    textColor: "{colors.text-secondary}"
    typography: "{typography.nav-tab}"
  content-tab-active:
    textColor: "{colors.text-primary}"
  badge-running:
    backgroundColor: "{colors.accent-strong}"
    textColor: "{colors.text-on-accent}"
    rounded: "{rounded.sm}"
    typography: "{typography.label}"
  badge-done:
    backgroundColor: "{colors.surface-hover}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.sm}"
    typography: "{typography.label}"
  agent-control-card:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.md}"
    padding: 12px
  user-message:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.lg}"
    padding: 12px
  system-message:
    textColor: "{colors.text-primary}"
    typography: "{typography.body}"
  dropdown-selector:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.md}"
    padding: 8px
  open-sidebar-button:
    textColor: "{colors.text-primary}"
    rounded: "{rounded.md}"
    padding: 8px
---

## Overview

ResonantOS Browser is a dark-themed, AI-native Chromium browser built for operating agent fleets. The visual identity is **functional minimalism** — every element earns its place. The palette is dominated by deep blue-gray neutrals with a single muted green accent that signals interaction and agent activity. The interface should feel like a mission control terminal: dense with information, calm in color, precise in typography. No decoration for decoration's sake.

The UI has three primary zones: a narrow left sidebar for navigation and history, a central content area for conversation and the web, and an optional right panel (the Browser Layer) that surfaces agent control and automation state. The system must gracefully handle these zones expanding, collapsing, and overlapping at different viewport widths.

## Colors

The palette is anchored by a five-step neutral gray scale derived from blue-gray undertones, creating warmth without color noise. A single green accent family handles all interaction — buttons, active states, links, agent status — keeping the cognitive load minimal.

- **Surface-deepest (#1a1e21):** The darkest ground layer for the main content background.
- **Surface-deep (#1e2327):** The sidebar and secondary panel background. One step lighter to create a subtle spatial boundary without needing borders.
- **Surface-raised (#262b30):** Cards, input fields, and interactive containers. Lifts content one layer above the background.
- **Surface-hover (#323940):** Hover state for all interactive surfaces. Visible but not aggressive.
- **Accent (#8ab4a0):** The muted sage green used for active navigation text, tab labels, and links. Calm enough for sustained reading but distinct from the neutral text.
- **Accent-strong (#6bc49f):** The more saturated green for the send button, agent status dots, and RUNNING badges. This is the strongest chromatic signal in the interface.
- **Text-primary (#e8eaed):** High-contrast white for body text and headings. The main reading color.
- **Text-secondary (#9aa0a6):** Timestamps, placeholders, helper text. Readable but recessive.
- **Text-tertiary (#6b7280):** Disabled and inactive elements. Visible enough to show structure without competing for attention.

## Typography

The type system uses the native system font stack for speed and familiarity, with one exception: the "ResonantOS" hero wordmark is set in Inter Extra Bold at display scale for identity presence. Everything else relies on the OS default.

- **Display (48px/800):** The "ResonantOS" wordmark on the home screen. Heavy weight, tight tracking. This is the only place typographic personality is expressed.
- **Body (14px/400):** The primary reading size for chat messages, system output, and descriptions. Line-height 1.55 for comfortable dark-theme reading.
- **Body-sm (13px/400):** Used for denser contexts: card labels, history items, sidebar content, toolbar text.
- **Label (11px/600):** All-caps section headers ("HISTORY", "AGENT CONTROL"), badge text ("RUNNING", "DONE"). Tracked slightly wider for legibility at small size.
- **Label-sm (10px/500):** Timestamps and connection status. The smallest text in the system.
- **Code (13px/400, monospace):** Job IDs, position data, and system diagnostic output.

## Layout

The layout uses a **three-panel model** with a fixed sidebar, flexible content center, and an on-demand right panel.

The left sidebar is always 164px wide and anchored to the left edge. The content area fills the remaining space. The Browser Layer sidebar is ~460px and slides in from the right when activated, pushing or overlapping the content depending on viewport width.

An 8px base grid (with a 4px half-step) governs all internal spacing. Padding inside cards and inputs is 12px. Gaps between major sections are 16–24px. The input composer sits sticky at the bottom of the content area.

## Elevation & Depth

Depth is achieved primarily through **tonal layering** rather than shadows. Each surface step (deepest → deep → raised → overlay) is one notch lighter in the gray scale, creating implicit depth without box-shadows.

Shadows appear only on the Browser Layer panel (a soft 20px spread) and dropdown menus (a tighter 12px spread). Action cards gain a subtle 3px shadow on hover only. This restraint keeps the interface feeling flat and engineered.

## Shapes

The shape language is **soft-functional**. Most interactive elements use an 8px radius — enough to feel modern without looking rounded or playful. Chat bubbles use a 12px radius for a conversational feel. Circular shapes (avatars, send button, step numbers, indicator dots) use full rounding. There are no sharp corners except divider lines.

## Components

### Action cards
Three cards ("Research the web", "Plan work", "Control browser") arranged in a horizontal row on the home screen. Each is a bordered container with top-left text label. On hover, the border strengthens and a subtle shadow appears.

### Input composer
A bordered textarea with placeholder "Ask Augmentor anything." Below the textarea, a toolbar row contains a "+" attachment button, a mode dropdown ("Auto"), a model dropdown ("MiniMax 2.7"), a connection status label, and a circular green send button. The composer stays sticky at the bottom of the viewport.

### Agent Control card
An elevated card in the Browser Layer sidebar with a green left accent border. Contains a "AGENT CONTROL" label badge, a "RUNNING · 2/2" status badge, the task goal text, and a numbered list of completed steps (each showing a step number, action name, description, and DONE badge).

### Chat messages
User messages are right-aligned bubbles with a darker raised background and 12px radius. System messages are left-aligned plain text with no bubble. Both show a sender label and timestamp. The Browser Layer sidebar contains its own parallel chat stream.

### Agent thinking indicator
A pulsing green dot with "Deciding next browser action" text and a "Loop 3/12" counter. Signals active agent reasoning.

## Do's and Don'ts

- Do keep the interface dark at all times — there is no light theme.
- Do use the green accent sparingly. It should mark interactive or live elements, not decorative ones.
- Do left-align all sidebar text. Center-align only the hero wordmark and description.
- Do use uppercase + tracking for section labels (HISTORY, AGENT CONTROL) — this is a deliberate design choice for scannability.
- Don't add colors beyond the green accent without a functional reason.
- Don't use shadows for depth except on overlaying panels and dropdowns.
- Don't center-align body text or chat messages.
- Don't make the left sidebar wider than 164px — it's intentionally narrow to maximize the content area.
- Don't use rounded corners larger than 12px except on circles (avatars, send button).
