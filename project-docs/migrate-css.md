# Migrate CSS from Sass/Bourbon/Neat

## Description

We want to migrate the site from Sass/Bourbon/Neat to vanilla CSS. We want the site to be responsive and viewable on mobile devices. We *do not* want to make changes to design or typography at this time. It is acceptable to implement newer CSS features like flex-box and similar to achieve our goals. We want to pay attention to a11y / accessibility.

Read through the existing stylesheets made with sass/scss and lets work together in converting these to regular CSS. Ask lots of questions, and after every step ask me to verify using the dev server.

---

## Analysis of Current Stylesheets

### Bourbon/Neat Features to Replace

| Feature | Replacement |
|---------|-------------|
| `outer-container` | `max-width` + `margin: auto` |
| `span-columns(N)` | Flexbox or CSS Grid |
| `media($breakpoint)` | Native `@media (min-width: 768px)` |
| `clearfix` | Modern clearfix or flexbox (no floats) |
| `flex(N)` | Native `flex: N` |
| `lighten/darken` | Pre-calculated color values |

### SASS Features to Replace

| Feature | Replacement |
|---------|-------------|
| `$variables` | CSS custom properties (`--var`) |
| Nesting | Flat selectors |
| `@extend %placeholder` | Regular utility classes |
| `@mixin`/`@include` | Inline CSS or utility classes |

### Current Breakpoints
- Mobile first: 4 columns
- Desktop: `min-width: 768px`
- Desktop banner: `min-width: 1137px`

---

## Migration Plan

### Phase 1: Setup
- [x] Create `screen.css` (vanilla CSS file)
- [x] Set up CSS custom properties for colors and fonts
- [x] Add modern CSS reset

### Phase 2: Base Layout
- [x] Convert body styles
- [x] Convert navigation (header)
- [x] Convert footer
- [x] Convert pagination

### Phase 3: Page Layouts
- [x] Convert homepage (`_home.scss`)
- [x] Convert article pages (`_article.scss`)
- [x] Convert tag/category pages (`_tags.scss`)
- [x] Convert chapter pages (`_chapters.scss`)

### Phase 4: Components
- [x] Convert badges/labels
- [x] Convert banners (PWLConf) - removed (outdated)
- [x] Convert sponsors section

### Phase 5: Cleanup
- [x] Remove SCSS files and bourbon/neat directories
- [x] Update Gemfile (remove direct sassc dependency)
- [ ] Test all pages for visual regression
- [ ] Test responsive behavior on mobile

---

## Decisions

- **Mobile testing:** Browser dev tools
- **Browser support:** Include older browsers (use flexbox, avoid CSS Grid)
- **PWLConf banner:** Remove banner styles (outdated 2017 conference)

---

## Changelog

### 2026-01-25 - Migration Complete
- Created `source/stylesheets/screen.css` with vanilla CSS
- Set up CSS custom properties for colors, fonts, and breakpoints
- Added modern CSS reset (box-sizing, margin reset)
- Converted all layouts: body, navigation, footer, pagination
- Converted all page types: homepage, articles, tags/categories, chapters
- Converted components: badges/labels, sponsors section
- Removed PWLConf banner styles (outdated 2017 conference)
- Fixed category page pagination to match homepage styling
- Removed old SCSS files: `_article.scss`, `_base.scss`, `_banner.scss`, `_chapters.scss`, `_fonts.scss`, `_home.scss`, `_reset.scss`, `_tags.scss`
- Removed `bourbon/` and `neat/` directories (91 files total)
- Removed direct `sassc` dependency from Gemfile (still a transitive dep of Middleman)
- Added underline on hover to links for colorblind accessibility (nav, chapter lists)
- Hidden chapter links on mobile viewport for cleaner mobile experience
- Updated CLAUDE.md to reflect CSS migration
