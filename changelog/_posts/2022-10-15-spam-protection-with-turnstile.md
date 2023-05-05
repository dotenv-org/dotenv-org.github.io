---
layout: changelog
author: mot
title: "Added better spam protection with Turnstile"
---

We swapped our honeypot spam protection mechanism for [Cloudflare Turnstile](https://blog.cloudflare.com/turnstile-private-captcha-alternative/). It is more reliable at catching spam and the experience is still good – no annoying captchas identifying traffic signs. 

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-22_at_5.58.56_PM_obre5m.png" %}
