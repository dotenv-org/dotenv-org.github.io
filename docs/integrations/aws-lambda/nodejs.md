---
layout: docs
title: "AWS Lambda with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/aws-lambda.html width="50" color="#FF9900" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### `Integrations`

# __AWS Lambda with Node.js__

Learn how to configure AWS Lambda with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create a `buildspec.yml` file in your `root` folder to set your AWS Lambda project settings. Add relevant `phase` and `command` settings to your project to define the tasks that need to be performed when building. Here's a basic setup for your `buildspec.yml`:

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
artifacts:
  type: zip
  files:
    - template-export.yml
```

Once ready, move forward by creating a `template.yml` file also in your project `root` to set the `SAM` settings like so:

##### Yaml

```yml
// template.yml
AWSTemplateFormatVersion: 2010-09-09
Description: >-
  Start from scratch starter project
Transform: AWS::Serverless-2016-10-31
Globals:
  Function:
    PermissionsBoundary: !Sub 'arn:${AWS::Partition}:iam::${AWS::AccountId}:policy/${AppId}-${AWS::Region}-PermissionsBoundary'
Parameters:
  AppId:
    Type: String
Resources:
  helloFromLambdaFunction:
    Type: AWS::Serverless::Function
    Properties:
      CodeUri: ./
      Handler: src/handlers/hello-from-lambda.helloFromLambdaHandler
      Runtime: nodejs14.x
      MemorySize: 128
      Timeout: 60
      Description: A Lambda function that returns a static string.
      Policies:
        - AWSLambdaBasicExecutionRole
```

## Package installation
With the `AWS` settings taken care of, you can proceed by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.


##### CLI
```shell
npm install dotenv-vault-core --save
```

Create an `index.js` file in your `root` folder then reference the `dotenv-vault-core` package as early in the code as possible to avoid possible conflicts.

##### Node.js

```js
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

The outcome of this will be a long URL being returned. You will immediately recognize it as it always starts with `dotenv://:key` and ends in `?environment=` with the environment you have chosen.

##### CLI

```shell
npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

## Set deployment
With the decryption key safely in your possession, it is time for you to head over to your `AWS Lambda project` within the `CodeBuild/Build projects` path.

From there seek the `Build details` tab and its `Environment` section in particular. Click the `Edit` button at the top right corner of the section and find the `Additional configuration` accordion.

Underneath the `Compute radio` selection, you will find the `Environment variables` section. Put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

Lastly, pick `Plaintext` as `type` and confirm your settings by pressing the `Update environment` button.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671124272/integrations/dotenv_vault_aws_lambda_environment_variable_settings_mjy96l.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to AWS Lambda.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your AWS Lambda logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671124272/integrations/dotenv_vault_aws_lambda_logs_encrypted_loading_env_vault_zh1n5i.png" %}
