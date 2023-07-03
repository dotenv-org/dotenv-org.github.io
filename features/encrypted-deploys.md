---
layout: default
title: "Encrypted Deploys"
---

<div class="container">
  <div class="row text-center mb-3">
    <div class="col">
      <h1 class="display-1 fw-extrabold mt-5 lh-1">Encrypted Deploys</h1>
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <p class="h2 fw-light mt-1">Deploy your secrets securely with encrypted .env.vault files</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="row mb-5">
  <div class="col-lg-8 offset-lg-2">
    {% include helpers/screenshot.html url="/assets/img/changelog/encrypted-deploys.png" %}
    <ul>
      <li>Uses AES-256 GCM encryption. Developed for the needs of US Government agencies like the CIA</li>
      <li>Decrypts and injects your secrets just in time on application boot</li>
      <li>No more scattered secrets across third parties that might leak them</li>
    </ul>
  </div>
</div>
