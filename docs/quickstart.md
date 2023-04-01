---
layout: docs
section: Overview
title: "Quickstart"
description: The complete quickstart guide to manage your secrets with dotenv-vault.
---

In this guide, we'll deploy an application to Vercel, the dotenv way. We'll create the app, load and sync its secrets, and deploy it to Vercel. A quick skim over this tutorial, and you'll understand all the foundational concepts of using dotenv-vault.

## Create our application

We'll create a Node application for this guide, but you can follow along with your own application in any language or framework.

Set up the app's containing folder.

```
mkdir hello-world
cd hello-world
```

Create the file that will house the code.

```
touch index.js
nano index.js
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
node index.js
```

Visit [localhost:3000](http://localhost:3000) and you will see "Hello World".

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_1200/v1680360955/Screenshot_2023-04-01_at_7.55.10_AM_wyu6en.png" class="w-75" %}

Next, let's use [dotenv](https://github.com/motdotla/dotenv) to customize the port and greeting.

## Load dotenv

Install dotenv. [source](https://github.com/motdotla/dotenv#install)

```
# install locally (recommended)
npm install dotenv --save
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
node index.js
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_1200/v1680362148/Screenshot_2023-04-01_at_8.15.30_AM_tjdju0.png" class="w-75" %}

Now it says 'Bonjour World'. Cool! We're ready to backup and sync our `.env` file.

## Sync .env file

We're ready to use dotenv-vault to sync our .env file! [source](https://github.com/dotenv-org/dotenv-vault#usage)

Usage is similar to git. Run the command:

```
npx dotenv-vault new
```

Follow those instructions and then run:

```
npx dotenv-vault login
```

Then run push and pull:

```
npx dotenv-vault push
npx dotenv-vault pull
```

That's it! We synced our .env file.

{% include helpers/videoplayer.html mp4="https://res.cloudinary.com/dotenv-org/video/upload/v1680364471/dotenv-vault-sync-video_yutprj.mp4" webm="https://res.cloudinary.com/dotenv-org/video/upload/v1680364471/dotenv-vault-sync-video_yutprj.webm" %}

## Manage

## Deploy

