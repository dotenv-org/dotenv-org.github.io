---
layout: docs
title: "Firebase Functions with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/firebase.html width="50" color="#FFCA28" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Firebase Functions with Node.js__

Learn how to configure Firebase Functions with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-firebase-functions-nodejs).

## Initial setup
Create a new Firebase Functions setup, if you don't have one already, or use an existing one to get started.

You can initialize a basic setup by calling `firebase` in your project's `root` folder.

##### CLI

```shell
firebase init
```

## Package installation
Hop into your newly created `functions` folder and install the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Open the `index.js` file that Firebase created for you and add a reference for the `dotenv-vault-core` package just after the `firebase-functions` require declaration.

Reference the `defineString` method of the `firebase-functions/params` package and declare a `const` to store `DOTENV_KEY` as the name of the key you will be using to connect to `Dotenv Vault` later on.

Lastly, add a `runWith` method to the Firebase Function you will be exporting and add the `const` you created earlier as a parameter. Here's how the `index.js` file in your `functions` folder could look like:

##### Node.js

```js
// ./functions/index.js
const functions = require("firebase-functions");
require('dotenv-vault-core').config()
console.log(process.env) // remove this after you've confirmed it is working

const { defineString } = require('firebase-functions/params');
const dotenvKey = defineString('DOTENV_KEY');

exports.helloWorld = functions.runWith({vaultKey: dotenvKey}).https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

```
[Example](https://github.com/dotenv-org/integration-example-firebase-functions-nodejs/blob/main/functions/index.js).

## Build the Vault
Now that you have Firebase Functions set up, confirm you are logged in and your Vault is synced locally by running `npx dotenv-vault pull development`. Once ready, proceed by building your Vault with `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

Once Vault has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease.

To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `development`, for example. You can do the same with other environments such as `ci` and `production.`

The outcome of this will be a long URI being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys development
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=development
```

## Set deployment
With the decryption key safely in your possession, it is time to navigate to deploy your function via the CLI. Make sure you first run it with `--only functions` as parameters, so Firebase Functions can update its environment variable settings.

##### CLI

```shell
firebase deploy --only functions
```

Once Firebase Functions finishes preparing your `codebase`, it will pause the `build` process to ask you to enter the value of the `DOTENV_KEY` you declared earlier. Enter the `Vault` decryption key as its value and confirm to continue building.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671086649/integrations/dotenv_vault_firebase_functions_environment_variable_settings_yfyxrf.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy your Firebase Functions without the need for the `--only functions` parameter.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the `.env.vault` file, and load the `development` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Firebase Functions logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671086649/integrations/dotenv_vault_firebase_functions_logs_encrypted_loading_env_vault_l3ewwx.png" %}
