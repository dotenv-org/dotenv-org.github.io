---
layout: docs
title: "Dagger with Node.js - Integrations"
redirect_from:
  - /docs/integrations/dagger-nodejs
---

{% include helpers/reading_time.html %}

{% include icons/dagger.html width="50" color="#343434" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Dagger with Node.js__

Learn how to configure Dagger with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-dagger-nodejs).

## Initial setup
First, you will need a Dagger CI setup, so if you don't have one already go ahead and create it. You can find an [example Node.js setup in the Dagger repo here](https://github.com/dagger/examples/tree/main/templates/nodejs/npm/gosdk).

## Package installation
Once ready, proceed by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

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
[Example](https://github.com/dotenv-org/integration-example-dagger-nodejs/blob/main/index.js).

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
With the decryption key safely in your possession, it is time for you to set it as an environment variable on your client machine via CLI. Enter the key-value pair directly for UNIX systems or preceeded by `set` for Windows. The set environment variable will remain available until you exit the CLI.

##### CLI

```shell
// UNIX
DOTENV_KEY=dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci

// Windows
set DOTENV_KEY=dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

Once ready, open your `main.go` file, locate the container initialization line and call the `WithEnvVariable` method for said container. Insert the key `"DOTENV_KEY"` as the first argument, and use the `os` package's `Getenv` method as the second - `os.Getenv("DOTENV_KEY")`. Here's how it should look like if your container is declared as `container`:

##### Go

```go
// main.go
container = container.WithEnvVariable("DOTENV_KEY", os.Getenv("DOTENV_KEY"))
```
[Example](https://github.com/dotenv-org/integration-example-dagger-nodejs/blob/main/main.go).

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668717954/integrations/dotenv_vault_dagger_environment_variable_settings_nbt7wi.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Dagger.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Dagger logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_dagger_logs_encrypted_loading_env_vault_qjfjcm.png" %}
