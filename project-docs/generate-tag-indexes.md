# Generate Tag Indexes

## Phase 1: Generate an index page for tags (done)

Generate an index page of all the video tags at `/videos/tags`. Each entry should link to the appropriate tag page, example `/videos/tags/science`. This should be generated on every publish.

### Changes
- Created `source/video_tag_index.html.erb` template that lists all video tags alphabetically with video counts
- Added proxy in `config.rb` to generate `/videos/tags/index.html`, passing `videos_by_tag` data to the template

## Phase 2: Links broken on videos page (done)

On the `/videos` index page, the Browse By Category and Browse By Tag links got to the wrong url. Please correct.

### Changes
- Fixed "By Tag" link in `source/video_index.html.erb` from `/tags/video/` to `/videos/tags/`
- Removed "By Category" link — `/categories/video/` does not exist (only `news` and `topic` categories exist)
