---
layout: changelog
author: mot
title: "Added 'Deploy Everywhere' technology using encrypted .env.vault file"
---

Integrate Everywhere™ is our new approach to integrations. It works everywhere you can deploy your code. No more brittle integrations coordinating API calls. Instead, build and encrypt your local .env.vault file, commit it to code, and deploy. There's nothing else like it.

```
$ npx dotenv-vault build
$ git commit -am "Add .env.vault"
$ git push
```

{% include helpers/screenshot.html url="/assets/img/cloudinary/screely-1666490843091_ygumti.png" %}
