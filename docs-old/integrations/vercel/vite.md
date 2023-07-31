---
layout: docs
title: "Vercel with Vite - Integrations Quickstart"
---

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/vite.html width="50" color="#646CFF" %}

# __Vercel with Vite__

Learn how to make Vercel, Vite, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).


## Initial setup

Create an `app.vue` file for your `Vite` application and add a basic page template to it.

##### Vite
```html
// app.vue
<template>
  <div><h1>Your test worked perfectly</h1></div>
</template>
```

Then, create an `index.js` file to import and mount the `app.vue` template with.

##### Vite
```js
// index.js
import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
```

Lastly, create an `index.html` file from where you will call the `index.js` script.

##### HTML
```html
// index.html
<html>
    <div id="app"></div>
    <script type="module" src="/index.js"></script>
</html>
```

## Package installation
With the `Vite` initialization out of the way, you can go ahead and install the `dotenv` package with `npm`.

##### CLI
```shell
npm install dotenv --save
```

Once you are ready, create a `vite.config.js` file, which is where you will be calling the `dotenv` package from.

Import the `defineConfig` method from the `vite` module, the `vue` plugin from the `@vitejs/plugin-vue` module and then `dotenv` from the `dotenv` package.

You will still need to access the `dotenv` config script, so go ahead and call it afterwards, followed by a quick `.env` processing to make sure it works.

Together, all these element form a custom module that you can use to execute core `Vault` functionalities from any location.

But to make it work, you will first need to `export` the module, while adding a reference of the `vue()` function plugin.  

##### Vite
```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import dotenv from 'dotenv'

dotenv.config();
console.log(process.env)

export default defineConfig({
  plugins: [vue()],
})
```

## Build the Vault
Make sure you are [logged in and in sync](/docs/tutorials/sync) with your Vault first then run `npx dotenv-vault build` from `CLI` in your project root.

This will build an encrypted `.env.vault` file that serves as a unique identifier for your project in `Dotenv`. Inside it you will find the public keys for every environment you have setup and must be committed to source.

##### CLI
```shell
npx dotenv-vault build
```

## Fetch the keys
With the `Vault` successfully built, you now can fetch the `.env.vault` decryption keys for each environment in the `Vault` project.

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

{% include helpers/screenshot.html url="/assets/img/cloudinary/dotenv_vault_vercel_environment_variable_settings_igagy0.png" %}

## Commit and push
That's it!

Commit those changes safely to code and deploy to `Vite`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the `.env.vault` file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Vercel` logs.

{% include helpers/screenshot.html url="/assets/img/cloudinary/dotenv_vault_vite_logs_encrypted_loading_env_vault_fxf8sx.png" %}
