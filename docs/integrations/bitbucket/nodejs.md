---
layout: docs
title: "Bitbucket with Node.js - Integrations"
redirect_from:
  - /docs/integrations/bitbucket/nodejs
---

{% include helpers/reading_time.html %}

{% include icons/bitbucket.html width="50" color="#0052CC" %}
{% include icons/nodejs.html width="50" color="#000000" %}


# __Bitbucket with Node.js__
##### `Integrations`
Learn how to configure Bitbucket with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Make sure you have `Pipelines` enabled in your Bitbucket project (requires 2FA). Create a `bitbucket-pipelines.yml` file in your project's `root`  folder to set your Bitbucket pipeline settings. Add the image details and what steps should be triggered, such as install and build in our case.

#### Yaml
```Yml
# bitbucket-pipelines.yml
image: node:10.15.0
pipelines:
  default:
    - step:
        script:
          - npm install
          - npm run build
```

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

#### CLI
```shell
npm install dotenv-vault --save
```

Reference the Vault module as early as possible in your `index.js` code to avoid potential conflicts.

#### Node.js

```Java
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

## Build the Vault
With that out of the way, login and sync with your Vault locally with `npx dotenv-vault pull ci`, then proceed with building it via `npx dotenv-vault build`.

#### CLI

```shell
npx dotenv-vault build
```

When the building is complete, you will be granted access to the Vault decryption keys, which you can use to access protected environment variables freely. To fetch a key, run `npx dotenv-vault keys ci`, where `ci` represents the environment you wish to use with Vault, like `development` and `production`.

The prompt will return a long URL starting with `dotenv://:key` and ending in `?environment=` followed by the environment you have selected.

#### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
Keep the key you obtained in the previous step safe for now and navigate to your Bitbucket project in the mean time. Once you are there move to Repository settings, then Repository variables at the bottom. In the Repository variables panel, add `DOTENV_KEY` in the key field and the decryption key you stored earlier as its value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669139672/dotenv_vault_bitbucket_environment_variable_settings_c4ofat.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Bitbucket.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Bitbucket logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669139673/dotenv_vault_bitbucket_logs_encrypted_loading_env_vault_hzdez2.png" %}
