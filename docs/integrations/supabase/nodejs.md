---
layout: docs
title: "Supabase with Node.js - Integrations"
---

{% include icons/supabase.html width="50" color="#3ECF8E" %}
{% include icons/nodejs.html width="50" color="#339933" %}

# __Supabase with Node.js__

Learn how to configure Supabase with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
First, you will need to initialize your `Supabase` setup, so if you don't have one already go ahead and create it.

Since the core functions you will be performing are only available via `CLI`, go ahead and get that from `Supabase` too.

Considering `Supabase` uses `Docker` to deploy local instances, make sure you have the `Docker Daemon` running before you attempt your interactions.

Once you've taken care of this, start a local `Supabase` instance via the `CLI`, then log into your `Supabase` account from the same location.

Lastly, `link` your local instance with the remote database, so your settings are applied there too.

##### CLI
```shell
supabase start
supabase login
supabase link --project-ref YourSupabaseProjectRefHere
```

## Package installation
Once ready, proceed by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Create an `index.js` file and reference the `Vault` package inside it as early as possible to skip on any conflicts that may arise.

##### Node.js

```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

## Build the Vault
Confirm you are logged in and your Vault is synced locally by running `npx dotenv-vault pull production`. Once ready, proceed by building your Vault with `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

Once Vault has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease.

To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `production`, for example.

You can do the same with other environments such as `development` and `ci.`

The outcome of this will be a long URL being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
With the decryption key safely in your possession, it is time for you to insert it as a `secret` within `Supabase`.

You can do this with a simple CLI action, where you set `DOTENV_KEY` as the key first, add an equals sign and follow with the decryption key you obtained earlier as the value. There are no empty spaces in between.

##### CLI
```shell
supabase secrets set DOTENV_KEY=dotenv://:key_828fe6f34bf06d690ca21eab3c0d5556a87@dotenv.org/vault/.env.vault?environment=production
```

Once you've set your decryption key as a `Supabase` secret you can start interacting with it.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/dotenv_vault_supabase_environment_variable_settings_iipewk.png" %}


To do that, however, you will need to add the appropriate references for the `Supabase` client within your `index.js` file.

##### Node.js

```js
// index.js
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = process.env.URL
const supabaseKey = process.env.KEY
const supabase = createClient(supabaseUrl, supabaseKey)
console.log(supabase); // display Supabase instance information to debug
```

## Commit and push

That's it!

Commit those changes safely to code and start interacting with `Supabase`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the `.env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see the `Supabase` instance information displayed in your `CLI` logs.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/dotenv_vault_supabase_logs_encrypted_loading_env_vault_ot0qan.png" %}
