---
layout: default2
title: "Sync .env files"
---

{% include helpers/home_hero.html %}

<article>
<div class="container-fluid pt-5 pb-5" style="background: #fcfcfc;">
<div class="container pt-5 mb-5">
  <div class="row">
    <div class="col">
      <h2 class="h1 text-black">How it works</h2>
      <p class="d-block mb-4 pb-3 text-secondary">in 3 easy steps</p>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-4">
      <p class="rounded-circle font-weight-normal d-inline-block px-3 py-2 bg-dark text-white mt-3 text-monospace">1</p>
      <h3 class="mb-3">Works with a single command</h3>
      <p>You don't need to install anything. No error prone binaries to install, infrastructure to maintain, or custom code to write. It just works – with a single command.</p>
      <p class="font-monospace text-success fw-bold">$ npx dotenv-vault push</p>
      <p><a href="/docs/tutorials/sync">Syncing .env files »</a></p>
    </div>
    <div class="col-lg-4">
      <p class="rounded-circle font-weight-normal d-inline-block px-3 py-2 bg-dark text-white mt-3 text-monospace">2</p>
      <h3 class="mb-3">Manage multiple environments</h3>
      <p>After you've pushed your .env file, you can manage your secrets across multiple environments. Open an environment to view and edit its environment variables.</p>
      <p class="font-monospace text-success fw-bold">$ npx dotenv-vault open production</p>
      <p><a href="/docs/tutorials/environments">Managing Environments »</a></p>
    </div>
    <div class="col-lg-4">
      <p class="rounded-circle font-weight-normal d-inline-block px-3 py-2 bg-dark text-white mt-3 text-monospace">3</p>
      <h3 class="mb-3">Deploy to production</h3>
      <p>Ready to deploy your secrets to production? Run the build command to generate your encrypted <strong>.env.vault</strong> file, commit that safely to code, and deploy. There's nothing else like it.</p>
      <p class="font-monospace text-success fw-bold">$ npx dotenv-vault build<br/>
      $ git commit -am "Add .env.vault"<br/>
      $ git push</p>
      <p><a href="/docs/tutorials/integrations">Deploying to Production »</a></p>
    </div>
  </div>
</div>
</div>

<hr class="my-0 py-0"/>

<div class="container-fluid pt-5 pb-5">
<div class="container pt-5 mb-5">
  <div class="row">
    <div class="col col-lg-6">
      <h2 class="h1 text-black">Used by thousands of developers and companies</h2>
      <p class="d-block text-secondary">Dotenv powers secrets for thousands of software teams across the world.</p>
      <p class="d-block text-secondary">New developers and companies get started with it every day.</p>
      <p class="d-block mb-4 pb-3"><a href="/customers">Dotenv Customers »</a></p>
    </div>
    <div class="col col-lg-6">
      <a href="/customers">
        <img src="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1666593866/Group_ukiica.png" width="400">
      </a>
    </div>
  </div>
</div>
</div>

<hr class="my-0 py-0"/>

<div class="container-fluid pt-5 pb-5">
<div class="container pt-5 mb-5">
  <div class="row">
    <div class="col">
      <h2 class="h1 text-black">Works everywhere</h2>
      <p class="d-block mb-4 pb-3 text-secondary">Integrates everywhere you already deploy your code</p>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <div class="">
        {% include helpers/integrations_grid.html %}
      </div>
    </div>
  </div>
</div>
</div>

</article>

<div class="container pt-5">
  <div class="row">
    <div class="col-lg-7 col-md-6">
      <div class="mt-3 mb-4">
        <div class="">
          <h3 class="">From the same people that pioneered dotenv. Trusted by more than 2.5 million developers.</h3>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 mb-3">
      <div class="">
        <a class="btn btn-danger px-5 py-3 mb-2 text-uppercase font-weight-bold" href="/signup" style="border-radius: 50px; background-image: radial-gradient(at left top, rgb(228, 115, 45) 0%, rgb(206, 41, 60) 100%);">
          Sign Up Now »
        </a>
      </div>
      <p class="mb-5 mt-2"><span class="text-dark fw-bold">Free to use.</span> See <a href="/pricing">additional pricing</a>.</p>
    </div>
  </div>
</div>
