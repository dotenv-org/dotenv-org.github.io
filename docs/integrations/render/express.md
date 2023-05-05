---
layout: docs
title: "Render with Express - Integrations"
---

{% include icons/render.html width="50" color="#46E3B7" %}
{% include icons/express.html width="50" color="#000000" %}

# Render with Express

In this tutorial, learn how to integrate Dotenv Vault with Render. This tutorial assumes you are familiar with Render or have gone through [one of their tutorials](https://render.com/docs/deploy-node-express-app).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-render-express).

## Install dotenv-vault

Create your local `.env` file.

```
HELLO="World"
```

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ npm install dotenv-vault-core --save
```

Require it as early as possible in your Express application.

```
// app.js
require('dotenv-vault-core').config();
console.log(process.env) // for debugging purposes. remove when ready.

const express = require("express");
...
```
[example](https://github.com/dotenv-org/integration-example-render-express/blob/master/app.js)

Output **process.env.HELLO** in the html.

```
// app.js
...
  <body>
    <section>
      Hello ${process.env.HELLO}!
    </section>
  </body>
  ...
```
[example](https://github.com/dotenv-org/integration-example-render-express/blob/master/app.js)

Test that it is working locally.

```
$ node app.js
{
  HELLO: 'World'
}
Example app listening on port 3001!
```

{% include helpers/screenshot.html url="/assets/img/cloudinary/screely-1666468252631_nzhntw.png" %}

Next, we need to build our encrypted .env.vault file.

## Build .env.vault

First set a production value. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-22_at_12.54.00_PM_drxdvn.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Safely commit your .env.vault file to code.

## Set DOTENV_KEY

Lastly, set the DOTENV_KEY on Render.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Then in Render click Project Settings > Environment > Add Environment Variable.

{% include helpers/screenshot.html url="/assets/img/cloudinary/screely-1666469242648_bdrnzn.png" %}

Enter your DOTENV_KEY and save changes.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-22_at_1.09.50_PM_r4nhpl.png" %}

That’s it!

Commit your changes to code and push.

When the build runs, it will recognize the DOTENV_KEY, decrypt the .env.vault file, and load the production environment variables to Render. If a DOTENV_KEY is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-22_at_1.26.32_PM_qpt22h.png" %}
