---
layout: docs
title: "Edgio with Nuxt.js - Integrations Quickstart"
---

{% include helpers/reading_time.html %}

{% include icons/edgio.html width="50" color="#000000" %}
{% include icons/nuxt.html width="50" color="#00DC82" %}

##### Integrations

# **Edgio with Nuxt.js**

Learn how to make Edgio, Nuxt.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-edgio-nuxtjs).

## Package installation

First, install the `dotenv-vault-core` package with `npm`.

##### CLI

```shell
npm install dotenv-vault-core --save
```

## Initial setup

Inside your `nuxt.config.js` file of your `Nuxt.js` application in the project `root`, load the dotenv variables by the `config` method.

```js
// Filename: nuxt.config.js

require("dotenv-vault-core").config()

export default {
  // Rest of your config
}
```

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

1. Install Edgio CLI:

```shell
npm i -g @edgio/cli
```

2. Integrate Edgio with Nuxt.js:

```shell
edgio init
```

3. Update `edgio.config.js` to include .env.vault:

```js
// Filename: edgio.config.js

"use strict"

module.exports = {
  connector: "@edgio/nuxt",

  // Set to true to include all packages listed in the dependencies property of package.json when deploying to Edgio.
  includeNodeModules: true,

  // Allows you to include additional resources in the bundle that is deployed to Edgio’s serverless JS workers.
  // Keys are globs, value can be a boolean or string. This is typically used to ensure that resources
  // that need to be dynamically required at runtime such as build manifests for server-side rendering
  // or other config files are present in the cloud.
  includeFiles: {
    ".env.vault": true,
  }, 
}
```

4. Add DOTENV_KEY to your Edgio project:

Now that you have access to the keys for every environment, you will have to reference them as environment variables in your `Edgio` project's configuration tab.

To do that, navigate to your Project, then the Environments tab, select `default` to reach the Environment Variable panel.

Set as key `DOTENV_KEY` and as value the decryption key returned in the previous step `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production`.

{% include helpers/screenshot.html url="https://a.storyblok.com/f/117912/3024x1724/f9bca82f4c/loggedinss.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to `Edgio`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .`env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Edgio` logs.

{% include helpers/screenshot.html url="https://a.storyblok.com/f/117912/2926x1244/3b8fd4a395/build-nuxtjs-edgio.png" %}
