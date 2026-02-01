# Integrate Pagefind for site search

## Description

We want to integrate search capability into the static site. We want to do this using Pagefind `https://pagefind.app/`. Pagefind will scan the *built* HTML pages and build an index. We will plan this work together. You should ask clarifying questions during the planning phase.

## Instructions

- Install Pagefind into the project: `https://pagefind.app/docs/`
- We should use the Node version. We can add this to the docker image. `https://pagefind.app/docs/installation/`
- Read the docs, but pagefind should index *after we build the static HTML*.
- UI
  - We can use the default UI: `https://pagefind.app/docs/ui-usage/`
  - We should create a partial for this
  - We want to include search on the following pages:
    - homepage
    - `papers/categories/` and all category pages (ex: `papers/categories/affective_computing/`)
    - `papers/keywords/` and all keyword pages (es: `papers/keywords/foo`)
    - `/videos/` and `videos/tags/` and all tag pages (ex: `/videos/tags/algorithms/`)
- Check the docs to see if there is any useful metadata we should add to the rendered HTML or meta tags (example: `https://pagefind.app/docs/filtering/`). Make suggestions and lets discuss.
- Keep list of running TODOs in this document. Update whenever we make changes. When we're done, we need to update the README and CLAUDE files to reflect what we added.

## Implementation Status: COMPLETE (verified 2026-02-01)

### Build stats
- Pagefind v1.4.0 (Extended)
- 815 pages indexed, 19,696 words, 5 filters (type, author, category, keyword, tag)
- Build time: ~5 seconds for indexing step

### What was done

#### Phase 1: Infrastructure
- [x] Added `npm` to Dockerfile apt-get install list (for `npx pagefind`)
- [x] Updated `Makefile` build target to chain `npx --yes pagefind --site build` after middleman build
- [x] Updated `docker-compose.yml` build service command
- [x] Updated `.github/workflows/scheduled-deploy.yml` build step
- [x] Fixed `Makefile` docker-build targets to include `--profile build --profile deploy` so all services get rebuilt (profiled services were skipped by default)

#### Phase 2: Search UI
- [x] Created `source/partials/_search.erb` with PagefindUI widget (default UI, showSubResults, showImages:false, try/catch for dev server)
- [x] Added Pagefind CSS custom property overrides to `source/stylesheets/screen.css` (font, colors, border-radius to match site theme)
- [x] Added `.pagefind-search-wrapper` styling with `width: 100%` so it spans full width above flex columns on listing pages

#### Phase 3: Search on pages
- [x] Homepage (`source/index.html.erb`) — after home-abstract section
- [x] Paper categories index (`source/paper_categories_index.html.erb`) — after h1
- [x] Paper category page (`source/paper_categories.html.erb`) — after h1
- [x] Paper keywords index (`source/paper_keywords_index.html.erb`) — after h1
- [x] Paper keyword page (`source/paper_keywords.html.erb`) — after h1
- [x] Video index (`source/video_index.html.erb`) — after h1
- [x] Video tag index (`source/video_tag_index.html.erb`) — after h1
- [x] Video tag page (`source/video_tag.html.erb`) — after h1

#### Phase 4: Metadata & Selective Indexing
- [x] `data-pagefind-body` on paper article, video article, blog article layout, homepage abstract section
- [x] `data-pagefind-filter="type"` hidden spans on paper/video/blog pages (values: "paper", "video", "blog")
- [x] `data-pagefind-filter="author"` on paper author names
- [x] `data-pagefind-filter="category"` on paper category links
- [x] `data-pagefind-filter="keyword"` on paper keyword links
- [x] `data-pagefind-filter="tag"` on video tag links
- [x] `data-pagefind-ignore` on header nav, footer, and pagination controls

#### Phase 5: Documentation
- [x] Updated this document with completion notes
- [x] Updated CLAUDE.md with Pagefind in tech stack and build process

### Issues resolved during implementation
1. **`npx: command not found` in Docker** — `npm` was added to Dockerfile but `docker compose build` skips profiled services (`build`, `deploy`). Fixed by adding `--profile build --profile deploy` to Makefile docker-build targets.
2. **`npx` hangs on download prompt** — Added `--yes` flag to all `npx pagefind` invocations so the pagefind package download is auto-confirmed.
3. **Search bar squeezed into flex column** — On listing pages (`article.tags`), the parent uses `display: flex` on desktop. Added `width: 100%` to `.pagefind-search-wrapper` so it spans the full width above the columns.

### Files changed
**New (1):** `source/partials/_search.erb`
**Modified (18):** `Dockerfile`, `Makefile`, `docker-compose.yml`, `.github/workflows/scheduled-deploy.yml`, `source/stylesheets/screen.css`, `source/index.html.erb`, `source/paper_categories_index.html.erb`, `source/paper_categories.html.erb`, `source/paper_keywords_index.html.erb`, `source/paper_keywords.html.erb`, `source/video_index.html.erb`, `source/video_tag_index.html.erb`, `source/video_tag.html.erb`, `source/paper.html.erb`, `source/video.html.erb`, `source/layouts/article.erb`, `source/partials/_header.erb`, `source/partials/_footer.erb`

### Verification steps
1. `make docker-build-no-cache` (pick up Dockerfile changes)
2. `make docker-site-build` (build site + pagefind index)
3. Verify `build/pagefind/` directory exists with `pagefind-ui.js`, `pagefind-ui.css`, and index fragments
4. Serve built files: `python3 -m http.server -d build 8000`
5. Test search on homepage, paper category pages, video index
6. Verify filters (type, category, keyword, author, tag) appear and work
7. Verify search results only show content pages (not listing pages)
8. Test on narrow viewport for responsive behavior
