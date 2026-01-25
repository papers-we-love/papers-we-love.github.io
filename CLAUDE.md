# CLAUDE.md - Papers We Love Website

## Project Overview

This is the website for [Papers We Love](http://paperswelove.org/), a community dedicated to reading and discussing computer science papers. The site showcases meetup chapters worldwide, blog posts about paper presentations, and conference information.

**Live site:** http://paperswelove.org/
**Hosted on:** GitHub Pages (static files in `main` branch)
**Source branch:** `middleman` (development happens here)

## Technology Stack

- **Static Site Generator:** [Middleman](http://middlemanapp.com/) v4.6.x
- **Ruby Version:** 3.3 (via Docker)
- **CSS:** Vanilla CSS (migrated from SASS/Bourbon/Neat)
- **Templating:** ERB templates with Markdown content
- **Blog Plugin:** middleman-blog 4.x
- **Deployment:** Manual git push to `main` branch (via GitHub Actions or `make docker-deploy`)

## Project Docs

We will store specific plans for features and maintenance in `project-docs`. This is also where we will store a `CHANGELOG.md` going forward with a summary of all of working sessions.

## Project Structure

```
├── config.rb              # Middleman configuration
├── Gemfile / Gemfile.lock # Ruby dependencies
├── Makefile               # Build shortcuts
├── Rakefile               # Rake tasks for build/deploy
├── data/                  # JSON data for chapters (from Meetup.com API)
│   ├── chapters.json      # Chapter configuration with data adapters
│   ├── ogp/               # OpenGraph metadata (fb.yml, og.yml)
│   └── [city].json        # Event data per chapter
├── lib/                   # Custom Middleman extensions
│   ├── build_cleaner.rb   # Clears build dir before deploys
│   ├── event-handler.rb   # Meetup event parsing helpers
│   └── templates/         # Article templates
├── source/                # Website source files
│   ├── layouts/           # ERB layouts (layout.erb, article.erb)
│   ├── partials/          # Reusable template partials
│   ├── stylesheets/       # CSS files (screen.css, font-awesome.min.css)
│   ├── javascripts/       # JS files
│   ├── images/            # Static images
│   ├── chapters.yml       # Chapter list with meetup URLs
│   ├── *.html.erb         # Page templates
│   └── *.html.markdown    # Blog posts (dated articles)
└── tasks/                 # Thor tasks for CLI commands
    ├── update_task.rb     # Fetch data from Meetup.com
    ├── upcoming_task.rb   # Generate upcoming meetups post
    └── chapter_task.rb    # Chapter management
```

## Development Commands

Run `make help` to see all available commands.

### Quick Start
```bash
# Install dependencies
make deps
# or: bundle install

# Run development server (http://localhost:4567)
make serve
# or: bundle exec middleman server
```

### Build & Deploy
```bash
# Build static site to /build directory
make build
# or: bundle exec middleman build
# or: rake build

# Deploy to GitHub Pages (builds first, pushes to main branch)
bundle exec middleman deploy
# or: rake deploy
```

### Data Updates
```bash
# Update Meetup.com API data (requires CUTTLEFISH_PATH env var)
rake update

# Generate upcoming meetups post for current month
rake upcoming

# Full refresh: pull, update data, generate upcoming, deploy
rake refresh
```

### Docker (recommended)
```bash
# Build the Docker image
make docker-build

# Run development server (http://localhost:4567)
make docker-serve

# Build static site in container
make docker-site-build

# Deploy to GitHub Pages (requires deploy key setup)
make docker-deploy

# Open a shell in the container
make docker-shell

# Follow container logs
make docker-logs

# Rebuild without cache (after Gemfile changes)
make docker-build-no-cache

# Clean up Docker resources
make docker-clean
```

### Deploy Key Setup (for Docker deploy)
The Docker deploy requires a dedicated SSH deploy key:

1. Generate a deploy key (if not already done):
   ```bash
   ssh-keygen -t ed25519 -C "papers-we-love-deploy" -f ~/.ssh/pwl_deploy -N ""
   ```

2. Add the public key to GitHub:
   - Go to: `github.com/papers-we-love/papers-we-love.github.io/settings/keys`
   - Click "Add deploy key"
   - Paste contents of `~/.ssh/pwl_deploy.pub`
   - Enable "Allow write access"
   - Save

3. The Docker deploy service mounts `~/.ssh/pwl_deploy` automatically

## Key Configuration

### config.rb Highlights
- Blog with pagination (10 per page)
- URL structure: `/{year}/{category}/{title}.html`
- Chapter pages dynamically generated from `data/chapters.json`
- Directory indexes enabled (clean URLs)
- CSS minification in production
- Git deployment to `main` branch

### Blog Post Frontmatter
```yaml
---
title: Post Title
date: 2024-01-15 22:23 UTC
author: Author Name
category: news | meetup
tags: topic1, topic2
label: Label Text
label_url: http://example.com
presenter: Speaker Name        # for meetup posts
presenter_url: http://...      # for meetup posts
description: SEO description (150 chars)
---
```

## Data Architecture

### Chapter Data Sources
Configured in `data/chapters.json` with adapters:
- **meetup** - Meetup.com API (most chapters)
- **eventbrite** - Eventbrite API (e.g., Milano)
- **facebook** - Facebook events (e.g., Kathmandu, Singapore)

### External Tool: Cuttlefish
Data fetching is handled by [Cuttlefish](https://github.com/DarrenN/cuttlefish), a Racket application. Set `CUTTLEFISH_PATH` environment variable to use `rake update`.

## Automated Deployments

The site is automatically built and deployed daily via GitHub Actions.

### Schedule
- **When:** Daily at midnight EST (5:00 UTC)
- **What:** Pulls latest `middleman` branch, builds, deploys to `main`
- **Workflow:** `.github/workflows/scheduled-deploy.yml`

### Manual Trigger
You can also trigger a deploy manually:
1. Go to: `github.com/papers-we-love/papers-we-love.github.io/actions`
2. Select "Scheduled Deploy" workflow
3. Click "Run workflow"

### Setup (one-time)
Add the deploy key as a GitHub secret:
1. Copy the private key: `cat ~/.ssh/pwl_deploy`
2. Go to: `github.com/papers-we-love/papers-we-love.github.io/settings/secrets/actions`
3. Click "New repository secret"
4. Name: `DEPLOY_KEY`
5. Value: Paste the entire private key (including BEGIN/END lines)
6. Save

## Important Notes

- **Branch workflow:** Edit on `middleman` branch, deploy pushes static files to `main`
- **Docker:** Uses Ruby 3.3-slim image with Bundler 2.5.x (recommended for development)
- **Build artifacts:** `/build` directory is gitignored and recreated each build
- **Chapter pages:** Dynamically proxied from `chapter.html.erb` template using data files
- **Make commands:** Run `make help` to see all available commands
