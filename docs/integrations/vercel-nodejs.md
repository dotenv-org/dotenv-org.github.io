---
layout: docs
title: "Vercel with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

##### Integrations

# Vercel with Node.js

Learn how to make Vercel, Node.js, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

## 1. Set up Node.js for Vercel

Set up your Node.js app to work with Vercel. Add `module.exports = app` to index.js.

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

Add `vercel.json` file.

```
{
  "version": 2,
  "builds": [
    {
      "src": "index.js",
      "use": "@now/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "index.js"
    }
  ]
}
```

## 2. Require dotenv-vault-core

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

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## 5. Set DOTENV_KEY

Visit your Vercel Project > Settings > Environment Variables.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666027615/integrations-vercel-envs_y43bwi.gif" %}

## 6. Commit and push

That's it! 

Commit those changes safely to code and push to GitHub.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
