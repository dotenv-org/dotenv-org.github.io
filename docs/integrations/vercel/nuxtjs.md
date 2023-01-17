---
layout: docs
title: "Vercel with Nuxt.js - Integrations Quickstart"
---

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/nuxt.html width="50" color="#00DC82" %}

##### Integrations

# __Vercel with Nuxt.js__

Learn how to make Vercel, Nuxt.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-vercel-nuxtjs).

## Package installation
First, install the `dotenv-vault-core` package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

## Initial setup
Create an `app.vue` file for your `Nuxt.js` application in the project `root` and add a basic page template to it.

Insert a `script` segment after the template and import the `dotenv-vault-core` package within it. Don't forget to call the `config` method:

##### Vue.js
```js
// app.vue

<template>
  <div>
    <NuxtWelcome />
  </div>
</template>

<script>
import dotenv from 'dotenv-vault-core'
dotenv.config()
console.log(process.env)
</script>
```
[Example](https://github.com/dotenv-org/integration-example-vercel-nuxtjs/blob/master/app.vue).

Create a `nuxt.config.js` file in your project `root` and call the `module.exports` method with the following parameters:

##### Nuxt.js
```js
// nuxt.config.js

module.exports = {
require('dotenv-vault-core').config(),
  {
    build: {
      publicPath: 'public/'
    }
  }
}
```
[Example](https://github.com/dotenv-org/integration-example-vercel-nuxtjs/blob/master/nuxt.config.js).

This will allow you to expand the `Nuxt.js` generate function, so you can call the `dotenv-vault-core` package from any location in your project.

When ready, include a reference to the expanded function by inserting the following within your `package.json` file:

##### JSON
```json
// package.json
"scripts": {
  "build": "nuxt build",
  "dev": "nuxt dev",
  "generate": "nuxt generate -c nuxt.config.generate.js",
  "preview": "nuxt preview",
  "postinstall": "nuxt prepare"
},
```
[Example](https://github.com/dotenv-org/integration-example-vercel-nuxtjs/blob/master/package.json).

## Build the Vault
Make sure you are [logged in and in sync](/docs/tutorials/sync) with your `Vault` first then run `npx dotenv-vault build` from `CLI` in your project root.

This will build an encrypted `.env.vault` file that serves as a unique identifier for your project in `Dotenv`.

Inside it you will find the public keys for every environment you have setup and must be committed to source.

##### CLI
```shell
npx dotenv-vault build
```

## Fetch the keys
With the Vault successfully built, you now can fetch the `.env.vault` decryption keys for each environment in the Vault project.

Running `npx dotenv-vault keys production`, for example, will return the `production` key and so will `development` and `ci` respectively.

##### CLI
```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## Set deployment
Now that you have access to the keys for every environment, you will have to reference them as environment variables in your `Vercel` project's settings.

To do that, navigate to your Project, then the Settings tab to reach the Environment Variable panel.

Set as key `DOTENV_KEY` and as value the decryption key returned in the previous step `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production`.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669189757/integrations/dotenv_vault_vercel_environment_variable_settings_igagy0.png" %}

## Commit and push
That's it!

Commit those changes safely to code and deploy to `Vercel`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .`env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Vercel` logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669865589/integrations/dotenv_vault_vercel_nuxt_logs_encrypted_loading_env_vault_qnekln.png" %}
