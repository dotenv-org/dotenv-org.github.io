---
layout: docs
section: "Language Guides"
title: "Deploy a Node.js App to Render"
description: Deploy a Node.js app with an encrypted .env.vault file to Render.
redirect_from:
  - /docs/integrations/render/express
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/render" %}

## Initial setup

Create an `index.js` file, if you haven't already done so.

##### index.js
```js
// index.js
const PORT = process.env.PORT || 3000
const http = require('http')
const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.setHeader('Content-Type', 'text/plain')
  res.end(`Hello ${process.env.HELLO}`)
})

server.listen(PORT, () => {
  console.log(`Server running on port:${PORT}/`)
})
```

Create a `package.json` file.

##### package.json
```json
{
  "scripts": {
    "start": "node index.js"
  }
}
```

Commit that to code and deploy to Render.

<div class="alert alert-warning">
  <strong>Fork in the road!</strong> Deploying to Render takes more steps than we want to document here. Follow their <a href="https://render.com/docs/deploy-node-express-app">guide to deploying a Node.js Express app to Render</a> and then return to this page.
</div>

##### Browser
{% include helpers/screenshot_browser.html url="/assets/img/docs/hello-undefined.png" www="yourapp.onrender.com" %}

Once deployed, your app will say `'Hello undefined'` as it doesn't have a way to access the environment variable yet. Let's do that next.

{% include docs/step_install_dotenv.md %}
{% include docs/step_build_env_vault.md %}

## Set DOTENV_KEY

Fetch your production `DOTENV_KEY`.

##### CLI
```shell
npx dotenv-vault@latest keys production
# outputs: dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set `DOTENV_KEY` on Render.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/docs/render-config-vars.png" %}

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/render-logs-vault.png" www="render logs" %}

{% include docs/welldone.html %}
