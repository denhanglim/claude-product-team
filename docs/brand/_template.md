# Brand Guidelines Template

> Place this file at `docs/brand/guidelines.md` in your project. The `ux-architect` reads it when it exists.
> Fill in the sections that apply. Delete the rest.

---

## Visual identity

**Primary colour:** <!-- hex, e.g. #2563EB -->
**Secondary colour:** <!-- hex -->
**Accent colour:** <!-- hex -->
**Error / destructive:** <!-- hex, default red #DC2626 -->
**Success:** <!-- hex, default green #16A34A -->

**Background (light mode):** <!-- hex, e.g. #FFFFFF -->
**Background (dark mode):** <!-- hex, e.g. #0F172A -->

---

## Typography

**Heading font:** <!-- e.g. Inter, system-ui -->
**Body font:** <!-- e.g. Inter, system-ui -->
**Mono font:** <!-- e.g. JetBrains Mono, ui-monospace -->

**Scale (px or rem):**

| Token | Size |
|-------|------|
| xs    |      |
| sm    |      |
| base  |      |
| lg    |      |
| xl    |      |
| 2xl   |      |

---

## Logo and assets

**Logo path:** <!-- e.g. public/logo.svg -->
**Favicon:** <!-- path -->
**App icon:** <!-- path (if mobile) -->

Usage rules (delete if not applicable):
- Do not stretch or recolour the logo.
- Minimum clear space: <!-- e.g. 16px on all sides -->

---

## Component conventions

**Border radius:** <!-- e.g. 6px for buttons, 4px for inputs, 12px for cards -->
**Shadow scale:** <!-- e.g. sm / md / lg tokens -->
**Spacing unit:** <!-- e.g. 4px base (Tailwind default) -->

**Button styles:**

| Variant | Background | Text | Border |
|---------|-----------|------|--------|
| primary | | | |
| secondary | | | |
| ghost | | | |
| destructive | | | |

---

## UI framework

**Framework:** <!-- e.g. React 18, Vue 3, SvelteKit -->
**Component library:** <!-- e.g. shadcn/ui, Radix, Headless UI, none -->
**CSS approach:** <!-- e.g. Tailwind CSS 3.x, CSS Modules, styled-components -->

If using Tailwind: list any custom tokens in `tailwind.config.js` that agents should know about.

---

## Tone and copy

**Voice:** <!-- e.g. direct, friendly, no jargon -->
**Button labels:** <!-- e.g. prefer "Save" over "Submit", "Remove" over "Delete" -->
**Error messages:** <!-- e.g. always explain what went wrong + what to do next -->
**Empty states:** <!-- e.g. always show a call to action, never just "No data" -->

---

## Accessibility

**Target WCAG level:** <!-- AA (recommended minimum) or AAA -->
**Minimum contrast ratio:** <!-- 4.5:1 for normal text, 3:1 for large text -->
**Focus visible:** <!-- describe focus ring style -->
**Motion:** <!-- e.g. respect prefers-reduced-motion; no auto-playing animations -->

---

## Existing components / design system

List any components already built that agents should reuse (not rebuild):

| Component | Location | Notes |
|-----------|----------|-------|
| | | |
