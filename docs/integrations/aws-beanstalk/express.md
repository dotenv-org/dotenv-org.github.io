---
layout: docs
title: "AWS Beanstalk with Express - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/aws.html width="50" color="#2A6A35" %}
{% include icons/express.html width="50" color="#339933" %}

##### Integrations

# __AWS Beanstalk with Express__

Learn how to configure AWS Beanstalk with Dotenv Vault in a simple Express web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Use the default `AWS Beanstalk Express example`, an existing project, or just start from scratch when creating an application for this tutorial.

Configure your `AWS Beanstalk environment` to your liking and don't forget to link a GitHub repo as `source`.

Create a `buildspec.yml` file in your `root` folder to set your AWS Beanstalk project settings.

Add relevant `phase` and `command` settings to your project to define the tasks that need to be performed when building. Here's a basic setup for your `buildspec.yml`:

##### Yaml

```yml
// buildspec.yml
version: 0.2
phases:
  install:
    commands:
      - npm install
  pre_build:
    commands:
      - npm run build
      - rm -rf ./__build__
      - npm prune --production
  build:
    commands:
      - aws cloudformation package --template template.yml --s3-bucket $S3_BUCKET --output-template template-export.yml
```

Once ready, proceed by creating a basic pipeline setup using `AWS CodePipeline` and connect it with your AWS Beanstalk project accordingly.

## Package installation
With the AWS settings taken care of, you can proceed by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Create an `app.js` file in your `root` folder, if you don't have one already then reference the `dotenv-vault-core` package as early in the code as possible to avoid possible conflicts.

##### Express

```js
// app.js
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

The outcome of this will be a long URL being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
With the decryption key safely in your possession, it is time for you to head back to the `AWS CodePipeline` settings.

From there press the `Edit` button in the top right corner, then the `Edit stage` button under the Build stage and lastly the `edit icon`.

Once the `Edit action` is displayed, locate the `Environment variables` section, put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

Select `Plaintext` as type and confirm your changes with the `Done` button at the bottom right corner of the panel.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671589704/integrations/dotenv_vault_aws_beanstalk_environment_variable_settings_gvvty4.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to AWS Beanstalk.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `Loading .env from encrypted .env.vault` in your AWS Beanstalk logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671589704/integrations/dotenv_vault_aws_beanstalk_logs_encrypted_loading_env_vault_kfl2xv.png" %}
