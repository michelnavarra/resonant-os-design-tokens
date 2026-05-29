# ResonantOS Browser — UI Component & Token Extraction

> Extracted from 2 screenshots: home state (Screenshot01) and browser-control + sidebar state (Screenshot04).
> Custom Chromium browser with AI agent chat, browser layer sidebar, and multi-model support.

---

## 1. Design Tokens

### 1.1 Color Tokens

#### Neutrals (Dark theme — primary surface family)

| Token                | Hex       | Role                                              |
|----------------------|-----------|----------------------------------------------------|
| `$surface-deepest`   | `#1a1e21` | Main content background, browser body               |
| `$surface-deep`      | `#1e2327` | Sidebar background, chat area background             |
| `$surface-raised`    | `#262b30` | Cards (action cards), input field background         |
| `$surface-overlay`   | `#2a3038` | Sidebar panel (Browser Layer), elevated surfaces     |
| `$surface-hover`     | `#323940` | Card hover, history item hover                       |
| `$border-subtle`     | `#363d44` | Card borders, input borders, dividers               |
| `$border-strong`     | `#4a5259` | Active borders, separator lines                      |

#### Text hierarchy

| Token                | Hex       | Role                                              |
|----------------------|-----------|----------------------------------------------------|
| `$text-primary`      | `#e8eaed` | Primary body text, headings, chat messages          |
| `$text-secondary`    | `#9aa0a6` | Timestamps, helper text, placeholders, muted labels |
| `$text-tertiary`     | `#6b7280` | Disabled text, inactive history items               |
| `$text-on-accent`    | `#1a1e21` | Text on green accent (send button arrow)            |

#### Accent (Green — primary action family)

| Token                | Hex       | Role                                              |
|----------------------|-----------|----------------------------------------------------|
| `$accent`            | `#8ab4a0` | Primary accent — tab labels, active nav text, links |
| `$accent-strong`     | `#6bc49f` | Send button background, active indicator dot        |
| `$accent-muted`      | `#3d5a4d` | Accent card background tint (subtle)                |
| `$accent-hover`      | `#7ecfaa` | Accent hover state                                  |

#### Status

| Token                | Hex       | Role                                    |
|----------------------|-----------|------------------------------------------|
| `$status-success`    | `#6bc49f` | "DONE" badge, active pulse dot           |
| `$status-running`    | `#6bc49f` | "RUNNING" badge background               |
| `$status-info`       | `#8ab4a0` | System message label color               |
| `$status-warning`    | `#f0b429` | Percentage indicator (14%)               |
| `$status-error`      | `#ef4444` | (not visible — inferred for completeness)|

#### Chrome integration

| Token                | Hex       | Role                                     |
|----------------------|-----------|-------------------------------------------|
| `$chrome-tab-bg`     | `#292d32` | Chromium tab bar background               |
| `$chrome-tab-active` | `#1e2327` | Active tab matches sidebar bg             |
| `$chrome-toolbar`    | `#1e2327` | URL bar area background                   |
| `$chrome-icon`       | `#9aa0a6` | Extension icons, nav arrows               |

### 1.2 Typography Tokens

| Token              | Family                  | Size         | Weight | Letter-spacing | Line-height | Usage                              |
|--------------------|-------------------------|-------------|--------|---------------|-------------|-------------------------------------|
| `$display`         | Inter (system sans)     | 3rem (48px) | 800    | -0.03em       | 1.1         | "ResonantOS" hero wordmark          |
| `$heading-md`      | System sans-serif       | 0.9375rem (15px) | 600 | 0          | 1.4         | Sidebar panel title, "AGENT CONTROL" label |
| `$body`            | System sans-serif       | 0.875rem (14px)  | 400 | 0          | 1.55        | Chat messages, system messages, body text |
| `$body-sm`         | System sans-serif       | 0.8125rem (13px) | 400 | 0          | 1.45        | Card labels, history items, descriptions |
| `$label`           | System sans-serif       | 0.6875rem (11px) | 600 | 0.05em     | 1.3         | "HISTORY" section header, "AGENT CONTROL" badge, "RUNNING", "DONE" |
| `$label-sm`        | System sans-serif       | 0.625rem (10px)  | 500 | 0          | 1.3         | Timestamps (08:05 PM), connection status |
| `$code`            | System monospace        | 0.8125rem (13px) | 400 | 0          | 1.5         | Job IDs, position data, command text |
| `$nav-tab`         | System sans-serif       | 0.875rem (14px)  | 500 | 0          | 1          | "Answer", "Links", "Images" tab labels |
| `$nav-tab-active`  | System sans-serif       | 0.875rem (14px)  | 700 | 0          | 1          | Active tab (bold, with underline)   |
| `$button-label`    | System sans-serif       | 0.8125rem (13px) | 500 | 0          | 1          | "+ New", "Open Sidebar", dropdowns  |

### 1.3 Spacing Tokens

| Token        | Value     | px   | Usage                                                 |
|-------------|----------|------|-------------------------------------------------------|
| `$sp-1`     | 0.125rem | 2px  | Micro: indicator dot offset, border width              |
| `$sp-2`     | 0.25rem  | 4px  | Icon-to-text micro gap, focus ring offset              |
| `$sp-3`     | 0.5rem   | 8px  | Compact padding (history items), icon button inner pad |
| `$sp-4`     | 0.75rem  | 12px | Card internal padding, chat message padding            |
| `$sp-5`     | 1rem     | 16px | Sidebar section padding, major gap between elements    |
| `$sp-6`     | 1.5rem   | 24px | Chat area side margins, input composer margins         |
| `$sp-7`     | 2rem     | 32px | Between card group and input, hero vertical spacing    |
| `$sp-8`     | 3rem     | 48px | Hero section top padding                               |

### 1.4 Sizing Tokens

| Token               | Value     | Usage                                        |
|---------------------|----------|-----------------------------------------------|
| `$sidebar-w`        | 164px    | Left nav sidebar width                         |
| `$browser-layer-w`  | ~460px   | Right sidebar (Browser Layer) panel width      |
| `$history-sidebar-w`| ~120px   | Narrow history sidebar within Browser Layer    |
| `$icon-xs`          | 14px     | Inline icons (copy, expand, delete)            |
| `$icon-sm`          | 16px     | Toolbar icons, dropdown carets                 |
| `$icon-md`          | 20px     | Extension bar icons                            |
| `$icon-lg`          | 24px     | Avatar "R" circle                              |
| `$send-btn-d`       | 32px     | Send button circle diameter                    |
| `$avatar-d`         | 28px     | User/system avatar circle                      |
| `$card-min-h`       | 56px     | Action card (Research/Plan/Control) min height |
| `$input-h`          | ~80px    | Composer textarea minimum height               |
| `$toolbar-row-h`    | 36px     | Input toolbar row (dropdowns + send)           |
| `$step-num-d`       | 20px     | Agent step number circle                       |

### 1.5 Border & Radius Tokens

| Token                 | Value                            | Usage                                 |
|-----------------------|----------------------------------|---------------------------------------|
| `$border-card`        | 1px solid `$border-subtle`       | Action cards, input composer border   |
| `$border-divider`     | 1px solid `$border-subtle`       | Between history items, section dividers|
| `$border-panel`       | 1px solid `$border-strong`       | Browser Layer panel left edge         |
| `$border-agent`       | 2px solid `$accent-strong`       | Agent Control card left/top accent    |
| `$radius-sm`          | 4px                              | History items, inline badges          |
| `$radius-md`          | 8px                              | Action cards, input composer, dropdowns|
| `$radius-lg`          | 12px                             | Chat message bubbles (user messages)  |
| `$radius-full`        | 50% (9999px)                     | Avatar circle, send button, step numbers, indicator dot |

### 1.6 Elevation Tokens

| Token              | Value                              | Usage                           |
|--------------------|-------------------------------------|---------------------------------|
| `$shadow-none`     | none                                | Default — system is border-based|
| `$shadow-panel`    | 0 0 20px rgba(0,0,0,0.3)          | Browser Layer panel              |
| `$shadow-card`     | 0 1px 3px rgba(0,0,0,0.15)        | Action cards on hover            |
| `$shadow-dropdown` | 0 4px 12px rgba(0,0,0,0.25)       | Dropdown menus                   |

### 1.7 Motion Tokens

| Token           | Value  | Easing      | Usage                                    |
|-----------------|--------|-------------|-------------------------------------------|
| `$motion-fast`  | 100ms  | ease-out    | Button hover, badge appear                |
| `$motion-base`  | 200ms  | ease-out    | Panel slide, tab switch, card hover       |
| `$motion-slow`  | 350ms  | ease-in-out | Browser Layer slide-in, page transitions  |
| `$motion-pulse` | 1.5s   | ease-in-out | Green dot pulse (infinite, agent thinking)|

### 1.8 Z-Index Tokens

| Token              | Value | Usage                                    |
|--------------------|-------|-------------------------------------------|
| `$z-base`          | 0     | Page content                              |
| `$z-sidebar`       | 10    | Left sidebar nav                          |
| `$z-tabs`          | 20    | Content tabs (Answer/Links/Images)        |
| `$z-input`         | 30    | Input composer (sticky bottom)            |
| `$z-browser-layer` | 40    | Right sidebar panel                       |
| `$z-dropdown`      | 50    | Model selector dropdown, mode dropdown    |
| `$z-chrome`        | 100   | Chromium tab bar, URL bar, extensions     |
| `$z-ai-mode`       | 100   | "AI Mode" badge in toolbar                |

---

## 2. Component Inventory — Atomic Hierarchy

### 2.1 Atoms

**A01 — Avatar circle**
Circle with letter initial. Size: `$avatar-d` (28px). Background: `$surface-raised`. Text: `$text-primary`, centered, `$body-sm` weight 600. Border-radius: `$radius-full`.

**A02 — Icon**
Sizes: 14px (action icons), 16px (toolbar), 20px (extension bar), 24px (avatar). Color: inherits `currentColor`. Stroke: 1.5px. Variants: copy, expand-vertical, trash, plus, chevron-down, send-arrow, settings-gear, back-arrow, forward-arrow, refresh, close (×), sparkle (AI mode).

**A03 — Indicator dot**
Pulsing green circle. Size: 8px. Color: `$accent-strong`. Animation: scale 1→1.3→1, `$motion-pulse` infinite. Indicates: agent is thinking/deciding.

**A04 — Badge**
Rounded pill label. Background: `$accent-strong` (RUNNING), `$surface-hover` (DONE). Text: `$label` (11px/600), uppercase. Padding: 2px 8px. Border-radius: `$radius-sm`.

**A05 — Step number**
Numbered circle for agent task steps. Size: `$step-num-d` (20px). Background: `$surface-hover`. Text: `$label-sm`, centered. Border-radius: `$radius-full`.

**A06 — Divider**
Horizontal: 1px solid `$border-subtle`. Separates history items, chat sections.

**A07 — Timestamp**
Right-aligned or inline. Font: `$label-sm` (10px). Color: `$text-secondary`. Format: "08:05 PM".

**A08 — Link**
Color: `$accent`. Underline on hover. Used in: footer ("ResonantOS Browser Layer"), system messages.

### 2.2 Molecules

**M01 — New button**
Structure: "+" icon + "New" text. Background: `$accent-muted`. Text: `$accent`. Border: 1px solid `$accent`/30% opacity. Radius: `$radius-md`. Padding: `$sp-3` `$sp-5`. Full sidebar width. Hover: `$accent-muted` brightens.

**M02 — Nav section item**
Structure: text label only, full-width clickable. States: default (`$text-primary`, transparent bg), hover (`$surface-hover` bg), active (`$accent` text, left accent border or highlight bg). Font: `$body-sm`. Padding: `$sp-3` `$sp-4`.

**M03 — Section header**
Structure: uppercase label text. Font: `$label` (11px/600). Color: `$text-secondary`. Letter-spacing: `$sp-1` (0.05em). Margin: `$sp-5` 0 `$sp-3`. Example: "HISTORY".

**M04 — History item**
Structure: single-line truncated text. Font: `$body-sm`. Color: `$text-tertiary` (default), `$text-primary` (hover/active). Background: transparent → `$surface-hover` on hover. Active: highlighted bg `$surface-raised`. Padding: `$sp-3` `$sp-4`. Text-overflow: ellipsis.

**M05 — Content tab**
Structure: text label, horizontal row. Font: `$nav-tab` (14px/500). States: default (`$text-secondary`), active (`$text-primary`, weight 700, bottom border 2px `$text-primary`). Padding: `$sp-3` `$sp-5`. Gap between tabs: `$sp-5`.

**M06 — Open Sidebar button**
Structure: outlined pill button. Border: 1px solid `$border-subtle`. Background: transparent. Text: `$body-sm`, `$text-primary`. Radius: `$radius-md`. Padding: `$sp-2` `$sp-4`. Hover: `$surface-hover` bg.

**M07 — Action card**
Structure: text label, top-left aligned inside bordered card. Background: `$surface-raised`. Border: 1px solid `$border-subtle`. Radius: `$radius-md`. Min-height: `$card-min-h`. Padding: `$sp-4`. Text: `$body-sm`, `$text-primary`. Hover: border → `$border-strong`, subtle `$shadow-card`. 3-column layout of these cards.

**M08 — Dropdown selector**
Structure: label text + chevron-down icon. Background: `$surface-raised`. Border: 1px solid `$border-subtle`. Radius: `$radius-md`. Padding: `$sp-2` `$sp-3`. Font: `$body-sm`. Variants: "Auto" (mode), "MiniMax 2.7" (model).

**M09 — Send button**
Circle button. Diameter: `$send-btn-d` (32px). Background: `$accent-strong`. Icon: right-arrow, `$text-on-accent`. Radius: `$radius-full`. Hover: `$accent-hover`.

**M10 — Chat message (User)**
Structure: right-aligned bubble. Background: `$surface-raised`. Radius: `$radius-lg` (rounded top-left, top-right, bottom-left; sharp bottom-right). Padding: `$sp-3` `$sp-4`. Font: `$body`. Header: "You" label + A07 timestamp, right-aligned.

**M11 — Chat message (System)**
Structure: left-aligned, no bubble (flat text). Background: transparent. Font: `$body`. Color: `$text-primary`. Header: "System" label (font: `$heading-md`, weight 600) + A07 timestamp. Content may be multi-line with job metadata in `$code` font.

**M12 — Agent action step**
Structure: A05 step number + action name + description + A04 badge (DONE/RUNNING). Layout: number circle left, text center, badge right. Background: transparent. Font: `$body-sm` for action, `$label-sm` for description. Vertical stacking inside Agent Control card.

**M13 — Message action bar**
Structure: row of icon buttons (copy, expand, trash). Icon size: 14px. Color: `$text-tertiary`. Gap: `$sp-3`. Appears below each chat message in the sidebar.

**M14 — Connection status**
Structure: inline text. Font: `$label-sm`. Color: `$text-secondary`. Content: "Connected to MiniMax 2.7 · R…" or "Connected to MiniMax 2.7 · Ready". Appears in input toolbar.

**M15 — AI Mode badge**
Structure: sparkle icon + "AI Mode" text. Background: transparent (outlined). Border: 1px solid `$border-subtle`. Radius: `$radius-md`. Font: `$body-sm`. Color: `$text-primary`. Located in Chromium toolbar, right side.

**M16 — Footer bar item**
Structure: text link or icon + text. Font: `$body-sm`. Color: `$accent`. Variants: "ResonantOS Browser Layer" (center link), "✏ Customize Chromium" (right pill). Background for pill: `$surface-raised`.

**M17 — Sidebar toolbar row**
Structure: "+" button + mode icons (intake, status, labels) + model dropdown + "mic" label + percentage badge + send button. Horizontal layout. Height: `$toolbar-row-h`. Background: `$surface-deep`. Border-top: `$border-divider`.

### 2.3 Organisms

**O01 — Left sidebar navigation**
Position: fixed left, full height below Chrome toolbar. Width: `$sidebar-w` (164px). Background: `$surface-deep`. Children: A01 avatar (top), M01 new button, M02 nav items (Answer, Living Archive, Hermes, OpenCode), M03 section header ("HISTORY"), M04 history items (scrollable list). Border-right: `$border-divider`.

**O02 — Content tabs bar**
Position: sticky top of content area. Layout: horizontal, centered. Children: M05 content tabs ("Answer", "Links", "Images"). Right side: M06 open sidebar button. Background: transparent (inherits `$surface-deepest`).

**O03 — Hero / welcome section**
Layout: centered vertically in content area. Children: Display wordmark "ResonantOS" (`$display` font, `$text-primary`), description paragraph (`$body`, `$text-secondary`, centered, max-width ~600px), M07 action card row (3-column, gap `$sp-5`). Visible only on empty/new chat state.

**O04 — Input composer**
Position: sticky bottom of content area. Background: `$surface-raised`. Border: 1px solid `$border-subtle`. Radius: `$radius-md`. Children: textarea (placeholder "Ask Augmentor anything", `$body`, `$text-tertiary`), toolbar row (M08 dropdowns + M14 connection status + M09 send button + plus icon). Min-height: `$input-h`.

**O05 — Chat conversation area**
Layout: vertical scroll, full content width. Children: alternating M10 (user messages, right-aligned) and M11 (system messages, left-aligned). Padding: `$sp-6` sides. Gap between messages: `$sp-5`.

**O06 — Browser Layer sidebar (right panel)**
Position: fixed right, full height. Width: `$browser-layer-w` (~460px). Background: `$surface-overlay`. Border-left: `$border-panel`. Shadow: `$shadow-panel`. Z-index: `$z-browser-layer`. Children: panel header (title "ResonantOS Browser Layer" + settings + close), internal layout splits into mini-history-sidebar + chat area + agent control section + M17 toolbar row. Toggle: slides in from right via M06 button.

**O07 — Agent Control card**
Container with accent highlight. Border-left or top: `$border-agent` (2px `$accent-strong`). Background: `$surface-raised` → slightly elevated. Header: A04 "AGENT CONTROL" label badge + "RUNNING · 2/2" status badge. Title: goal text (`$body`, `$text-primary`). Children: M12 agent action steps (numbered list). Padding: `$sp-4`.

**O08 — Agent thinking indicator**
Structure: A03 pulsing dot + text. Text: "Deciding next browser action" (`$body`, `$text-primary`). Sub-text: "Loop 3/12" (`$body-sm`, `$text-secondary`). Appears above O07 agent control card.

**O09 — Footer bar**
Position: fixed bottom, full width. Height: ~32px. Background: `$surface-deep`. Children: M16 footer items. Layout: center link + right pill button. Border-top: `$border-divider`.

### 2.4 Templates

**T01 — Home / New chat**
```
┌─ Chromium tab bar + URL bar + extensions ────────────────────────┐
├─ O01 Left sidebar ─┬─ O02 Content tabs (Answer|Links|Images)  ──┤
│                    ├─ O03 Hero (wordmark + description + cards) ─┤
│                    │                                              │
│                    │         (centered, vertical)                │
│                    │                                              │
│                    ├─ O04 Input composer (sticky bottom) ────────┤
├────────────────────┴─ O09 Footer bar ───────────────────────────┤
└──────────────────────────────────────────────────────────────────┘
```

**T02 — Active chat + Browser Layer open**
```
┌─ Chromium tab bar + URL bar + [AI Mode] + extensions ────────────┐
├─ O01 Left  ─┬─ O02 Tabs ───────────┬─ O06 Browser Layer ───────┤
│  sidebar    ├─ O05 Chat area       │  ├─ Mini sidebar (history)  │
│             │  ├─ M10 user msg     │  ├─ Chat messages           │
│             │  ├─ M11 system msg   │  ├─ O08 Thinking indicator  │
│             │  ├─ M11 system msg   │  ├─ O07 Agent Control card  │
│             │  │                    │  │  ├─ M12 step (DONE)      │
│             │  │                    │  │  └─ M12 step (DONE)      │
│             ├─ O04 Input composer  │  ├─ Sidebar input + toolbar  │
├─────────────┴──────────────────────┴─────────────────────────────┤
│  O09 Footer bar                                                   │
└───────────────────────────────────────────────────────────────────┘
```

---

## 3. Interaction States

| Component          | Default                 | Hover                    | Active/Selected             | Focus                | Disabled            |
|-------------------|-------------------------|--------------------------|-----------------------------|-----------------------|---------------------|
| Nav item (M02)    | `$text-primary`         | `$surface-hover` bg      | `$accent` text, highlight bg | 2px `$accent` outline | `$text-tertiary`    |
| History item (M04)| `$text-tertiary`        | `$surface-hover` bg, `$text-primary` | `$surface-raised` bg | 2px `$accent` outline | —                   |
| Content tab (M05) | `$text-secondary`       | `$text-primary`          | `$text-primary`, bold, underline | 2px `$accent` outline | —               |
| Action card (M07) | `$border-subtle` border | `$border-strong`, shadow | —                           | 2px `$accent` outline | `$text-tertiary`    |
| Send button (M09) | `$accent-strong` bg     | `$accent-hover` bg       | scale(0.95)                  | 2px ring              | 50% opacity         |
| Open Sidebar (M06)| transparent bg          | `$surface-hover` bg      | —                           | 2px `$accent` outline | —                   |
| Dropdown (M08)    | `$surface-raised` bg    | `$surface-hover` bg      | border `$accent`            | 2px `$accent` outline | 50% opacity         |

### Transitions

| Trigger                 | Property          | Duration        | Easing      |
|-------------------------|-------------------|-----------------|-------------|
| Nav/history hover       | background, color | `$motion-fast`  | ease-out    |
| Tab switch              | border, font-weight | `$motion-base` | ease-out   |
| Card hover              | border, shadow    | `$motion-fast`  | ease-out    |
| Browser Layer open      | transform (translateX) | `$motion-slow` | ease-in-out |
| Send button hover       | background        | `$motion-fast`  | ease-out    |
| Agent dot pulse         | scale, opacity    | `$motion-pulse` | ease-in-out |
| Message appear          | opacity, translateY | `$motion-base` | ease-out   |

---

## 4. Responsive Breakpoints

| Breakpoint    | Behavior                                                     |
|--------------|--------------------------------------------------------------|
| ≥ 1280px     | Full layout: sidebar + content + Browser Layer can coexist   |
| 900–1279px   | Browser Layer overlays content (doesn't push)                |
| ≤ 899px      | Sidebar collapses, Browser Layer full-screen overlay          |

---

## 5. Accessibility Tokens

| Requirement           | Value                                                  |
|-----------------------|--------------------------------------------------------|
| Focus ring            | 2px solid `$accent`, 2px offset                        |
| Min contrast (text)   | `$text-primary` on `$surface-deep` → ~10:1 (passes AA) |
| Min contrast (accent) | `$accent` on `$surface-deep` → ~4.8:1 (passes AA)     |
| Touch target min      | 32px (`$send-btn-d`), 44px for major controls           |
| ARIA roles            | `navigation` (sidebar), `main` (chat), `complementary` (Browser Layer), `textbox` (composer) |
| Live regions          | Agent status messages → `aria-live="polite"`. "Deciding next action" → `aria-live="assertive"` |
