---
layout: docs
title: "GitHub Actions with Node.js - Integrations"
redirect_from:
  - /docs/integrations/github/actions-nodejs
---

{% include icons/github.html width="50" color="#181717" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __GitHub Actions with Node.js__

Learn how to configure GitHub Actions with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-actions-nodejs).

## Initial setup
Create a `main.yml` file in a `.github/workflows/` folder to set your GitHub Actions settings. Add a name for the Action, what should trigger it, and details about the jobs it will perform, such as build and deploy. Specify its behavior for these jobs by picking a target operating system and steps it should take, like installing and running packages.

Most important of all, however, do set an `env` parameter to store your `DOTENV_KEY` which you will use to decrypt your Vault and the environment variables it keeps.

##### Yaml
```Yml
{% raw %}// .github/workflows/main.yml
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
[Example](https://github.com/dotenv-org/integration-example-actions-nodejs/blob/main/.github/workflows/main.yml).

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Reference the Vault module as early as possible in your `index.js` code to avoid potential conflicts.

##### Node.js

```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```
[Example](https://github.com/dotenv-org/integration-example-actions-nodejs/blob/main/index.js).

## Build the Vault
With that out of the way, login and sync with your Vault locally with `npx dotenv-vault pull ci`, then proceed with building it via `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

When the building is complete, you will be granted access to the Vault decryption keys, which you can use to access protected environment variables freely. To fetch a key, run `npx dotenv-vault keys ci`, where `ci` represents the environment you wish to use with Vault, like `development` and `production`.

The prompt will return a long URI starting with `dotenv://:key` and ending in `?environment=` followed by the environment you have selected.

#### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
Keep the key you obtained in the previous step safe for now and navigate to your GitHub project in the mean time. Once you are there move to Settings, then Secrets, until you reach Actions, where you can submit a "New Repository Secret." In the repo secrets panel, add `DOTENV_KEY` in the key field and the decryption key you stored earlier as its value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669189002/integrations/dotenv_vault_github_actions_environment_variable_settings_iuwkyy.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to GitHub.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your GitHub Actions logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669189002/integrations/dotenv_vault_github_actions_encrypted_loading_env_wr7g19.png" %}
