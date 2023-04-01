---
layout: docs
section: Overview
title: "Quickstart"
description: The complete quickstart guide to manage your secrets with dotenv-vault.
---

In this guide, we'll deploy an application to Vercel, the dotenv way. We'll create the app, load and sync its secrets, and deploy it to Vercel. A quick skim over this tutorial, and you'll understand all the foundational concepts of using dotenv-vault.

## Create our app

We'll create a Node application for this guide, but you can follow along with your own application in any language or framework.

Set up the app's containing folder.

```
$ mkdir hello-world
$ cd hello-world
```

Create the file that will house the code.

```
$ touch index.js
$ nano index.js
```

Write the code to build our hello-world web server. [source](https://nodejs.org/en/docs/guides/getting-started-guide)

```javascript
// index.js
const http = require('http')

const hostname = '127.0.0.1'
const port = 3000

const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.setHeader('Content-Type', 'text/plain')
  res.end('Hello World')
})

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`)
})
```

Run our web server.

```
$ node index.js
```

Visit [localhost:3000](http://localhost:3000) and you will see "Hello World".

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_1200/v1680360955/Screenshot_2023-04-01_at_7.55.10_AM_wyu6en.png" class="w-75" %}

Next, let's use [dotenv](https://github.com/motdotla/dotenv) to customize the port and greeting.

## Require dotenv in our app

Install dotenv. [source](https://github.com/motdotla/dotenv#install)

```
# install locally (recommended)
$ npm install dotenv --save
```

Create a `.env` file in the root of our project:

```
PORT="3000"
GREETING="Bonjour World"
```

Modify `index.js` to use dotenv.

```javascript
// index.js
require('dotenv').config()

const http = require('http')

const hostname = '127.0.0.1'
const port = process.env.PORT

const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.setHeader('Content-Type', 'text/plain')
  res.end(process.env.GREETING)
})

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`)
})
```

Restart our web server.

```
$ node index.js
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_1200/v1680362148/Screenshot_2023-04-01_at_8.15.30_AM_tjdju0.png" class="w-75" %}

Now it says 'Bonjour World'. Cool! We're ready to backup and sync our `.env` file.

## Sync .env file

We're ready to use dotenv-vault to sync our .env file! [source](https://github.com/dotenv-org/dotenv-vault#usage)

Usage is similar to git. Run the command:

```
$ npx dotenv-vault new
```

Follow those instructions and then run:

```
$ npx dotenv-vault login
```

Then run push and pull:

```
$ npx dotenv-vault push
$ npx dotenv-vault pull
```

That's it! We synced our .env file.

{% include helpers/videoplayer.html mp4="https://res.cloudinary.com/dotenv-org/video/upload/v1680364471/dotenv-vault-sync-video_yutprj.mp4" webm="https://res.cloudinary.com/dotenv-org/video/upload/v1680364471/dotenv-vault-sync-video_yutprj.webm" %}

## Manage environments

After we pushed our .env file, we can manage our secrets across multiple environments. Let's open the production environment to view and edit its environment variables.

```
$ npx dotenv-vault open production
```

In the UI, we are going to delete the `PORT` environment variable. We will rely on Vercel's platform to fill that in on deploy. We'll edit the `GREETING` environment variable to "Hello Production" so that we can recognize it on deploy.

{% include helpers/videoplayer.html mp4="https://res.cloudinary.com/dotenv-org/video/upload/v1680366837/npx-dotenv-vault-open_h70feb.mp4" webm="https://res.cloudinary.com/dotenv-org/video/upload/v1680366837/npx-dotenv-vault-open_h70feb.webm" %}

## Deploy

Build our project's encrypted .env.vault file. It securely encrypts our secrets in a cloud-agnostic payload.

#### 1. Build encrypted .env.vault

```
$ npx dotenv-vault build
remote:   Securely building .env.vault... done
```

We then commit that safely to code.

```
$ git add .env.vault
$ git commit -am "Build encrypted .env.vault file for deploy"
```

#### 2. Set DOTENV_KEY

Let's fetch the production decryption key - the `DOTENV_KEY`.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done
dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Then let's set the `DOTENV_KEY` enviroment variable on Heroku.

```
$ heroku create
$ heroku config:set DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production'
```

#### 3. Import dotenv-vault-core

We need to swap out `dotenv` for `dotenv-vault-core` so that we can decrypt the .env.vault payload on deploy. Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ npm install dotenv-vault-core --save
```

And replace `require('dotenv')` with `require('dotenv-vault-core')`

```
// index.js
require('dotenv-vault-core').config()
...
```

Also let's edit our `package.json` to have a start script so that Heroku can boot our application at runtime.

```json
{
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "dotenv": "^16.0.3",
    "dotenv-vault-core": "^0.7.0"
  }
}
```

Ok, we're ready to deploy to heroku. Create our project on heroku.

#### 4. Deploy to Heroku

```
$ git push heroku
```

If it is successful you'll see a line in the logs like this.

```
[dotenv-vault-core@0.7.0][INFO] Loading env from encrypted .env.vault
```

That's it! The `DOTENV_KEY` will securely decrypt our .env.vault file at runtime and inject our secret environment variables just in time. Say goodbye to risky third-party integrations and get complete control over your secrets from a single source of truth. It's the best of both worlds.

{% include helpers/videoplayer.html mp4="https://res.cloudinary.com/dotenv-org/video/upload/v1680372369/deploy-encrypted-vault_shdiav.mp4" webm="https://res.cloudinary.com/dotenv-org/video/upload/v1680372369/deploy-encrypted-vault_shdiav.webm" %}
