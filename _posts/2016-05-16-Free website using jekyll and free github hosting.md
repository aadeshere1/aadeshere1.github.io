---


---
title: Free website using jekyll and free github hosting
date: 2016-05-16
categories: github

In this lesson, we will learn how to get started with building a website with Jekyll, which is just a gem of Ruby. In other words, Jekyll is a simple static-site generator built in Ruby. It is a tool which lets you have all the cool features of a full-blown CMS without having to worry about managing a database.The benefit of using Jekyll is that hosting is extremely easy and scalable. You will be just managing bunch of files (in our case, we will be using github gh-pages).

## System Requirements
- [Ruby]({% post_url 2016-05-01-how-to-install-ruby-on-linux(ubuntu) %})
- [Jekyll]({% post_url 2016-05-15-How to install jekyll %})

## What will we be building
We will be building a clone of [this](http://www.aadeshshrestha.me) site.

## What we won't be doing
We will not be styling the site.

## Structure of site
![Site layout]({{ site.url }}/assests/img/jekyllblog/site_layout.png)

Before we dive into coding, I recommend you to checkout the awesome [Jekyll documentation](https://jekyllrb.com/docs/quickstart/).

If you went through Jekyll documentation you will notice that to create a new project jekyll provides us a command

``` bash
jekyll new ProjectName
```

However, we will not be using this automatic project generation command. We will be setting up all of our files and folders ourself.

### Lets get started
First thing first, lets create a project destination, mygithubpage, and inside it create a configuration file.

``` bash
$ mkdir mygithubpage
$ cd mygithubpage
$ touch _config.yml
```
Add following lines in the `_config.yml` .

``` yml
#my variables
name: Jekyll website
description: Free website using jekyll and free github hosting

#css settings
sass:
  style: :compressed
  sass_dir: _sass
```

Here `name` is the name of your website and `description` is the description of your website. You can go to [sass-lang.com](sass-lang.com/documentation/file.SASS_REFERENCE.html) if you want to learn more about sass.

Lets create a directory `_data` in which we will store the data files needed for our site.

``` bash
$ mkdir _data
$ cd _data
$ touch navigation.yml
```
For now we will just add our navigation links. We are setting the link name and url.

``` yml
- title: home
  url: /

- title: about
  url: /me

- title: articles
  url: /articles

- title: projects
  url: /projects
```

Now create a folder `_includes` in which we will store our header and footer. So, create two html files named `header.html` and `footer.html`

``` html
{% raw %}
<header>
  <a href="#">MyGithubPage</a>
  <nav>
    {% for item in site.data.navigation  %}
      <a href="{{ item.url }}">{{ item.title }}</a>
    {% endfor %}

  </nav>
</header>
{% endraw %}
```

As mentioned before, I will not be focusing much on styling in this tutorial. However I will make all the source code available in github.
Basically what we are doing here is that we are looping through each of our navigation links that we stored in our `navigation.yml` and displaying them as links. I believe you can make your own footer page. If you want to follow along the tutorial put the following code in `footer.html`

``` html
<footer id="main_footer">
  <p> Proudly powered by <a href="https://www.jekyllrb.com/">Jekyll</a> and <a href="https://www.github.com">Github</a> &copy; 2016 Your Name</p>
  <nav>
    <a href="https://www.facebook.com/#"><i class="fa fa-facebook"></i></a>
    <a href="https://twitter.com/#"><i class="fa fa-twitter"></i></a>
    <a href="https://github.com/#"><i class="fa fa-github"></i></a>
  </nav>
</footer>
```

Let's move on to creating layouts for our page and posts. Create a `_layouts` folder and make a new html file called `default.html` . This will be the main layout that our pages and posts will use.

```html
{% raw %}
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

    {% if page.title %}
      <title>{{ page.title }}</title>
    {% else %}
      <title>{{ site.name }}</title>
    {% endif %}

    <meta name="description" content="{{ site.description }}">

    <link rel="stylesheet" type="text/css" href="/assests/css/applications.css">
  </head>
  <body>
    {% include header.html %}

      {{ content }}

    {% include footer.html %}
  </body>
</html>
{% endraw %}
```

In the head section, by using `if page.title` we are checking if the page has title or not. If the title exists then display the title. If it doesn't exist we display the name of site which we defined in our `_config.yml` file. `include header.html` and `include footer.html` will be replaced by the content of our `header.html` and `footer.html` respectively. {% raw %} ` {{ content }}` will be replaced by the content of other pages that we will create.

So, this `default.html` is the main layout for our site.
