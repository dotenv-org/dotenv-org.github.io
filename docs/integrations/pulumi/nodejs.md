---
layout: docs
title: "Pulumi with Node.js - Integrations"
---

{% include icons/pulumi.html width="50" color="#4285F4" %}
{% include icons/nodejs.html width="50" color="#8A3391" %}

# __Pulumi with Node.js__
##### `Integrations`
Learn how to configure Pulumi with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create a `pulumi.yaml` file in your project `root` and initialize it with the following segment or let the `Pulumi CLI` do it all for you:

##### CLI

```shell
pulumi new gcp-javascript
```

##### Yaml

```yml
// pulumi.yaml
name: integration-example-pulumi-nodejs
description:
runtime:
    name: nodejs
    options:
        typescript: false
```
[Example](https://github.com/dotenv-org/integration-example-pulumi-nodejs/blob/master/pulumi.yaml).

This tutorial uses `Google Cloud Build` as a cloud provider but there are alternative options that you can use with `Pulumi` too.

Create a `cloudbuild.yml` file in your `root` folder to set your `Google Cloud Build` settings. Add the name, entry point, and arguments for each step you want executed.

To load your `Dotenv Vault` environment variables at a certain step, add an `env` item and reference the `Substitution variable` that will be set in your `Google Cloud Build Triggers` accordingly.

Keep in mind that `Google Cloud Build Substitution variables` always start with an _underscore, which makes this reference vital for your success.

In your case, the `cloudbuild.yml` should look like this:

#### Yaml

```yml
// cloudbuild.yml
steps:
- name: node
  entrypoint: npm
  args: ['install']
- name: node
  entrypoint: npm
  env:
    - 'DOTENV_KEY=${_DOTENV_KEY}'
  args: ['run', 'build']
```
[Example](https://github.com/dotenv-org/integration-example-pulumi-nodejs/blob/master/cloudbuild.yaml).

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.


#### CLI
```shell
npm install dotenv-vault-core --save
```

Reference the `Vault` package as early in your `index.js` code as possible to skip any conflicts that may arise.

#### Node.js

```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```
[Example](https://github.com/dotenv-org/integration-example-pulumi-nodejs/blob/master/index.js).

You will also need to install the `@pulumi/gcp` and `@pulumi/pulumi` packages to integrate `Pulumi` with `Google Cloud Build` and vice-versa.

#### CLI
```shell
npm install @pulumi/gcp --save
npm install @pulumi/pulumi --save
```

## Build the Vault
Confirm you are logged in and your `Vault` is synced locally by running `npx dotenv-vault pull ci`. Once ready, proceed by building your `Vault` with `npx dotenv-vault build`.

#### CLI

```shell
npx dotenv-vault build
```

Once `Vault` has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease.

To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `ci`, for example. You can do the same with other environments such as `development` and `production.`

The outcome of this will be a long URL being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

#### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
With the decryption key safely in your possession, it is time to navigate to your `Google Cloud Build` settings via the web interface and hop onto the `Triggers` section.

Create a new trigger, if you don't have one yet and under the Configuration section set `Type` to either `Autodetected`, if you plan to use the default `cloudbuild.yml` filename, or `Cloud Build configuration file` with the appropriate `yml` filename.

Under the Advanced section you will find the `Substitution variables` where you can list `_DOTENV_KEY` as the key and the decryption key you obtained earlier as the value field.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_google_cloud_environment_variable_settings_wrgklc.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to `Pulumi`.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard `Dotenv` functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your `Google Cloud Build` logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669869508/integrations/dotenv_vault_pulumi_logs_encrypted_loading_env_vault_jjjtdn.png" %}
