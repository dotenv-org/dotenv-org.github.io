---
layout: docs
title: "Digital Ocean with Node.js - Integrations"
---

{% include icons/digital-ocean.html width="50" color="#0080FF" %}
{% include icons/nodejs.html width="50" color="#000000" %}

##### Integrations

# __Digital Ocean with Node.js__

Learn how to make Digital Ocean, Node.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-digital-ocean-nodejs).

## Initial setup
Create an `index.js` file, if you haven't done so already and process the environment variables in it and proceed with a standard Node.js `http-server` setup. Reference the module, indicate the port, and add some dynamic HTML with an environment variable to confirm it works beyond local.

##### Node.js
```js
// index.js
const PORT = process.env.PORT || 8080
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
[Example](https://github.com/dotenv-org/integration-example-digital-ocean-nodejs/blob/main/index.js).

Remember to set an event listener running on the same port so your app knows when to serve its visitors. Commit that to code and push it to Digital Ocean.

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
[Example](https://github.com/dotenv-org/integration-example-digital-ocean-nodejs/blob/main/index.js).

With the `dotenv-vault-core` package successfully taken care of, move forward by installing the `pm2` package. `pm2` replaces the functionality of the default `http-server` Node.js module and will help your app run successfully on Digital Ocean.

Don't forget to call `pm2` in your `package.json` file to run the `index.js` app by entering `pm2 start index.js` as your build command.

##### JSON
```json
// package.json
"scripts": {
  "build": "pm2 start index.js"
}
```
[Example](https://github.com/dotenv-org/integration-example-digital-ocean-nodejs/blob/main/package.json).

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
Running on port 8080
```

If you've set everything correctly, you will be faced with the message `"Hello user, your local test worked perfectly"` at [http://localhost:8080](http://localhost:8080).

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

There is one last step to complete before you are ready - you must set the decryption `DOTENV_KEY` on Digital Ocean. To do that, first fetch your Vault production key by running `npx dotenv-vault keys production`.

##### CLI
```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Copy over the key and jump to your Digital Ocean project and your app in particular. Click on the Settings button, select your Web Service Component, and then click Edit on the Environment Variables section. Add a new environment variable by setting `DOTENV_KEY` as key and your decryption key `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production` as value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669184312/integrations/dotenv_vault_digital_ocean_environment_variable_settings_mpklsx.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Digital Ocean.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `production` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Digital Ocean logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1669184312/integrations/dotenv_vault_digital_ocean_logs_encrypted_loading_env_vault_qcx4yp.png" %}
