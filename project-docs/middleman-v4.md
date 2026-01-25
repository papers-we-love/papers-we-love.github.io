# Upgrade Middleman to Version 4

## Description

The Papers We Love site uses Middleman `https://middlemanapp.com/` as its static site generator. We need to upgrade to Middleman Version 4 `https://middlemanapp.com/basics/upgrade-v4/` and also upgrade to a more recent version of Ruby. We will take a step by step approach, planning out each step in detail before proceeding. You will ask me many clarifying questions to develop each step. You will double-check your assumptions and work at each step in the plan. After completing each step you will prompt me to test the site with the dev server to see how it's working.

## Target State

| Component | Current | Target |
|-----------|---------|--------|
| Middleman | 3.4.1 | 4.5.1 |
| Ruby | 2.7 | 3.3 |
| Bundler | 1.17.3 | 2.x |
| middleman-blog | 3.5.3 | 4.x |
| middleman-deploy | 1.0.0 | **Remove** (use manual git deploy) |
| Compass | 1.0.3 | **Remove** (deprecated) |
| Sass | 3.4.25 (Ruby Sass) | sassc or dart-sass |
| Bourbon/Neat | 4.3.4 / 1.9.0 | **Gems removed** (vendored locally in `source/stylesheets/`) |

## Key Breaking Changes to Address

1. **Compass removed** - Middleman 4 no longer bundles Compass
2. **`activate :automatic_image_sizes`** - Removed in v4
3. **Extension API changes** - `build_cleaner.rb` needs update
4. **Asset pipeline** - Sprockets now optional external extension
5. **middleman-deploy** - Abandoned gem, removing in favor of manual deploy

---

## Phase 1: Update Ruby Environment (Dockerfile)

**Goal:** Get Ruby 3.3 and modern Bundler working

**Changes:**
- [ ] Update `Dockerfile` base image from `ruby:2.7-slim` to `ruby:3.3-slim`
- [ ] Update bundler from 1.17.3 to 2.5.x
- [ ] Keep all other Dockerfile configuration

**Test:** `make docker-build` should succeed

---

## Phase 2: Update Gemfile

**Goal:** Update all gem dependencies for Middleman 4.5.1 + Ruby 3.3

**Changes:**
- [ ] `middleman` → `~> 4.5`
- [ ] `middleman-blog` → `~> 4.0`
- [ ] Remove `middleman-deploy` (abandoned)
- [ ] `middleman-livereload` → `~> 3.4` (v4 compatible)
- [ ] Remove `middleman-ogp` (abandoned, will use manual meta tags)
- [ ] Remove explicit `sass` gem, add `sassc`
- [ ] Update `nokogiri` to `~> 1.16` (remove old constraint)
- [ ] Update `sanitize` to `~> 6.0` (remove old constraint)
- [ ] Keep `bourbon` 4.3.4 and `neat` ~> 1.9.0 (still work with sassc)
- [ ] Remove `builder` if not needed (check feed.xml.builder)

**Test:** `bundle install` should succeed in Docker

---

## Phase 3: Update config.rb

**Goal:** Fix deprecated/removed configuration

**Changes:**
- [ ] Remove `activate :automatic_image_sizes` (removed in v4)
- [ ] Remove `activate :deploy` block (using manual deploy)
- [ ] Remove `activate :ogp` block (replacing with manual meta tags)
- [ ] Check `activate :blog` syntax (should be compatible)
- [ ] Check `proxy` syntax for chapter pages
- [ ] Verify `ready do` block syntax

**Test:** `make docker-serve` should start without errors

---

## Phase 4: Update Extension (build_cleaner.rb)

**Goal:** Update custom extension for Middleman 4 API

**Current code:**
```ruby
class BuildCleaner < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
    FileUtils.rm_rf app.config[:build_dir]
  end
end

::Middleman::Extensions.register(:build_cleaner, BuildCleaner)
```

**Changes needed:**
- [ ] In v4, extensions should use `option` declarations
- [ ] Registration syntax may need adjustment
- [ ] Hook into `before_build` instead of constructor

**Test:** `make docker-site-build` should clean and build successfully

---

## Phase 5: Template Compatibility

**Goal:** Fix any template issues

**Potential issues:**
- [ ] Check all ERB templates for deprecated helpers
- [ ] Verify partials work correctly
- [ ] Add manual OGP meta tags to layout (replacing middleman-ogp)
- [ ] Test blog pagination
- [ ] Test chapter proxy pages
- [ ] Test category pages

**Test:** Full site build, manual inspection of key pages

---

## Phase 6: Final Verification

**Goal:** Ensure site works identically to before

**Checklist:**
- [ ] Homepage renders correctly
- [ ] Blog posts render correctly
- [ ] Blog pagination works
- [ ] Chapter pages render correctly
- [ ] Chapter index works
- [ ] Categories work
- [ ] RSS feed generates
- [ ] CSS compiles without errors
- [ ] No broken links/images

---

## Notes

### Vendored SASS Libraries
Bourbon and Neat are **vendored locally** in the project (not loaded from gems):
- `source/stylesheets/bourbon/` - Bourbon 4.x SCSS source files
- `source/stylesheets/neat/` - Neat 1.x SCSS source files

This means the stylesheet compilation doesn't depend on the gems. The gems were removed from the Gemfile since they were redundant and had incompatible dependencies with each other.

---

## Progress Log

### 2026-01-25: Phases 1-4 Complete

**Phase 1 (Ruby Environment):** ✅
- Dockerfile updated to Ruby 3.3-slim
- Bundler updated to 2.5.6

**Phase 2 (Gemfile):** ✅
- Middleman 4.5.x
- middleman-blog 4.x
- Removed: middleman-deploy, middleman-ogp, bourbon gem, neat gem
- Added: sassc
- Updated: nokogiri, sanitize

**Phase 3 (config.rb):** ✅
- Removed `activate :automatic_image_sizes`
- Removed `activate :ogp` block
- Removed `activate :deploy` block
- Fixed YAML.load_file for Ruby 3.x

**Phase 4 (build_cleaner.rb):** ✅
- Updated to Middleman 4 extension API (before_build hook)

**Phase 5 (Templates):** ✅
- Added manual OGP meta tags to layout.erb (replaced middleman-ogp)
- Fixed SCSS imports to use relative paths (`bourbon/bourbon`, `neat/neat`)
- Renamed `screen.scss` → `screen.css.scss` for Middleman 4
- Fixed `category.html.erb` to use helper method instead of instance variable
- Fixed chapter proxy paths for directory_indexes compatibility

**Config changes for Middleman 4:**
- Proxy pages need explicit `/index.html` suffix for directory_indexes
- Instance variables from config.rb don't transfer to templates - use helpers instead
- SCSS imports need explicit relative paths

**Docker build:** ✅ Success
**Dev server:** ✅ Working

**Known issue:** Warnings about data keys conflicting with built-in methods (e.g., `count` from Meetup API). These are harmless - data is still accessible via hash syntax `data[key]`.
