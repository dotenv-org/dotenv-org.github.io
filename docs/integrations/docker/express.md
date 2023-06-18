---
layout: docs
title: "Docker with Express - Integrations"
redirect_from:
  - /docs/integrations/docker-express
---

{% include icons/docker.html width="50" color="#2496ED" %}
{% include icons/express.html width="50" color="#000000" %}

# Docker with Express

In this tutorial, learn how to integrate Dotenv Vault with Docker and an Express application.

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-docker-express).

## Dockerfile

Create your Dockerfile

```
# Dockerfile
FROM node:16
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD node index.js
```
[example](https://github.com/dotenv-org/integration-example-docker-express/blob/master/Dockerfile)

And create your Express app.

```
$ npm install express --save
```

```
// index.js
const PORT = process.env.PORT || 8080
const express = require('express')
const app = express()

app.listen(PORT, () => {
  console.log(`Running on port ${PORT}.`)
})

app.get('/', (req, res) => {
  res.send(`Hello ${process.env.HELLO}`)
})
```
[example](https://github.com/dotenv-org/integration-example-docker-express/blob/master/index.js)

Build and run it.

## Install dotenv-vault

Create your local `.env` file.

```
HELLO="Development"
```

Then install [dotenv](https://github.com/motdotla/dotenv).

```
$ npm install dotenv --save
```

Require it as early as possible in your Express application.

```
// index.js
require('dotenv').config()
console.log(process.env) // for debugging purposes. remove when ready.

const PORT = process.env.PORT || 8080
const express = require('express')
const app = express()
...
```

[example](https://github.com/dotenv-org/integration-example-docker-express/blob/master/index.js)

Test that it is working locally.

```
$ docker build -t docker-express . && docker run --rm -it -p 8080:8080 --init docker-express
Running on port 8080
```

It says **Hello Development** at [http://localhost:8080](http://localhost:8080).

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

Lastly, set the **DOTENV_KEY** on the docker run command.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set it for Docker run. The important part here is the `-e` flag.

```
$ docker build -t docker-express . && docker run -e DOTENV_KEY="dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production" --rm -it -p 8080:8080 --init docker-express
[dotenv@16.1.0][INFO] Loading env from encrypted .env.vault
Running on port 8080
```

That's it!

Commit your changes to code and deploy your Docker image to your infrastructure.

When Docker runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to your node process inside of Docker. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

It worked if you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-19_at_10.14.18_AM_zsnosk.png" %}
