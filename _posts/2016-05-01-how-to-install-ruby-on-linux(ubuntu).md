---
layout: post
title: How to install Ruby on Linux
---

We will be setting up Ruby development environment on Ubuntu 16.04.

Since Ubuntu is one of the easiest linux distribution and is used by many people, we will start with it.

### Installing Ruby
Step 1: Install dependencies for Ruby

{% highlight bash%}
sudo apt update
sudo apt install git-core curl zlib1g-dev build-essential
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3
libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
libffi-dev
{% endhighlight %}

We will use ```rbenv``` for setting up the environment. For this we will have to setup rbenv first.

``` bash
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.3.0
rbenv global 2.3.0
ruby -v
```

Then we need to install the bundler which is basically a ruby gem.

```bash
gem install bundler
```

```bash
rbenv rehash
```

Now, run ```which ruby``` in the terminal to check whether ruby has been installed or not. If ruby is successfully installed then, ```/home/{username}/.rbenv/shims/ruby``` will be returned.
