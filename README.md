# Kumojin Blog

This website is using [Jekyll](https://jekyllrb.com) and the [minima](https://github.com/jekyll/minima) theme.

## Writing a post

Add a file to the `_posts` directory with the following format

```
YEAR-MONTH-DAY-title.md
```
Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit numbers.

All blog post files must begin with [front matter](https://jekyllrb.com/docs/front-matter/). For example the minimal example is:

```
---
layout: post
title:  "My awesome blog post"
---

# Post title

Post content
```

For more information see "[Post](https://jekyllrb.com/docs/posts/)" in the Jekyll documentation.

## Running locally

### Prerequisites

You must install Bundler to install and run Jekyll locally:

1. Install Ruby. For more information, see "[Installing Ruby](https://www.ruby-lang.org/en/documentation/installation/)" in the Ruby documentation.
2. Install Bundler. For more information, see "[Bundler](https://bundler.io/)."

### Serve the site

1. Run `bundle config set --local path 'vendor/bundle'` to configure Bundler to install gems in the `./vendor/bundle/` project subdirectory. **This step is required only once**.
2. Run `bundle install` to install the dependencies.
3. Then you can serve the website with `bundle exec jekyll serve` and visit it at [http://127.0.0.1:4000/](http://127.0.0.1:4000/).

To see your modifications you just need refresh the page. However, if you modify the `_config.yml` file you will need to stop the process and serve the website again.
