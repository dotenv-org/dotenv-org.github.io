---
layout: default
section: "Tutorials"
title: "Sync .env files"
description: "Sync environment variables securely with dotenv-vault."
parent: Docs
redirect_to: /docs/tutorials/sync
redirect_from:
  - /cli
  - /sync
  - /docs/getting-started/with-dotenv-vault
  - /get-started
---

<div class="row my-5 py-5">
  <div class="col-lg-6 offset-lg-3">
    <p class="text-center mt-5 pt-5 mb-1 fw-bold">You are being redirected to</p>
    <p class="text-center">
      <a class="text-dark" rel="" href="/docs/tutorials/sync"><u>/docs/tutorials/sync</u></a>
    </p>
    <p class="text-center mb-1">
      <a class="btn btn-dark" rel="" href="/docs/tutorials/sync">Continue</a>
    </p>
    <p class="text-center mb-5 pb-5 small">in <span id="counter">4</span> second(s)</p>
  </div>
</div>

<script>
  var interval
  interval = setInterval(function() {
    var div = document.querySelector("#counter")
    var count = div.textContent * 1 - 1
    div.textContent = count
    if (count <= 0) {
      window.location.replace("https://dotenv.org/docs/tutorials/sync")
      clearInterval(interval)
    }
  }, 1000)
</script>
