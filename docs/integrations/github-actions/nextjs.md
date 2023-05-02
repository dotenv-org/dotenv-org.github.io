---
layout: docs
title: "GitHub Actions with NextJS - Integrations"
redirect_from:
  - /docs/integrations/github/actions-nextjs
---

{% include icons/github.html width="50" color="#181717" %}
{% include icons/nextjs.html width="50" color="#000000" %}

# GitHub Actions with NextJS

Learn how to configure GitHub Actions with Dotenv Vault for a NextJS application. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-github-actions-nextjs).

## 1. Add GitHub Actions yaml file

In your NextJS project add the file .github/workflows/main.yml.

```
{% raw %}# .github/workflow/main.yml
name: npm run build
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-node@v3
      with:
        node-version: 16
    - run: npm install
    - run: npm run build
      env:
        DOTENV_KEY: ${{ secrets.DOTENV_KEY }}{% endraw %}
```

[example](https://github.com/dotenv-org/integration-example-github-actions-nextjs/blob/master/.github/workflows/main.yml)

## 2. Preload dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core)

```
$ npm install dotenv-vault-core --save
```

Preload NextJS scripts using dotenv-vault-core. This will inject the environment variables ahead of NextJS.

```
"scripts": {
  "dev": "node -r dotenv-vault-core/config ./node_modules/.bin/next dev",
  "build": "node -r dotenv-vault-core/config ./node_modules/.bin/next build",
  "start": "node -r dotenv-vault-core/config ./node_modules/.bin/next start",
  "lint": "node -r dotenv-vault-core/config ./node_modules/.bin/next lint"
},
```
[example](https://github.com/dotenv-org/integration-example-github-actions-nextjs/blob/master/package.json)

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Set DOTENV_KEY

Run npx dotenv-vault keys ci.

```
$ npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

Visit your GitHub Project > Settings > Secrets > Actions and click 'New Repository Secret'.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/integrations-github-actions-secrets_df9kgo.gif" %}

## 5. Commit and push

That's it!

Commit those changes safely to code and push to GitHub.

When the CI runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the CI environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/Screen_Shot_2022-11-11_at_8.43.36_AM_ceqv91.png" %}
