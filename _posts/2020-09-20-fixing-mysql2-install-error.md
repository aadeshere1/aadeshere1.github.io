---
layout: post
title: Fixing mysql2 install error
date: 2020-09-20
---

Recently I was working on a new project and decided to use mysql instead of postgresql with Ruby on Rails. As usual, I started my project with `rails new . --database=mysql`. Everything was fine until I got stuck while installing the `mysql2` gem. 

Error log is as shown here.

```bash
checking for rb_absint_size()... yes
checking for rb_absint_singlebit_p()... yes
checking for ruby/thread.h... yes
checking for rb_thread_call_without_gvl() in ruby/thread.h... yes
checking for rb_thread_blocking_region()... no
checking for rb_wait_for_single_fd()... yes
checking for rb_hash_dup()... yes
checking for rb_intern3()... yes
checking for rb_big_cmp()... yes
-----
Using mysql_config at /usr/local/bin/mysql_config
-----
checking for mysql.h... yes
checking for errmsg.h... yes
checking for SSL_MODE_DISABLED in mysql.h... yes
checking for SSL_MODE_PREFERRED in mysql.h... yes
checking for SSL_MODE_REQUIRED in mysql.h... yes
checking for SSL_MODE_VERIFY_CA in mysql.h... yes
checking for SSL_MODE_VERIFY_IDENTITY in mysql.h... yes
checking for MYSQL.net.vio in mysql.h... yes
checking for MYSQL.net.pvio in mysql.h... no
checking for MYSQL_ENABLE_CLEARTEXT_PLUGIN in mysql.h... yes
-----
Don't know how to set rpath on your system, if MySQL libraries are not in path mysql2 may not load
-----
-----
Setting libpath to /usr/local/Cellar/mysql@5.7/5.7.29/lib
-----
creating Makefile

current directory: /Users/namespace/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/mysql2-0.5.3/ext/mysql2
make "DESTDIR=" clean

current directory: /Users/namespace/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/mysql2-0.5.3/ext/mysql2
make "DESTDIR="
compiling client.c
compiling infile.c
compiling mysql2_ext.c
compiling result.c
result.c:326:40: warning: incompatible pointer types assigning to 'my_bool *' (aka 'char *') from 'bool *' [-Wincompatible-pointer-types]
    wrapper->result_buffers[i].is_null = &wrapper->is_null[i];
                                       ^ ~~~~~~~~~~~~~~~~~~~~
result.c:328:40: warning: incompatible pointer types assigning to 'my_bool *' (aka 'char *') from 'bool *' [-Wincompatible-pointer-types]
    wrapper->result_buffers[i].error   = &wrapper->error[i];
                                       ^ ~~~~~~~~~~~~~~~~~~
2 warnings generated.
compiling statement.c
linking shared-object mysql2/mysql2.bundle
ld: library not found for -lssl
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [mysql2.bundle] Error 1

make failed, exit code 2

Gem files will remain installed in /Users/namespace/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/mysql2-0.5.3 for inspection.
Results logged to /Users/namespace/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mysql2-0.5.3/gem_make.out

An error occurred while installing mysql2 (0.5.3), and Bundler cannot continue.
Make sure that `gem install mysql2 -v '0.5.3' --source 'https://rubygems.org/'` succeeds before bundling.
```

As suggested by the error, I tried `gem install mysql2 -v '0.5.3'`. But this didn't fix the error for me. After going through few stackoverflow questions, I found a solution for mac. 

It turns out the error had something to do with `openssl`. So finally this command fixed the error. 

`gem install mysql2 -v '0.5.3' -- --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include`
        