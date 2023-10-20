---
layout: blogpage
author: mot
title: "How to back up your .env file"
image: "/assets/img/blog/dotenv-vault-push.png"
excerpt: "Learn how to back up your .env file, using dotenv-vault."
published: true
---

Learn how to back up your .env file, using [dotenv-vault](https://github.com/dotenv-org/dotenv-vault).

In the same directory as your `.env` file, set up your vault.

```
$ npx dotenv-vault new
```

Next, log in.

```
$ npx dotenv-vault login
```

Finally, securely push (back up) your `.env` file.

```
$ npx dotenv-vault push
```

That's it! You just backed up your `.env` file using [dotenv-vault](https://github.com/dotenv-org/dotenv-vault).

<iframe width="560" height="315" src="https://www.youtube.com/embed/hC5v6WuoCQI" title="How to back up your .env file" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

