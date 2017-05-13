# Papers We Love

## :warning: The site is currently undergoing lots of change.

We're migrating to a [better data model](https://github.com/DarrenN/cuttlefish) for meetup information and also working to automate publishing of videos and other bits of information. If you're interested in writing an adapter for your chapter meetups or helping with some of these tasks [join the Papers We Love Slack](http://papersweloveslack.herokuapp.com/) and send `d_run` a message.

## IMPORTANT: Contributing to the site

We pull in most of the chapter data from the Meetup.com API with an automated process. Make sure the title of your meetup reflects the speakers name and the title of the paper. For example: "John Myles White on Fundamental Concepts in Programming Languages" or "Lindsey Kuper on Ribbon Proofs for Separation Logic". Please don't add artifacts like "PWL #13 =>" to the title, as we have to strip these out with ad-hoc regexes.

**If you don't see your meetup on a monthly listing, let us know!**

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

We've added some CLI commands to Middleman to speed up generic tasks, such as adding a chapter to the site or creating meetup schedule posts. Checkout the `Rakefile`.

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
