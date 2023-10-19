---
layout: blog
title: "Blog"
---

{% for post in site.categories.blog %}
  {% assign currentdate = post.date | date: "%Y" %}
  {% if currentdate != date %}
    {% unless forloop.first %}</ul>{% endunless %}
<h3 id="y{{post.date | date: "%Y"}}">{{ currentdate }}</h3>
<ul class="entrylist">
    {% assign date = currentdate %}
  {% endif %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a> — {{ post.date | date: "%B %-d" }}
    </li>
  {% if forloop.last %}</ul>{% endif %}
{% endfor %}
