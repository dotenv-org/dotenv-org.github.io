---
layout: docs
section: "Language Guides"
title: "Build a Node.js App with Docker"
description: Build a Node.js app with an encrypted .env.vault file on Docker.
redirect_from:
  - /docs/integrations/docker-express
  - /docs/integrations/docker/express
---

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

Add `package.json` file.

##### package.json
```js
{
  "scripts": {
    "start": "node index.js"
  }
}
```

Add a `Dockerfile`.

##### Dockerfile
```shell
# Dockerfile
FROM node:16
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD node index.js
```

Commit that to code and build it locally with Docker.

##### CLI
```shell
docker build -t docker-nodejs . && docker run --rm -it -p 3000:3000 --init docker-nodejs
```

##### Browser
{% include helpers/screenshot_browser.html url="/assets/img/docs/hello-undefined.png" www="yourapp.com on digital ocean" %}

Once built, your app will say `'Hello undefined'` at [localhost:3000](http://localhost:3000) as it doesn’t have a way to access the environment variable yet. Let’s do that next.

{% include docs/step_install_dotenv_for_docker.md %}
{% include docs/step_build_env_vault.md %}

## Set DOTENV_KEY

Fetch your production `DOTENV_KEY`.

##### CLI
```shell
npx dotenv-vault@latest keys production
# outputs: dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set `DOTENV_KEY` for Docker run.

##### CLI
```shell
docker build -t docker-nodejs . && docker run -e DOTENV_KEY="dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production" --rm -it -p 3000:3000 --init docker-nodejs
```
<div class="alert alert-info" role="alert">
The important part here is the `-e` flag. <a href="https://docs.docker.com/engine/reference/run/#env-environment-variables">See docker environment variables</a> for more information.
</div>

## Run Docker

Commit those changes safely to code and run on Docker.

That's it! On build and run, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/docker-logs-vault.png" www="docker build -t && docker run -e" %}

{% include docs/welldone.html %}
