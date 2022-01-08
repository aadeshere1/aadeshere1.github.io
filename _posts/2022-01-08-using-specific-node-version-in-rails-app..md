---
layout: post
title: Using specific node version in rails app.
date: 2022-01-08
---

When using node in a rails app, make sure to add node version information in package.json in "engines" section. Heroku will read the information in package.json to use the heroku build app. If node version is not added in package.json, heroku will use the default node stack, usually latest. Some legacy package may break with new node. 


```
...
"engines": {
    "node": "12.19.0"
  },
...
```
        