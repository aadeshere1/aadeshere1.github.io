---
layout: post
title: Renaming tmux window
date: 2021-05-18
---

When you create a new window `prefix + c` in tmux, it will be named after default shell you are using. When you run a specific script or program, the name will change to the program that's being executed but once the process is completed, it will go back to default shell name. To keep track of each window session, you should make a habit of renaming the window. 

The command line instruction for renaming window is 

```
tmux rename-window new_name
```

and the shortcut for renaming window is 

```
prefix + , new_name
```
        