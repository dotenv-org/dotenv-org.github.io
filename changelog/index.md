---
layout: default
title: "Changelog"
---

<div class="row">
  <div class="col-lg-10 offset-lg-1">
    <h1 class="text-center h5 text-secondary font-monospace mt-5 pb-0 mb-0 fw-normal">Changelog</h1>
    <h3 class="text-center h1 fw-bold">What's new</h3>
    <h5 class="text-center">Dotenv improves every month – or faster.</h5>
  </div>
</div>

{% for changelog in site.categories.changelog %}
  <div class="row mb-5 changelog-item">
    <div class="col col-lg-8 offset-lg-2 bg-warning p-lg-4" style="--bs-bg-opacity: 0.1;">
      <p>
        <a class="text-secondary text-underline-hover" href="{{ changelog.url }}">
          {{ changelog.date | date: "%b %d, %Y" }}
        </a>
      </p>
      <h2 class="h4 fw-bold">
        {{ changelog.title }}
      </h2>
      {{ changelog.content }}
    </div>
  </div>
{% endfor %}
