---
layout: docs
title: "Jenkins with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/jenkins.html width="50" color="#D24939" %}
{% include icons/nodejs.html width="50" color="#339933" %}

##### Integrations

# __Jenkins with Node.js__
Learn how to configure Jenkins with Dotenv Vault in a simple Node.js web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-jenkins-nodejs).

## Initial setup
Create a `Jenkinsfile` file in your `root` folder to set your Jenkins project settings. Add relevant `pipeline` and `action` settings to your project to define the tasks that need to be performed when building.

Don't forget to specify what Jenkins needs to run after it has finished building, such as your starting point script. To run `npm` scripts use `powershell` for Windows or `sh` for UNIX systems. Here's a basic setup for your `Jenkinsfile`:

##### Text
```plain
// Jenkinsfile for Windows
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                powershell 'npm install'
                powershell 'npm run build'
            }
        }
    }
}
```
[Example](https://github.com/dotenv-org/integration-example-jenkins-nodejs/blob/main/Jenkinsfile).

##### Text
```plain
// Jenkinsfile for UNIX
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
    }
}
```

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
[Example](https://github.com/dotenv-org/integration-example-jenkins-nodejs/blob/main/index.js).

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
With the decryption key safely in your possession, it is time for you to add it to the appropriate settings.

You can do so at several locations with Jenkins - as part of a build step, as a node property, and as a global setting.

Applying the decryption key to a build step will make it active only during that particular step, during node activity when set as a node property, and for every action as a global setting.

You can set it in a build step via the `Blue Ocean interface`, or the `Jenkinsfile`, in a node property via `Dashboard/Manage Jenkins/Nodes/NODE_NAME`, and in the global settings via `Dashboard/Manage Jenkins/Configure System`.

Once you've chosen a preferred location, put `DOTENV_KEY` as the key and save the decryption key you obtained earlier for the value field.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1670994982/integrations/dotenv_vault_jenkins_environment_variable_settings_jndesv.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Jenkins.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `ci` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Jenkins logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1670994982/integrations/dotenv_vault_jenkins_logs_encrypted_loading_env_vault_pl1pqj.png" %}
