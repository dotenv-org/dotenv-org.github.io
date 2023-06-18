---
layout: docs
title: "GitHub Actions with Remix - Integrations"
redirect_from:
  - /docs/integrations/github/actions-remix
---

{% include icons/github.html width="50" color="#181717" %}
{% include icons/remix.html width="50" color="#000000" %}

# GitHub Actions with Remix

Learn how to configure GitHub Actions with Dotenv Vault for a Remix application. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-github-actions-remix).

## 1. Add GitHub Actions yaml file

In your Remix project add the file .github/workflows/main.yml.

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

[example](https://github.com/dotenv-org/integration-example-github-actions-remix/blob/master/.github/workflows/main.yml)

## 2. Require dotenv-vault

Install [dotenv-vault](https://github.com/dotenv-org/dotenv-vault)

```
$ npm install dotenv --save
```

And add it to remix.config.js.

```
// remix.config.js
require('dotenv-vault').config()
console.log(process.env) // for debugging purposes. remove when ready.

module.exports = {
  ...
};
```

[example](https://github.com/dotenv-org/integration-example-github-actions-remix/blob/master/remix.config.js#L2)

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Get DOTENV_KEY

Run npx dotenv-vault keys ci.

```
$ npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## 5. Set DOTENV_KEY

Visit your GitHub Project > Settings > Secrets > Actions and click 'New Repository Secret'.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="/assets/img/cloudinary/integrations-github-actions-secrets_df9kgo.gif" %}

## 6. Commit and push

That's it!

Commit those changes safely to code and push to GitHub.

When the CI runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the CI environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-16_at_2.59.06_PM_y9n9sc.png" %}
