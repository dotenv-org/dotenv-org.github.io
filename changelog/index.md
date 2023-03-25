---
layout: page
title: "Changelog"
---

<h1 class="text-center h5 text-secondary font-monospace pb-0 mb-0 fw-normal">Changelog</h1>
<h3 class="text-center h1 fw-bold">What's new</h3>
<h5 class="text-center"><span class="fw-bold">dotenv-vault</span> is ever-improving.</h5>

<div class="row row-cols-1 g-4">
{% for changelog in site.categories.changelog %}
  <div class="col">
    <div class="card bg-light h-100">
      <div class="card-header">
        <a class="small text-secondary text-underline-hover" href="{{ changelog.url }}">
          {{ changelog.date | date: "%b %d, %Y" }}
        </a>
        <a class="small text-dark text-underline-hover" href="{{ changelog.url }}">
          <h2 class="h5 mb-0 fw-bold">{{ changelog.title }}</h2>
        </a>
      </div>
      <div class="card-body">
        {{ changelog.content }}
      </div>
    </div>
  </div>
{% endfor %}
</div>
