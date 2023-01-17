---
layout: docs
title: "Northflank with Node.js - Integrations"
---

{% include icons/northflank.html width="50" color="#01e3c5" %}
{% include icons/nodejs.html width="50" color="#339933" %}

# __Northflank with Node.js__

Learn how to make Northflank, Node.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-northflank-nodejs).

## Initial setup
For a `Docker` build type, create a `Dockerfile` in the `root` folder to set your Northflank project settings.

Add the following segment to run the `build` script in your `package.json` and expose port 80, which will be needed later.

##### Text
```plain
// Dockerfile
FROM node:12-alpine AS builder

COPY package.json  .
RUN npm install

COPY . .

EXPOSE 80
CMD [ "npm", "run", "build" ]

```
[Example](https://github.com/dotenv-org/integration-example-northflank-nodejs/blob/master/Dockerfile).


If you are using a buildpack like Heroku for example instead of the default `Docker`, you can refer to [the Heroku integration guide](/docs/integrations/heroku/nodejs) for `Procfile` settings.

Create an `index.js` file, if you haven't done so already. Process the environment variables in it and proceed with a standard Node.js `http-server` setup.

Reference the module, indicate the port, and add some dynamic HTML with an environment variable to confirm it works beyond local.

##### Node.js
```js
// index.js
const PORT = process.env.PORT || 80
const http = require('http')
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end(`Hello ${process.env.HELLO}`);
});

server.listen(PORT, () => {
  console.log(`Server running on port:${PORT}/`);
});
```
[Example](https://github.com/dotenv-org/integration-example-northflank-nodejs/blob/master/index.js).

Remember to set an event listener running on the same port so your app knows when to serve its visitors. Commit that to code and push it to Northflank.

Once it is deployed, your app will say `'Hello undefined'` as it doesn't have a way to access the environment variable from the HTML yet.

That is why the next step for you to take is to connect them dynamically.

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
[Example](https://github.com/dotenv-org/integration-example-northflank-nodejs/blob/master/index.js).

## Vault setup
Open your Vault project and insert the `HELLO` secret with value of your choice under `development` for local testing.

For this tutorial it is `"user, your local test worked perfectly"` to complete the static text in the HTML.

Once you are ready and confirmed you're logged in, sync your Dotenv Vault locally with `npx dotenv-vault pull`. Then, run locally for testing.

##### Shell
```shell
# .env
HELLO="user, your local test worked perfectly."
```

##### Node.js
```Java
node index.js
{
  HELLO: 'user, your local test worked perfectly.'
}
Running on port 80
```

If you've set everything correctly, you will be faced with the message `"Hello user, your local test worked perfectly"` at [http://localhost:80](http://localhost:80).

## Build the Vault
Now that the local test is completed successfully, it is time for you to set a production value for when you deploy.

Following the previous fashion, it is set to `HELLO="user, your production test worked perfectly."`

Run `npx dotenv-vault open production` so you can start editing production values with the Vault interface.

##### CLI
```Java
npx dotenv-vault open production
```
{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584325/integrations/dotenv_vault_environment_variable_interface_production_nh0bop.png" %}

When you are done tinkering, pull the latest Vault version and build your encrypted local `.env.vault` file by running `npx dotenv-vault build`.

Commit your `.env.vault` file to code without stress knowing it is both safe and necessary to do so, unlike `.env` files.

##### CLI
```shell
npx dotenv-vault build
```

## Set deployment

There is one last step to complete before you are ready - you must set the decryption `DOTENV_KEY` on Northflank.

To do that, first fetch your Vault production key by running `npx dotenv-vault keys production`.

##### CLI
```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Copy over the key and jump to your Northflank project. Hop on to the Settings panel and then set `DOTENV_KEY` as key and your decryption key as value `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production` as value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_northflank_environment_variable_settings_mrfduj.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Northflank.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `production` environment variables to `ENV`.

If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Northflank logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668584031/integrations/dotenv_vault_northflank_logs_encrypted_loading_env_vault_rrmyjv.png" %}
---
