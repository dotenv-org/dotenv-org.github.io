---
layout: docs
section: "Integration Guides"
title: "Heroku with NodeJS"
description: Deploy a NodeJS app to Heroku. Use an encrypted .env.vault file to secure and deploy your secrets to Heroku.
---

<div class="alert alert-info">ⓘ This guide assumes you are already familiar with <a href="https://github.com/motdotla/dotenv">dotenv</a> and have <a href="/docs/tutorials/sync">synced your secrets</a> with <a href="https://github.com/dotenv-org/dotenv-vault">dotenv-vault</a>.</div>

You can find a complete [example here](https://github.com/dotenv-org/examples/tree/master/heroku-nodejs).

## Initial setup

Add a `Procfile` to run your NodeJS app.

##### Procfile
```yaml
web: node index.js
```
[Example](https://github.com/dotenv-org/examples/blob/master/heroku-nodejs/Procfile)

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
[Example](https://github.com/dotenv-org/examples/blob/master/heroku-nodejs/index.js)

Commit that to code and push it to Heroku.

##### CLI

```shell
heroku create
git push heroku
```

Once deployed, your app will say `'Hello undefined'` as it doesn't have a way to access the environment variable yet. Let's do that next.

## Install dotenv

Install [`dotenv`](https://github.com/motdotla/dotenv).

##### CLI
```shell
npm install dotenv --save
```

Create a `.env` file in the root of your project.

##### .env
```shell
# .env
HELLO="World"
```

As early as possible in your application, import and configure dotenv.

##### index.js
```js
// index.js
require('dotenv').config()
console.log(process.env) // remove this after you've confirmed it is working

const PORT = process.env.PORT || 3000
const http = require('http')
...
```
[Example](https://github.com/dotenv-org/examples/blob/master/heroku-nodejs/index.js#L2)

Try running it locally.

##### CLI
```shell
node index.js
{
  ...
  HELLO: 'World'
}
Server running on port:3000/
```

Perfect. `process.env` now has the keys and values you defined in your `.env` file.

That covers local development. Let's solve for Heroku production next.

## Build .env.vault

Push your latest `.env` file changes and edit your production secrets. [Learn more](/docs/tutorials/sync)

##### CLI
```shell
npx dotenv-vault@latest push
npx dotenv-vault@latest open production
```

Use the UI to configure those secrets per environment.

##### UI
{% include helpers/screenshot.html url="/assets/img/docs/edit-production-value.gif" %}

Then build your encrypted `.env.vault` file.

##### CLI
```shell
npx dotenv-vault@latest build
```

Its contents should look something like this.

##### .env.vault
```shell
#/-------------------.env.vault---------------------/
#/         cloud-agnostic vaulting standard         /
#/   [how it works](https://dotenv.org/env-vault)   /
#/--------------------------------------------------/

# development
DOTENV_VAULT_DEVELOPMENT="/HqNgQWsf6Oh6XB9pI/CGkdgCe6d4/vWZHgP50RRoDTzkzPQk/xOaQs="
DOTENV_VAULT_DEVELOPMENT_VERSION=2

# production
DOTENV_VAULT_PRODUCTION="x26PuIKQ/xZ5eKrYomKngM+dO/9v1vxhwslE/zjHdg3l+H6q6PheB5GVDVIbZg=="
DOTENV_VAULT_PRODUCTION_VERSION=2
```

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
{% include helpers/screenshot.html url="/assets/img/cloudinary/dotenv_vault_heroku_environment_variable_settings_sk6fkj.png" %}

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs.

{% include helpers/screenshot.html url="/assets/img/cloudinary/dotenv_vault_heroku_logs_encrypted_loading_env_vault_qbwich.png" %}

Additional Note: If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

