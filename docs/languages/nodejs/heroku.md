---
layout: docs
section: "Language Guides"
title: "Deploy a Node.js App to Heroku"
description: Deploy a Node.js app with an encrypted .env.vault file to Heroku.
redirect_from:
  - /docs/integrations/heroku/nodejs
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/heroku" %}

## Initial setup

Add a `Procfile` to run your Node.js app.

##### Procfile
```yaml
web: node index.js
```

Your `index.js` file should look something like this.

##### index.js
```js
// index.js
const PORT = process.env.PORT || 3000
const http = require('http')
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`Hello ${process.env.HELLO}`)
});

server.listen(PORT, () => {
  console.log(`Server running on port:${PORT}/`);
});
```

Commit that to code and push it to Heroku.

##### CLI

```shell
heroku create
git push heroku
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

Set `DOTENV_KEY` on Heroku using the CLI.

##### CLI
```shell
heroku config:set DOTENV_KEY=dotenv://:key_1234…@dotenv.org/vault/.env.vault?environment=production
```

Or use Heroku's UI.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/docs/heroku-config-vars.png" www="heroku.com" %}

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/heroku-logs-vault.png" www="heroku logs --tail" %}

{% include docs/welldone.html %}
