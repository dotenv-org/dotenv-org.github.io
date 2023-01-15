---
layout: docs
title: "Circle CI with Node.js - Integrations"
---

{% include icons/circleci.html width="50" color="#343434" %}
{% include icons/nodejs.html width="50" color="#339933" %}

# __Circle CI with Node.js__

Learn how to configure CircleCI with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-circleci-nodejs).

## Initial setup
Create a `config.yml` file in a `.circleci/` folder to set your CircleCI settings. Add relevant `orbs` to your project to define the tasks that need to be performed when building and be sure to include dependencies like container type. Don't forget to specify what CircleCI needs to run after it has finished building, such as your starting point script.

##### Yaml

```yml
# .circleci/config.yml
version: 2.1
orbs:
  node: circleci/node@5.0.3
jobs:
  build:
    docker:
      - image: cimg/base:2021.04
    steps:
      - checkout
      - node/install
      - node/install-packages
      - run:
          name: Run code
          command: node index
```
[Example](https://github.com/dotenv-org/integration-example-circleci-nodejs/blob/main/.circleci/config.yml).

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.


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
[Example](https://github.com/dotenv-org/integration-example-circleci-nodejs/blob/main/index.js).

## Build the Vault
Confirm you are logged in and your Vault is synced locally by running `npx dotenv-vault pull ci`. Once ready, proceed by building your Vault with `npx dotenv-vault build`.

##### CLI

```shell
npx dotenv-vault build
```

Once Vault has finished building, it will provide you with access to its decryption keys, which you can use to interact with protected environment variables with ease. To retrieve a key, just input `npx dotenv-vault keys`, followed by your preferred environment, like `ci`, for example. You can do the same with other environments such as `development` and `production.`

The outcome of this will be a long URI being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI  

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment

With the decryption key safely in your possession, it is time for you to head over to the CircleCI project settings. From there seek the Environment Variables section and click the Add Environment Variable button to begin the process. Put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669188726/integrations/dotenv_vault_circleci_environment_variable_settings_uu4bex.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to CircleCI.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your CircleCI logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669188726/integrations/dotenv_vault_circleci_encrypted_loading_env_vault_ouevqi.png" %}
