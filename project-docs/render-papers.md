# Render Papers

## Description

We are going to create a detailed plan to dynamically generate individual pages for research papers in the site. We are also going to generate index pages of paper categories and keywords. We will plan this together, and ask clarifying questions. Once we have a plan please add TODOs to this document so we can track progress. Update this document continuously.

In `data/json` are a set of JSON files:
- `/papers` contains individual JSON files with all of the metadata for a research paper. Each file is named by its `uuid`, ex: `deadbeef.json`
- `categories.json` is an object of categories containing a list of paper `uuid` and `titles`s which correspond to a file in `/papers`
- `keywords.json` is similar to `categories.json`, it's an index of keywords for each paper as identified by `uuid`

## Objectives

### Objective 1

- For each paper in `/papers` we want to create an html page.
- The path for the page should be in the path `/papers/<slug>-<uuid[0..7]>`.
- The `slug` is a "slugified" version of the paper `title`, with a cap of 50 characters.
- The title of the page is the `title` of the paper, this should be the `<h1>` and the title og and meta tags.
- The page should display the `publication_date` and the `authors` in the order they appear in the JSON.
- The `raw_url` is the external link to the PDF of the paper. We should link this as "Read the paper".
- The `category_path` items should link to category index pages (see `categories.json`).
- The `keywords` should be rendered on the page and link to the relevant keyword index page (see `keywords.json`). The keywords should be rendered in links as "de-slugified", ex: `data-availability` becomes `data availability`.
- The `abstract` should be used as the `description` for og and meta tags. It should be capped at 250 chars for these purposes.
- The `abstract` should be rendered on the page as HTML.
- The `summary` should be rendered on the page as HTML. It containes markdown, so we will want to render the markdown into HTML.
- The `created_on` field should be rendered small at the bottom in an ISO-8601 format.
- The generated HTML should contain correctly embedded Microdata for a ScholarlyArticle `https://schema.org/ScholarlyArticle`
- We will create an RSS or Atom feed for the papers.
- Each paper page should appear in the sitemap.xml

### Objective 2

- We will create a paper categories index page using `categories.json`
- There should be a `/papers/categories` index page which lists all of the categories and links to individual category indexes, example: `/papers/categories/datastores`
- Each individual index page (ex: `/papers/categories/datastores`) should provide a list of links to the papers in that category.
- Paper pages will contain links to these index pages.
- Please embed any relevant microdata from `https://schema.org` in these indexes.
- These index pages should appear in sitemap.xml

### Objective 3

- Do the same as category indexes but with `keywords.json`.
- There should be a `/papers/keywords` index page and individual keyword indexes like `/papers/keywords/data-availability`
- Paper pages will contain links to these index pages.
- Please embed any relevant microdata from `https://schema.org` in these indexes.
- These index pages should appear in sitemap.xml

## Implementation

### Files Created

| File | Purpose |
|------|---------|
| `source/paper.html.erb` | Individual paper page template (ScholarlyArticle microdata) |
| `source/paper_categories.html.erb` | Single category page listing its papers |
| `source/paper_categories_index.html.erb` | `/papers/categories/` index listing all categories |
| `source/paper_keywords.html.erb` | Single keyword page listing its papers |
| `source/paper_keywords_index.html.erb` | `/papers/keywords/` index listing all keywords |
| `source/papers_feed.xml.builder` | Atom feed for papers (100 most recent) |

### Files Modified

| File | Changes |
|------|---------|
| `config.rb` | Added `require 'kramdown'`, `config_paper_slug` helper, `deslugify` helper, JSON loading, proxy generation for papers/categories/keywords, template ignores, feed page declaration. Papers with nil/empty titles are skipped. |
| `source/layouts/layout.erb` | Added `paper` local variable handling for title/description/OG tags, added papers Atom feed `<link>` tag |

### URL Structure

- `/papers/{slug}-{uuid[0..7]}/` - Individual paper pages (553 pages)
- `/papers/categories/` - Category index (66 categories)
- `/papers/categories/{category}/` - Papers in a category
- `/papers/keywords/` - Keyword index (2,944 keywords)
- `/papers/keywords/{keyword}/` - Papers with a keyword
- `/papers_feed.xml` - Atom feed

### Notes

- `category_path` in paper JSON is an array (e.g. `["languages", "haskell"]`) that gets joined with `/` to match the keys in `categories.json` (e.g. `languages/haskell`).
- The `deslugify` helper replaces both hyphens and underscores with spaces for human-readable display text (e.g. `api_design` becomes `api design`).
- Summaries contain markdown and are pre-rendered to HTML via Kramdown during proxy generation.
- One paper has a nil title (uuid `e9952d5f...`) and is skipped.
- All proxied pages are automatically included in `sitemap.xml` by `middleman-search_engine_sitemap`.
