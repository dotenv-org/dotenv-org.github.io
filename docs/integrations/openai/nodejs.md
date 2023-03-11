---
layout: docs
title: "OpenAI with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/openai.html width="50" color="#412991" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __OpenAI with Node.js__

Learn how to configure OpenAI with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-openai-nodejs).

## Initial setup
First, you will need an OpenAI setup, so if you don't have one already go ahead and create it from scratch or one of the platform's templates.

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

const { Configuration, OpenAIApi } = require("openai");

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);
console.log(process.env.TEST);
console.log(openai);
```

[Example](https://github.com/dotenv-org/integration-example-openai-nodejs/blob/main/index.js).

## Build the Vault
Confirm you are logged in and your Vault is synced locally by running `npx dotenv-vault pull development`. Once ready, proceed by building your Vault with `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

Once Vault has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease.

To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `development`, for example. You can do the same with other environments such as `ci` and `production.`

The outcome of this will be a long URL being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys development
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=development
```

## Set deployment
With the decryption key safely in your possession, it is time for you to set it as an environment variable on your client machine via `CLI`. Enter the key-value pair directly for `UNIX` systems or preceded by `set` for `Windows`. The set environment variable will remain available until you exit the `CLI`.

##### CLI

```shell
// UNIX
DOTENV_KEY=dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=development

// Windows
set DOTENV_KEY=dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=development
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1670998701/integrations/dotenv_vault_openai_environment_variable_settings_avvv5p.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy your OpenAI project.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `development` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see the OpenAI environment context printed in your CLI.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1670998701/integrations/dotenv_vault_openai_logs_encrypted_loading_env_vault_xpohma.png" %}
