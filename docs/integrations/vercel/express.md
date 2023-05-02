---
layout: docs
title: "Vercel with Express - Integrations"
redirect_from:
  - /docs/integrations/vercel-express
  - /docs/how-to/use-dotenv-with-express
  - /docs/how-to/use-dotenv-and-dotenv-vault-with-express
  - /docs/how-to/use-dotenv-and-dotenv-vault-with-express-and-your-team
  - /docs/how-to/use-dotenv-and-dotenv-vault-with-express-and-docker
---

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/express.html width="50" color="#000000" %}

# Vercel with Express

Learn how to make Vercel, Express, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-vercel-express).

## 1. Set up Express for Vercel

Set up your Express app to work with Vercel. Add `module.exports = app` to index.js.

```
// index.js
const PORT = process.env.PORT || 5000
const express = require('express')
const app = express()

app.listen(PORT, () => {
  console.log(`Running on port ${PORT}.`)
})

app.get('/', (req, res) => {
  res.send(`Hello ${process.env.HELLO}`)
})

// Export the Express API for Vercel
module.exports = app
```
[example](https://github.com/dotenv-org/integration-example-vercel-express/blob/master/index.js)

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

Require it as early as possible in your Express application.

```
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.

const PORT = process.env.PORT || 5000
const express = require('express')
const app = express()
...
```

[example](https://github.com/dotenv-org/integration-example-vercel-express/blob/master/index.js)

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

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/integrations-vercel-envs_y43bwi.gif" %}

## 6. Commit and push

That's it!

Commit those changes safely to code and push to GitHub.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
