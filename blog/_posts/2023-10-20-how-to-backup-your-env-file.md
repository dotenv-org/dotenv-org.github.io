---
layout: blog
author: mot
title: "How to back up your .env file"
image: "/assets/img/blog/dotenv-vault-push.png"
excerpt: "Learn how to back up your .env file, using dotenv-vault."
published: true
---

In the same directory as your `.env` file, set up [dotenv-vault](https://github.com/dotenv-org/dotenv-vault).

```shell
$ npx dotenv-vault new
```

Next, log in.

```shell
$ npx dotenv-vault login
```

Finally, securely push (back up) your `.env` file.

```shell
$ npx dotenv-vault push
```

That's it! You just backed up your `.env` file using [dotenv-vault](https://github.com/dotenv-org/dotenv-vault).

---

<iframe class="w-full aspect-video rounded-lg" src="https://www.youtube.com/embed/hC5v6WuoCQI" title="How to back up your .env file" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
