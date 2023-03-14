---
layout: default
title: "Blog"
---

<div class="container py-lg-5 py-3 px-lg-5">
  <div class="row py-3 py-lg-5">
    <div class="col col-lg-9">
      <h1 class="display-3 fw-bold mt-5">Dotenv Blog</h1>
      <h4 class="fw-normal mt-3">Simplify your secrets.</h4>
    {% for post in site.categories.blog %}
      <p class="mt-3">
        <a class="text-underline-hover" href="{{ post.url }}">
          <span class="text-body-tertiary">{{ post.date | date: "%b %d, %Y" }} –</span> {{ post.title }}
        </a>
        <!--{{ post.excerpt }}-->
      </p>
    {% endfor %}
      <br/>
    </div>
  </div>
</div>
