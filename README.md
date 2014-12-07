# Papers We Love

## IMPORTANT: Contributing to the site

If you're a chapter leader or volunteer and need to make edits to your chapter's page or add a post, please fork the repo and make Pull Requests against the **middleman** branch.

## How to work with the site

The site is static and generated with [Middleman](http://middlemanapp.com/). Middleman is a Ruby app, so you will need at least Ruby 1.9.3 installed, but preferably 2+. All of the dependencies are provided for you in the `Gemfile`.

### Installation instruction:

1. Install [Ruby](https://www.ruby-lang.org/en/)
2. Install [Bundler](http://bundler.io/) `$ gem install bundler`
3. Checkout this repo, switch to the **middleman** branch and `cd papers-we-love.github.io`
4. Install your dependencies `bundle install`
5. Fire up the dev server `$ bundle exec middleman server` and hit `http://0.0.0.0:4567/`

### Quickstart: CLI commands

We've added some CLI commands to Middleman to speed up generic tasks, such as adding a chapter to the site or creating meetup schedule posts.

#### Adding a chapter

Chapters are managed in `source/chapter.yml`, which is used to dynamically generate links on the site. Chapters can be quickly added with a CLI command:

```bash
$ middleman chapter NAME
```

`NAME` should be the lowercase name of the chapter

**Options:**

Option | Alias | Description
---------|---------|-----------------
title | -t | The title of the chapter _optional_
description | -d | The description of the chapter (for meta tags) _optional_
url | -u | The url of the chapter page _optional_

**Example:**

```bash
$ bundle exec middleman chapter washington-dc -t "Washington, DC" -u "/chapters/washington-dc"
```

Appends the following YAML to `chapter.yml`:

```yaml
- :name: washington-dc
  :title: Washington, DC
  :description: The Washington, DC chapter of Papers We Love
  :url: "/chapters/washington-dc"
```

_Note_: this will throw an error if the chapter already exists, bust open your editor to make changes to existing chapters.

#### Creating a monthly meetup schedule post

We like to create news posts each month listing the upcoming PWL meet ups. A started template for this post can be created with a CLI command:

```shell
$ bundle exec middleman gen meetups -t "Super cool meetups" -d 2014-12-01
```

Will generate a file named `2014-12-01-super-cool-meetups.html.markdown` in the `/source` directory that looks like so:

```html
---
title: Super cool meetups
date: 2014-12-01
author: Boatswain Miller
category: news
tags: meetup, chapters
label: Meetups
description: Papers We Love Meetup Schedule for 2014-12-01
---

We have another great line-up of meet-ups scheduled for DATE across a number of our chapters:

**CHAPTER MM/DD**: [TITLE](LINK)

---

<img class="left no-shadow" alt="SPONSOR NAME" style="width: 120px" src="/images/SPONSOR_IMG.png" />
The **CHAPTER** would like to give special thanks to [SPONSOR](SPONSOR_LINK) for sponsoring the ITEMS for the MONTH meetup.
```

You can then edit the text as needed to create a schedule of meetups for the month. The options for `gen` are:

Option | Alias | Description
---------|---------|-----------------
title | -t | The title of the scaffolded post
date | -d |The date of the scaffolded post (defaults to today's date if omitted)
author| -a | The author of the scaffolded post

```bash
$ bundle exec middleman gen meetups -t "Super cool meetups" -d 2014-12-01 -a "Zeeshan"
```

### In-depth: Middleman

The site leans heavily on Middleman's [Blogging](http://middlemanapp.com/basics/blogging/) plugin. Articles are written in [Markdown](http://daringfireball.net/projects/markdown/) and pulled into templates. Middleman comes with lots of [template helpers](http://middlemanapp.com/basics/helpers/) to help you create links and such. Check them out.

**Create a new post:** `$ bundle exec middleman article My Cool Article` - this will generate a file in `/source` like `2014-07-26-my-cool-article.html.markdown`. Open this in your text editor of choice.

**Frontmatter:** Like Jekyll, Middleman leans on [frontmatter](http://middlemanapp.com/basics/frontmatter/) at the top of the articles to provide data to the generator. We have some specific front matter setup for you to use.

Example:

	---
	title: A general announcement post
	date: 2014-07-26 22:23 UTC
	author: Ines
	category: news
	tags: meetup, sfo
	label: Conferences
	label_url: http://strangeloop.com
	presenter: Erik Hinton
	presenter_url: http://erikhinton.com
	description: The description that appeats in the meta-desc tag in the HTML
	---

Title, date and author are fairly explanatory. The date will be generated for you, as well as the title. Feel free to fine-tune the title.

**_category_** is specific - currently we have two types of posts, `news` and `meetup`. These determine what type of icon is placed in the _label_ field in the article metadata.

**_tags_** are tags as you know them. Keep them limited to a few key concepts about this post that would relate it to other posts.

**_label_** is the text that appears in the little rounded gray boxes underneath post titles, such as 'Meetup NYC'. The icon that appears next to this text is determined by the _category_ entry above.

**_label_url_** is a URL related to the label. For instance, this could link to the Meetup.com page for a specific meetup.

**_presenter_** this field only appears in **meetup** category posts. This is the name of the presenter for the meet up.

**_presenter_url_** this field only appears in **meetup** category posts. This is the URL to the presenter's homepage, article or other relevant link.

**_description_** is the information for the post that appears in the `meta` tag in the page header - used for Google search results. This should be kept to 150 characters and consist of a simple description of the post, perhaps with relevant dates.

### Publishing

Once you've written a post and read it a few times looking for typos and grammar issues, you can publish. Commit the changes to the **middleman** branch and push to the remote. To deploy the changes to the live site simply `$ bundle exec middleman deploy` - if you have commit rights the site will build and the static files will get pushed into **master**.

**If you don't have commit rights, then you need to submit your changes as a Pull Request to the repo for review by the maintainers.**
