# Generate Sitemap and RSS feeds

## Description

Go into planning mode. We want to setup a dynamic, generated sitemap.xml file `https://www.sitemaps.org/protocol.html` for the site. We should be able to use the Middleman Sitemap `https://middlemanapp.com/advanced/sitemap/` to do this. I would also like to generate RSS feeds for the generated video pages. Lets plan this together. Ask me lots of clarifying questions and double-check all of the steps in your plan. When we're ready to start working you can come out of planning mode.


After we get the plan together keep a progress report in this document (todos) as well as a changelog of all the work we do.

---

## Status: COMPLETE

## Progress Report

- [x] Add `middleman-search_engine_sitemap` gem to Gemfile
- [x] Configure sitemap in config.rb with url_root
- [x] Create videos.xml.builder for Atom feed
- [x] Build and verify output

## Changelog

### 2026-01-25

**Added Video Feed link to footer**

- `source/partials/_footer.erb` - Added "Video Feed" link to footer navigation pointing to `/videos.xml`

**Added sitemap.xml and videos.xml feed generation**

Files modified:
- `Gemfile` - Added `middleman-search_engine_sitemap ~> 1.4` gem
- `config.rb` - Added sitemap activation with `url_root: 'http://paperswelove.org'`, default priority 0.5, monthly change frequency; added `page "/videos.xml", layout: false`
- `source/videos.xml.builder` (NEW) - Atom 1.0 feed with Media RSS namespace for 50 most recent videos

Build results:
- `sitemap.xml`: 162KB, 781 URLs (blog posts, videos, chapters, video tags)
- `videos.xml`: 132KB, 50 video entries with thumbnails and YouTube links

Features:
- Sitemap automatically discovers all pages including dynamically proxied pages (videos, chapters, tags)
- Video feed sorted by published_at date, most recent first
- Video feed includes Media RSS thumbnails, YouTube links, and full descriptions
- Existing blog feed at `/feed.xml` unchanged
