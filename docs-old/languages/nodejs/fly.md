---
layout: docs
section: "Language Guides"
title: "Deploy a Node.js App to Fly.io"
description: Deploy a Node.js app with an encrypted .env.vault file to Fly.io.
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/fly" %}

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

Commit that to code and deploy it to Fly.

##### CLI
```shell
brew install flyctl
flyctl launch
flyctl deploy --remote-only --no-cache
```

<div class="alert alert-danger">
  <p><strong>Fly.io bug:</strong> While writing this guide we ran into the error "failed to fetch an image or build from source: error building: ... node:20.4.0-slim: docker.io/library/node:20.4.0-slim: not found".</p>
  <hr>
  <p class="mb-0">If you also experience this set <strong>NODE_VERSION=18.16.1</strong> in your Dockerfile and redeploy.</p>
</div>


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

Set `DOTENV_KEY` on Fly.io.

##### CLI
```shell
flyctl secrets set NODE_ENV=production DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production'
```

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/fly-logs-vault.png" www="flyctl logs" %}

{% include docs/welldone.html %}
