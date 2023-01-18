---
layout: default
title: Sign Up
redirect_to: https://account.dotenv.org/signup
---

<div class="row my-5 py-5">
  <div class="col-lg-6 offset-lg-3">
    <p class="text-center mt-5 pt-5 mb-1 fw-bold">You are being redirected to</p>
    <p class="text-center">
      <a class="text-dark" rel="" href="https://account.dotenv.org/signup"><u>account.dotenv.org/signup</u></a>
    </p>
    <p class="text-center mb-1">
      <a class="btn btn-dark" rel="" href="https://account.dotenv.org/signup">Continue</a>
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
      window.location.replace("https://account.dotenv.org/signup")
      clearInterval(interval)
    }
  }, 1000)
</script>
