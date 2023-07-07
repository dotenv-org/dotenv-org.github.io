---
layout: docs
section: "Language Guides"
title: "Deploy a Node.js App to Vercel"
description: Deploy a Node.js app with an encrypted .env.vault file to Vercel.
redirect_from:
  - /docs/integrations/vercel-nodejs
  - /integrations/vercel
  - /docs/integrations/vercel/nodejs
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/vercel" %}

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

Add `vercel.json` file.

##### vercel.json
```json
{
  "version": 2,
  "builds": [
    {
      "src": "index.js",
      "use": "@vercel/node"
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

Add `.vercelignore` file.

##### .vercelignore
```shell
.env*
.flaskenv*
!.env.project
!.env.vault
```

Commit that to code and deploy it to Vercel.

##### CLI
```shell
npx vercel@latest deploy --prod
```

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

Set `DOTENV_KEY` on Vercel using the CLI.

##### CLI
```shell
npx vercel@latest env add DOTENV_KEY

? What’s the value of DOTENV_KEY? dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
✅  Added Environment Variable DOTENV_KEY to Project nodejs-vercel [94ms]
```

Or use Vercel's UI.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/cloudinary/integrations-vercel-envs_y43bwi.gif" www="vercel.com" %}

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Hello production'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/hello-production.png" www="yourapp.vercel.app" %}

{% include docs/welldone.html %}
