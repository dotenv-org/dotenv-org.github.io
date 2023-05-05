---
layout: docs
title: "Fly.io with Express - Integrations"
redirect_from:
  - /docs/integrations/fly-express
---

{% include icons/fly.html width="50" color="#7B3BE2" %}
{% include icons/express.html width="50" color="#000000" %}

# Fly.io with Express

In this tutorial, learn how to integrate Dotenv Vault with Fly.io and an Express application.

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-fly-express).

## Deploy to Fly.io

Deploy your Express app to fly.io.

```bash
flyctl launch
```

Here's an example of a simple Hello World Express app that runs on Fly.io.

```javascript
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
```
[example](https://github.com/dotenv-org/integration-example-fly-express/blob/master/index.js)

That will deploy your Express app to Fly's infrastructure.

## Install dotenv-vault

Create your local `.env` file.

```
HELLO="Development"
```

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```bash
$ npm install dotenv-vault-core --save
```

Require it as early as possible in your Express application.

```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.

const PORT = process.env.PORT || 5000
const express = require('express')
const app = express()
...
```
[example](https://github.com/dotenv-org/integration-example-fly-express/blob/master/index.js)

Test that it is working locally.

```bash
$ node index.js
{
  HELLO: 'Development'
}
Running on port 5000
```

It says **Hello Development** at [http://localhost:5000](http://localhost:5000).

## Build .env.vault

First set a production value for when we deploy. I set it to **HELLO=Production**. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-19_at_8.55.13_AM_ej1bk5.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Set DOTENV_KEY

Lastly, set the **DOTENV_KEY** on Fly.io.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set it on Fly.io.

```
$ flyctl secrets set NODE_ENV=production DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production'
```

WARNING: The single apostrophe is important. Otherwise, Fly.io will truncate the DOTENV_KEY incorrectly and decryption will not work.

That's it!

Commit your changes to code and run:

```
$ flyctl deploy
```

When the deploy runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to Fly.io. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
