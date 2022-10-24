---
layout: default
title: "Changelog"
---

---

<h1 class="mt-1 text-center h4">Changelog</h1>
<p class="w-100 text-center">See what's new!</p>

{% for changelog in site.categories.changelog %}
<article markdown="1" class="mt-1 mb-2">
  <p class="text-secondary mb-0">
    <a href="{{ changelog.url }}">
      {{ changelog.date | date: "%b %d, %Y" }}
    </a>
  </p>

  <h2 class="h4 mt-05">
    {{ changelog.title }}
  </h2>

  {{ changelog.content }}
</article>
{% endfor %}

---
