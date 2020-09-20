---
layout: post
title: Debugging Matplotlib
date: 2017-04-26
---

I've had trouble with `matplotlib` while running a python script.

```
import matplotlib.pyplot as plt
...
...

plt.show()
```

This bit of code was supposed to show the graph of the image defined but when I ran the code, nothing happened. No errors, no program run. So, I searched on internet and found the solution to it as first including `PyQt5 and matplotlib` in the beginning and then `use('qt5agg')`
        