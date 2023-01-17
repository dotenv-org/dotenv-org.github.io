---
layout: docs
title: "Travis CI with Node.js - Integrations"
redirect_from:
  - /docs/integrations/travis-ci-nodejs
---

{% include icons/travis-ci.html width="50" color="#3EAAAF" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Travis CI with Node.js__

Learn how to configure Travis CI with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-travis-ci-nodejs).

## Initial setup
Create a `.travis.yml` file in your `root` folder to set your Travis CI settings. Add the language, its version and the appropriate commands you need executed at various build stages.

Here's an example `.travis.yml` setup:

##### Yaml

```yml
// .travis.yml
language: node_js
node_js:
  - 16
install:
  - npm install
  - npm run build
```
[Example](https://github.com/dotenv-org/integration-example-travis-ci-nodejs/blob/master/.travis.yml).

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.


##### CLI
```shell
npm install dotenv-vault-core --save
```

Reference the Vault package as early in your `index.js` code as possible to skip any conflicts that may arise.

##### Node.js

```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```
[Example](https://github.com/dotenv-org/integration-example-travis-ci-nodejs/blob/master/index.js).

## Build the Vault
Confirm you are logged in and your Vault is synced locally by running `npx dotenv-vault pull ci`. Once ready, proceed by building your Vault with `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

Once Vault has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease.

To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `ci`, for example. You can do the same with other environments such as `development` and `production.`

The outcome of this will be a long URI being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
With the decryption key safely in your possession, it is time for you to head over to the Travis CI project settings via the More options button in the top right corner of your dashboard.

From there click Settings and scroll down to the Environment Variables section. Put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_travisci_environment_variable_settings_fwh4tg.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Travis CI.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Travis CI logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_travisci_logs_encrypted_loading_env_vault_grezmb.png" %}
