---
layout: default
title: "Security"
redirect_from:
  - /p1/security
---

{% include helpers/security_hero.html %}

<div class="container bg-dark bg-vault-image text-white shadow-sm">
  {% include helpers/how_it_works_securely.html %}
</div>

<div class="container bg-white shadow-sm rounded-bottom">
  <div class="row">
    <div class="col col-lg-10 offset-lg-1">
      <h4 class="text-center py-5 pb-3">Learn more about security in the <a href="/docs/security">security docs</a></h4>
      <div class="text-body-tertiary opacity-50"><hr/></div>
      <h2 class="mt-5 fw-bold text-center">Security Specifications</h2>
      <h6 class="text-center fw-normal mb-4">Here's additional specifications that went into building dotenv-vault.</h6>
      {% include vault/specs_table.html %}
      <p class="fw-bold">As you see, we go to great lengths to make sure your secrets are safe. Afterall, we keep our secrets here too.</p>
      <div class="text-body-tertiary opacity-50"><hr/></div>
    </div>
  </div>
  <div class="row">
    <div class="col col-lg-8 offset-lg-2">
      <h2 class="mt-5 fw-bold text-center">Security Statement</h2>
      <h6 class="text-center fw-normal mb-4">A message from Dotenv's Founder & CTO.</h6>
      <p>Fellow developer,</p>
      <p>As you already know, security is an evermoving target - an arms race. But that doesn't mean it should be hard to use. Good design can make complex things simple, and that is what we are after at Dotenv.</p>
      <p>Dotenv is a security tool. It has been since it was first developed in 2013. We saw developers struggling to keep their secrets safe so we pioneered the .env security file format standard. The design led to a better Developer Security Experience - which led to safer secrets for millions of developers. Today, we are taking that to the next logical step.</p>
      <p>What is the problem with .env files today? The world has changed. Developers manage secrets at greater scale than a decade ago. .env files are not easily shareable between machines, environments, and team members. As a result, developers share secrets over Slack, email, and other messaging services. It's not scaleable and is a security risk. For a CTO or CSO it is a risk they should not take.</p>
      <p>So, today, we are extending the .env file format to support syncing across machines, environments, and team members. It's an exciting development and we welcome you to go on this journey with us.</p>
      <p>Join us.</p>
      <p>- Mot.<br/>Founder & CTO</p>
      <img src="https://res.cloudinary.com/dotenv-org/image/upload/v1667973172/mot-dotenv_l00kth.png" width="90" alt="Mot"/>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <div class="text-body-tertiary opacity-50"><hr/></div>
      <h4 class="fw-bold text-center py-4">
        Sync .env files securely&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="btn btn-dark btn-sm" href="/signup">Get your Dotenv Account</a>
      </h4>
    </div>
  </div>
</div>
