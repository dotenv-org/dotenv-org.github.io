---
layout: docs
title: "Netlify with Astro - Integrations"
redirect_from:
  - /docs/integrations/netlify-astro
---

{% include helpers/reading_time.html %}

{% include icons/netlify.html width="50" color="#00C7B7" %}
{% include icons/astro.html width="50" color="#FF5D01" %}

##### Integrations

# Netlify with Astro

Learn how to make Netlify, Astro, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-netlify-astro).

## 1. Install dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ npm install dotenv-vault-core --save
```

## 2. Preload dotenv-vault-core

Preload Astro scripts using dotenv-vault-core. This will inject the environment variables ahead of Astro.

```
"scripts": {
  "dev": "node -r dotenv-vault-core/config ./node_modules/.bin/astro dev",
  "start": "node -r dotenv-vault-core/config ./node_modules/.bin/astro dev",
  "build": "node -r dotenv-vault-core/config ./node_modules/.bin/astro build",
  "preview": "node -r dotenv-vault-core/config ./node_modules/.bin/astro preview",
  "astro": "astro"
},
```
[example](https://github.com/dotenv-org/integration-example-netlify-astro/blob/master/package.json)

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## 5. Set DOTENV_KEY

Visit your Netlify Project > Settings > Build & Deploy > Environment.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666070315/Screen_Shot_2022-10-17_at_10.10.46_PM_hwrkoq.png" %}

## 6. Commit and push

That's it!

Commit those changes safely to code and push to GitHub.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

It worked if you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666070363/Screen_Shot_2022-10-17_at_10.11.33_PM_yka8rn.png" %}
