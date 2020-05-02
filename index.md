---
layout: about
---

I write about [Ruby](https://www.ruby-lang.org/en/), [Elixir](https://elixir-lang.org/), some [JS](https://en.wikipedia.org/wiki/JavaScript) and other Tech Stuffs whenever I feel like writing. 
I intend to write some blogs once in a while.

### Here are some of my posts till date 

{% for post in site.posts limit: 5 %}
  * {{ post.date | date: '%Y %b %d'}} >> [{{ post.title }}]({{ post.url }})
{% endfor %}


<!--
<p>
	I intend to post somethings once in a while
</p>

<body>


	<div class="wrapper wrapper_padding clearfix">
		<div class="col-1 about homepage_content">
			<h2>About</h2>
		</div>
		<div class="col-2 homepage_content">
			<h2>Stuffs I've Written</h2>
			<hr>

			{% for post in site.posts %}
			<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
			<p class="date">{{ post.date | date: '%Y %b %d'}}</p>
			{% endfor %}

		</div>
		<div class="col-3 homepage_content">
			<h2>Contributions</h2>
			<hr>

			{% for item in site.data.contribution %}
				<h3>{{ item.title}} of {{ item.event}} at {{ item.location }}</h3>
			{% endfor%}

		</div>

	</div> -->
