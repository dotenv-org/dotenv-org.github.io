---
layout: docs
title: "Netlify with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/netlify.html width="50" color="#00C7B7" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Netlify with Node.js__

Learn how to configure Netlify with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create a `netlify.toml` file in the `root` folder of your project to set your Netlify settings there. You can use several environment contexts to the deployment setup to load their corresponding secrets and commands. Instead of pulling Vault variables to local storage, you can access them directly by adding the `-m` parameter, followed by the unique `me_` identifier from your `.env.me` file.

#### Toml

```Toml
# /netlify.toml
[build]
  command = "npm run build"
```

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

#### CLI

```shell
npm install dotenv-vault --save
```
Make a reference to the Vault package as early as possible in your `index.js` code to steer clear from any plausible conflicts moving forward.

#### Node.js

```java
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

## Build the Vault
Before you start, double check you are logged in and that your Vault is synced locally. If everything checks out, you can move forward and build your Vault using `npx dotenv-vault build`.

#### CLI

```shell
npx dotenv-vault build
```

Upon successful Vault build, you will be able to access its decryption keys, without which you will not be able to interact with protected environment variables. You can retrieve the key for a specific environment by running `npx dotenv-vault keys` with the environment in question added at the back.

When you fetch a key, it will return as a long URI that is quite easy to recognize, as it starts with `dotenv://:key` while `?environment=` and the environment you have chosen will be always at the back.

#### CLI

```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## Set deployment
Once you have the appropriate key secured, you can move over to your Netlify project panel to open Site settings. There, you must look for the Build & deploy section and specifically its Environment child, where you can Edit variables. Insert `DOTENV_KEY` in the key slot and place the decryption key you retrieved earlier as the value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666846662/dotenv_netlify_environment_variable_settings_dijkbu.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Netlify.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `production` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Netlify logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666952821/dotenv_netlify_encrypted_loading_env_pwuzng.png" %}
