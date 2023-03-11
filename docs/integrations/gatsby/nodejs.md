---
layout: docs
title: "Gatsby with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/gatsby.html width="50" color="#663399" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations
# __Gatsby with Node.js__

Learn how to make Gatsby, Node.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-gatsby-nodejs).

## Initial setup
Start with an existing Gatsby setup or use one of the site templates available on the platform.

## Package installation
Move forward by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Add a reference for the `dotenv-vault-core` package as early as possible within the `gatsby-config.js` file, just before the `module_exports` call.

##### React
```js
// gatsby-config.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.

module.exports = {
  ...
}
```
[Example](https://github.com/dotenv-org/integration-example-gatsby-nodejs/blob/main/gatsby-config.js)

## Build the Vault
Make sure you are [logged in and in sync](/docs/tutorials/sync) with your Vault first then run `npx dotenv-vault build` from CLI in your project root.

This will build an encrypted .env.vault file that serves as a unique identifier for your project in Dotenv.

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
Now that you have access to the keys for every environment, you will have to reference them as environment variables in your `Gatsby` project's settings.

To do that, navigate to your Project, then the Site Settings tab to reach the Environment variables panel.

Set as key `DOTENV_KEY` and as value the decryption key returned in the previous step `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production`.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669975011/integrations/dotenv_vault_gatsby_environment_variable_settings_dzihkx.png" %}

## Commit and push
That's it!

Commit those changes safely to code and deploy to `Gatsby`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the `.env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on `local` machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Gatsby` logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1670974859/integrations/dotenv_vault_gatsby_logs_encrypted_loading_env_vault_ygpqf5.png" %}
