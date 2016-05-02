---
layout: post
title: Ubuntu system program problem detected
date: 2016-04-30 01:42:30

---

I had been getting "System program problem detected" error messages with no further info after upgrading my ubuntu to 15.10
![system program problem detected]({{ site.url }}/assets/img/problem-detected.png)

It turns out that Ubuntu has an error reporting sytem called apport which tries to catch all program crashes in the background and report them to the developers.

Quick fixture: **Remove old crash-reports**
See all the old crash-reports in the crash-report directory

``` bash
ls /var/crash
```

Remove all old crash-reports that might exist in the crash-report directory:


``` bash
sudo rm /var/crash/*
```
