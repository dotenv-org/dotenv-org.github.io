---
layout: default
title: "Pricing"
---

<div class="container">
  <div class="row text-center mb-3">
    <div class="col">
      <h1 class="display-1 fw-bold mt-5 lh-1">Invest in Your Security</h1>
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <p class="h2 fw-light mt-1">Free to use for individuals and small teams.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="row g-3">
    <div class="col-md-12 col-lg-4">
      {% include pricing/free.html %}
    </div>
    <div class="col-md-12 col-lg-4">
      {% include pricing/team.html %}
    </div>
    <div class="col-md-12 col-lg-4">
      {% include pricing/enterprise.html %}
    </div>
  </div>
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      {% include pricing/whats_free.html %}
    </div>
  </div>
  <div class="row">
    <div class="col-lg-8 offset-lg-2">
      <h2 class="text-center h1 fw-extrabold mt-5">Let dotenv-vault take your headache away</h2>
      <p class="lead fw-normal text-center">The average cost of a secrets leak is <span class="fw-bold text-danger">$1.2 million dollars</span>. You need a secrets manager that simplifies your secrets and prevents them from being scattered across multiple third-parties.</p>
    </div>
  </div>

</div>

{% include landing/companies_love.html %}
{% include landing/developers_love.html %}
{% include landing/source_of_truth.html %}

<div class="row">
  <div class="col">
    <h4 class="fw-bold text-center py-4 mt-4">
      Use for FREE, forever.&nbsp;&nbsp;&nbsp;<a class="btn btn-dark rounded-5 fw-bold px-3" href="/signup">Sign Up Free</a>
    </h4>
  </div>
</div>

