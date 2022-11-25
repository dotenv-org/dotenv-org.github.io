---
layout: docs
title: "Cloud 66 with Node.js - Integrations"
redirect_from:
  - /docs/integrations/cloud66/nodejs
---

{% include helpers/reading_time.html %}

{% include icons/cloud66.html width="50" color="#3C72B9" %}
{% include icons/nodejs.html width="50" color="#000000" %}

##### Integrations

# __Cloud 66 with Node.js__

Learn how to make Cloud 66, Node.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create an `index.js` file, if you haven't done so already and process the environment variables in it and proceed with a standard Node.js `http-server` setup. Reference the module, indicate the port, and add some dynamic HTML with an environment variable to confirm it works beyond local.

##### Node.js
```js
// index.js
const PORT = process.env.PORT || 80
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
Remember to set an event listener running on the same port so your app knows when to serve its visitors. Commit that to code and push it to Cloud 66.

##### CLI
Once it is deployed, your app will say `'Hello undefined'` as it doesn't have a way to access the environment variable from the HTML yet. That is why the next step for you to take is to connect them dynamically.

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Reference the Vault package as early as possible in your `index.js` code to prevent possible conflicts.

##### Node.js
```js
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

With the `dotenv-vault-core` package successfully taken care of, move forward by installing the `pm2` package. `pm2` replaces the functionality of the default `http-server` Node.js module and will help your app run successfully on Cloud 66.

Cloud 66 uses Docker containers to build your web app with, so having a `Dockerfile` in your project's `root` folder is required for deployment by default. Create one, if you haven't done so already and make sure you have the `pm2` package installed within the container globally. Here's an example set up for Node.js:

##### Text
// Dockerfile
```plain
FROM node:12-alpine AS builder

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install
RUN npm install pm2 -g
COPY . .

EXPOSE 80
CMD ["pm2-runtime", "index.js"]
```

## Vault setup
Open your Vault project and insert the `HELLO` secret with value of your choice under `development` for local testing. For this tutorial it is `"user, your local test worked perfectly"` to complete the static text in the HTML. Once you are ready and confirmed you're logged in, sync your Dotenv Vault locally with `npx dotenv-vault pull`. Then, run locally for testing.

##### Shell
```shell
# .env
HELLO="user, your local test worked perfectly."
```

##### CLI
```shell
node index.js
{
  HELLO: 'user, your local test worked perfectly.'
}
Running on port 80
```

If you've set everything correctly, you will be faced with the message `"Hello user, your local test worked perfectly"` at [http://localhost:80](http://localhost:80).

## Build the Vault
Now that the local test is completed successfully, it is time for you to set a production value for when you deploy. Following the previous fashion, it is set to `HELLO="user, your production test worked perfectly."` Run `npx dotenv-vault open production` so you can start editing production values with the Vault interface.

##### CLI
```shell
npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584325/integrations/dotenv_vault_environment_variable_interface_production_nh0bop.png" %}

When you are done tinkering, pull the latest Vault version and build your encrypted local `.env.vault` file by running `npx dotenv-vault build`. Commit your `.env.vault` file to code without stress knowing it is both safe and necessary to do so, unlike `.env` files.

##### CLI
```shell
npx dotenv-vault build
```

## Set deployment

There is one last step to complete before you are ready - you must set the decryption `DOTENV_KEY` on Cloud 66. To do that, first fetch your Vault production key by running `npx dotenv-vault keys production`.

##### CLI
```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Copy over the key and jump to your Cloud 66 project and your app in particular. Click on the Settings button, select your Web Service Component, and then click Edit on the Environment Variables section. Add a new environment variable by setting `DOTENV_KEY` as key and your decryption key `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production` as value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669183074/integrations/dotenv_vault_cloud_66_environment_variable_settings_lfowyc.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Cloud 66.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `production` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Cloud 66 logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669183074/integrations/dotenv_vault_cloud_66_logs_encrypted_loading_env_vault_dixzj4.png" %}
