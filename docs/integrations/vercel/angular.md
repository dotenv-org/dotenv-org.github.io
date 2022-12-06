---
layout: docs
title: "Vercel with Angular - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/angular.html width="50" color="#DD0031" %}

##### Integrations
# __Vercel with Angular__

Learn how to make Vercel, Angular, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Instantiate a sample application via the `Angular` CLI, if you don't have a ready project yet by entering `ng new` along with your preferred project settings to get started.

##### CLI
```shell
ng new
```

You won't need to make further changes to the codebase to complete this tutorial.

## Package installation
Move forward by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Don't forget to install the `@vercel/node` runtime, as it offers `TypeScript` support for the  compile and serve functionalities during deployment.

##### CLI
```shell
npm install @vercel/node
```

## Preload dotenv-vault-core

The `dotenv-vault-core` package allows you to make full use of all `Vault` capabilities, without the need to commit a single line of code inside your scripts.

Instead, you can preload the package by inserting it within the build and development commands with a simple `-r` require flag.

This will inject your environment variables before any real rendering is done by `Vercel` or any other platform.

##### JSON
```json
// package.json or as Vercel overrides
"scripts": {
  "ng": "ng",
  "start": "node -r ./node_modules/dotenv-vault-core/config ./node_modules/@angular/cli/bin/ng serve",
  "build": "node -r ./node_modules/dotenv-vault-core/config ./node_modules/@angular/cli/bin/ng build",
  "watch": "node -r ./node_modules/dotenv-vault-core/config ./node_modules/@angular/cli/bin/ng build --watch --configuration development",
  "test": "node -r ./node_modules/dotenv-vault-core/config ./node_modules/@angular/cli/bin/ng test"
},
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669971185/integrations/dotenv_vault_vercel_angular_build_command_overrides_pdpkze.png" %}

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
Now that you have access to the keys for every environment, you will have to reference them as environment variables in your `Vercel` project's settings.

To do that, navigate to your Project, then the Settings tab to reach the Environment Variable panel.

Set as key `DOTENV_KEY` and as value the decryption key returned in the previous step `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production`.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669189757/integrations/dotenv_vault_vercel_environment_variable_settings_igagy0.png" %}

## Commit and push
That's it!

Commit those changes safely to code and deploy to `Vercel`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the `.env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on `local` machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Vercel` logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669971186/integrations/dotenv_vault_vercel_angular_logs_encrypted_loading_env_vault_mxygem.png" %}
