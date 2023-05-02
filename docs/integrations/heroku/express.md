---
layout: docs
title: "Heroku with Express - Integrations"
---

{% include icons/heroku.html width="50" color="#430098" %}
{% include icons/express.html width="50" color="#000000" %}

# Heroku with Express

Learn how to make Heroku, Express, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-heroku-express).

## Deploy to Heroku

Add a Procfile to run your Express app.

```
web: node index.js
```

Your index.js file should look something like this.

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
```
[example](https://github.com/dotenv-org/integration-example-heroku-express/blob/master/index.js)

Commit that to code and push it to Heroku.

```
$ heroku create
$ git push heroku
```

Your app will say 'Hello undefined'.

Nice. Next, let's configure our environment variables using Dotenv Vault.

## Require dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ npm install dotenv-vault-core --save
```

Then require it as early as possible in your code.

```
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.

const PORT = process.env.PORT || 5000
const express = require('express')
const app = express()
...
```
[example](https://github.com/dotenv-org/integration-example-heroku-express/blob/master/index.js)

Create your .env file

```
# .env
HELLO="Development"
```

Test it is working locally.

```
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

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/Screen_Shot_2022-10-19_at_8.55.13_AM_ej1bk5.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code. It is safe and necessary to do so.

## Set DOTENV_KEY

Lastly, set the **DOTENV_KEY** on Heroku.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Visit your Heroku Project's Environment Variables under settings of your heroku application and set it.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/Screen_Shot_2022-10-19_at_4.01.32_PM_ibbdwq.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Heroku.

When the app boots, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You'll know things worked correctly if you see the message 'Loading env from encrypted .env.vault' in your heroku logs.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/Screen_Shot_2022-10-23_at_3.39.19_PM_pftocm.png" %}
