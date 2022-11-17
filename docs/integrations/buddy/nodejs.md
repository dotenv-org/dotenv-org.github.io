---
layout: docs
title: "Buddy with Node.js - Integrations"
redirect_from:
  - /docs/integrations/buddy-nodejs
---

{% include helpers/reading_time.html %}

{% include icons/buddy.html width="50" color="#1A86FD" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Buddy with Node.js__
Learn how to configure Buddy with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create a `buddy.yaml` file in your `root` folder to set your Buddy project settings. Add relevant `pipeline` and `action` settings to your project to define the tasks that need to be performed when building.

Don't forget to specify what Buddy needs to run after it has finished building, such as your starting point script. Here's a basic setup for your `buddy.yaml`

##### Yaml

```yml
// buddy.yaml
- pipeline: "Build"
  on: "EVENT"
  events:
  - type: "PUSH"
    refs:
    - "refs/heads/main"
  priority: "NORMAL"
  fail_on_prepare_env_warning: true
  resources: "DEFAULT"
  actions:
  - action: "Execute npm test"
    type: "BUILD"
    main_service_name: "Main"
    docker_image_name: "library/node"
    docker_image_tag: "16"
    execute_commands:
    - "npm install"
    - "npm run build"
    volume_mappings:
    - "/:/buddy/integration-example-buddy-nodejs"
    cache_base_image: true
    shell: "BASH"
```

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.


##### CLI
```shell
npm install dotenv-vault --save
```

Reference the Vault package as early in your `index.js` code as possible to skip any conflicts that may arise.

##### Node.js

```java
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

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
With the decryption key safely in your possession, it is time for you to head over to the Buddy project settings.

From there seek the Variables, Keys & Assets section and click the Add button under the Variables tab to begin the process.

Put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/dotenv_vault_buddy_environment_variable_settings_trkw18.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Buddy.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Buddy logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/dotenv_vault_buddy_logs_encrypted_loading_env_vault_k2qxow.png" %}
