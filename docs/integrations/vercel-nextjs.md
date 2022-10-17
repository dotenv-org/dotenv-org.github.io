---
layout: docs
title: "Vercel with NextJS - Integrations"
---

{% include helpers/reading_time.html %}

##### Integrations

# Vercel with NextJS

Learn how to make Vercel, NextJS, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

## 1. Require dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
npm install dotenv-vault-core --save
```

Require it in `next.config.js` and load the parsed values to `nextConfig.env`. See line 7 in example below.

```
// next.config.js
const result = require('dotenv-vault-core').config()
console.log(result) // for debugging purposes. remove when ready.

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  env: result.parsed
}

module.exports = nextConfig
```

[example](https://github.com/dotenv-org/integration-example-vercel-nextjs/blob/master/next.config.js)

## 2. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 3. Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## 4. Set DOTENV_KEY

Visit your Vercel Project > Settings > Environment Variables.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666027615/integrations-vercel-envs_y43bwi.gif" %}

## 5. Commit and push

That's it! 

Commit those changes safely to code and push to GitHub.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666050504/Screen_Shot_2022-10-17_at_4.47.10_PM_vqsso3.png" %}
