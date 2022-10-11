---
layout: default
title: "Changelog"
---
<h1>Changelog</h1>

<ul>
  {% for changelog in site.categories.changelog %}
    <li>
      <h2><a href="{{ changelog.url }}">{{ changelog.title }}</a></h2>
      {{ changelog.excerpt }}
    </li>
  {% endfor %}
</ul>
