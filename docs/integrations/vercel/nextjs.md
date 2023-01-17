---
layout: docs
title: "Vercel with NextJS - Integrations"
redirect_from:
  - /docs/integrations/vercel-nextjs
---

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/nextjs.html width="50" color="#000000" %}

# Vercel with NextJS

Learn how to make Vercel, NextJS, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-vercel-nextjs).

## 1. Install dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ npm install dotenv-vault-core --save
```

## 2. Preload dotenv-vault-core

Preload NextJS scripts using dotenv-vault-core. This will inject the environment variables ahead of NextJS.

```
"scripts": {
  "dev": "node -r dotenv-vault-core/config ./node_modules/.bin/next dev",
  "build": "node -r dotenv-vault-core/config ./node_modules/.bin/next build",
  "start": "node -r dotenv-vault-core/config ./node_modules/.bin/next start",
  "lint": "node -r dotenv-vault-core/config ./node_modules/.bin/next lint"
},
```
[example](https://github.com/dotenv-org/integration-example-vercel-nextjs/blob/master/package.json)

When using `pnpm`, add a `.npmrc` file with `node-linker=hoisted`. See [pnpm/pnpm#4782](https://github.com/pnpm/pnpm/issues/4782) for more information.

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Set DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Visit your Vercel Project > Settings > Environment Variables.

Set **DOTENV_KEY** to the value returned above.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666027615/integrations-vercel-envs_y43bwi.gif" %}

## 5. Commit and push

That's it!

Commit those changes safely to code and push to Vercel.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_fit,h_600,w_800/v1668184178/Screen_Shot_2022-11-11_at_8.28.40_AM_svdlil.png" %}
