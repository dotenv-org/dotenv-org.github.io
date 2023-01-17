---
layout: docs
title: "Railway with Node.js - Integrations"
redirect_from:
  - /docs/integrations/railway-nodejs
---

{% include icons/railway.html width="50" color="#0B0D0E" %}
{% include icons/nodejs.html width="50" color="#339933" %}

# Railway with Node.js

Learn how to make Railway, Node.js, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-railway-nodejs).

## Set up Node.js for Railway

Set up your Node.js app to work with Railway.

```
// index.js
const http = require('http')
const PORT = process.env.PORT || 5000

const server = http.createServer((req, res) => {
  res.write(`Hello ${process.env.HELLO}`)
  res.end()
})

server.listen(PORT, () => {
  console.log(`Server running on ${PORT}`)
})
```

[example](https://github.com/dotenv-org/integration-example-vercel-nodejs/blob/master/index.js)

Run railway up.

```
$ railway up
```

## Require dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
npm install dotenv-vault-core --save
```

Require it as early as possible in your Node.js application.

```
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.

const http = require('http')
const PORT = process.env.PORT || 5000

const server = http.createServer((req, res) => {
  res.write(`Hello ${process.env.HELLO}`)
  res.end()
})

server.listen(PORT, () => {
  console.log(`Server running on ${PORT}`)
})
```

[example](https://github.com/dotenv-org/integration-example-vercel-nodejs/blob/master/index.js)

## Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## Set DOTENV_KEY

Visit your Railway Project's Environment Variables.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666066429/integrations-railway-nodejs_rwo40w.gif" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Railway.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
