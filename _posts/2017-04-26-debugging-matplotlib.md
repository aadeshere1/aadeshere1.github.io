---
layout: post
title: Debugging Matplotlib
date: 2017-04-26 01:42:30
category: python
---

I've had trouble with `matplotlib` while running a python script.

```
import matplotlib.pyplot as plt
...
...

plt.show()
```

{% highlight ruby %}
# We give it the key and we get the value
people["Jake"]
=> 30

# We can assign the value of the key to something else
people["Jake"] = 100

# Now the value is 100 (it used to be 30)
people["Jake"]
=> 100
{% endhighlight %}

This bit of code was supposed to show the graph of the image defined but when I ran the code, nothing happened. No errors, no program run. So, I searched on internet and found the solution to it as first including `PyQt5 and matplotlib` in the beginning and then `use('qt5agg')`
