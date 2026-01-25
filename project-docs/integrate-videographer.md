# Generate video pages from videographer.json

## Description

We want to change the way we generate video pages. We want to remove all of the existing source files for videos (ex: 2018-07-02-dan-creager-pastry.html.markdown). We want to dynamically generate new pages from `data/videographer.json`.

Read through the existing files and Middleman documentation to understand how set this up. Ask lots of questions, lets work together to find the best approach. After every step ask me to verify using the dev server. Keep a running project status (todos) and changelog in this file.

Instead of deleting the source files for existing videos let's back them up to a folder.

Here's and initial idea on how we should map fields from the JSON entries to the posts:

- title: the title of the page and the post
- published_at: the date of the page, should be just the date, no timestamp, in yyyy-mm-dd format.
- tags: should include the default tags meetup and video. the other tags should be "slugified"
- description: this is the page contents
- youtube_id: this is the video we want to embed in the page

The generated pages should have the following attributes (what would normally be in frontmatter):

```yaml
label: Video
category: video
author: Papers We Love
ogp:
  og:
    description: {title}
  fb:
    description: {title}
```

---

## Decisions

- **URL structure:** `/videos/{slug}/` (separate from blog)
- **Slug format:** lowercase, hyphenated, max 80 chars (e.g., "aaron-goldman-on-chord-pwl-sf-082018")
- **Backup location:** `backup/video-posts/`

---

## Status

### Completed
- [x] Back up existing video posts (76 files) to `backup/video-posts/`
- [x] Create `video.html.erb` template
- [x] Add video page generation to `config.rb`
- [x] Handle duplicate slugs with counter suffix
- [x] Parse tags from comma-separated string + add defaults (meetup, video)
- [x] Parse date from `published_at` timestamp

### Completed
- [x] Add video index page (`/videos/`)
- [x] Improve page title in browser tab (now shows video title)
- [x] Add OGP metadata for individual videos (title + YouTube thumbnail, 480x360)
- [x] Add CSS for video embed responsiveness (padding-bottom 16:9 technique)
- [x] Remove Twitter meta tags
- [x] Add margin to video page h1 for spacing
- [x] Auto-link URLs in video descriptions
- [x] Mix videos into homepage feed
- [x] Update nav "Videos" link to point to `/videos/`
- [x] Create video tag index pages (`/videos/tags/{tag}/`)

### TODO
- [ ] Final testing

---

## Changelog

### 2026-01-25 - Complete Implementation

**Video Pages (218 pages)**
- Backed up 76 existing video markdown files to `backup/video-posts/`
- Created `source/video.html.erb` template with:
  - Video title as h1 with 0.5rem top margin
  - Video label with date
  - Responsive YouTube embed (16:9 aspect ratio using padding-bottom technique)
  - Description with auto-linked URLs and paragraph formatting
  - Tags linking to video tag pages
- Updated `config.rb` with:
  - Helper functions: `slugify`, `config_parse_tags`, `config_parse_date`
  - `format_description` helper for auto-linking URLs
  - `auto_link_escaped` helper for safe URL linking
  - Video proxy generation from `data/videographer.json`
  - Duplicate slug handling

**Video Index Page (`/videos/`)**
- Lists all 218 videos sorted by date (newest first)
- Links to individual video pages
- Sidebar with browse links

**Video Tag Pages (372 pages)**
- Created `source/video_tag.html.erb` template
- Generates tag index at `/videos/tags/{tag}/` for each unique tag
- Video page tags now link to these tag pages

**OGP Metadata**
- Page title shows video title
- `og:image` uses YouTube thumbnail URL
- `og:image:width` = 480, `og:image:height` = 360
- `og:description` uses video title

**Homepage Integration**
- Videos mixed into homepage feed alongside blog articles
- Combined entries sorted by date (newest first)
- Page 1 shows 10 most recent (mix of articles + videos)
- Subsequent pages show blog articles only
- "View all videos" link at bottom of page 1

**Navigation**
- Updated "Videos" link in header to point to `/videos/`

**Styling**
- Responsive video embed using padding-bottom: 56.25% (16:9)
- Video page h1 has 0.5rem top margin
- Removed Twitter meta tags from layout

**Auto-linking URLs**
- URLs in video descriptions are automatically converted to clickable links
- Works on both video pages (full description) and homepage (truncated)
- Links open in new tab with `rel="noopener"`
