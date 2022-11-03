---
layout: docs
title: "Heroku with Node.js - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/heroku.html width="50" color="#430098" %}
{% include icons/nodejs.html width="50" color="#000000" %}



# __Heroku with Node.js__
##### `Integrations`
Learn how to make Heroku, Node.js, and Dotenv Vault work together in a simple web app. This tutorial assumes you are already familiar with `.env` files and know [how to sync them](/docs/tutorials/sync).

## Initial setup
Create a `Procfile` in the `root` folder to set your Heroku project settings. Add the `web` key, followed by the start command of your Node.js application as value.

##### Yaml
```Java
web: npm run build
```
Create an `index.js` file, if you haven't done so already. Process the environment variables in it and proceed with a standard Node.js `http-server` setup. Reference the module, indicate the port, and add some dynamic HTML with an environment variable to confirm it works beyond local.

##### Node.js
```Java
// index.js
const PORT = process.env.PORT || 5000
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
Remember to set an event listener running on the same port so your app knows when to serve its visitors. Commit that to code and push it to Heroku.

##### CLI

```shell
heroku create
git push heroku
```

Once it is deployed, your app will say `'Hello undefined'` as it doesn't have a way to access the environment variable from the HTML yet. That is why the next step for you to take is to connect them dynamically.

## Package installation
Start by installing the [`dotenv-vault-core`](https://github.com/dotenv-org/dotenv-vault-core) package with `npm`.

##### CLI
```shell
npm install dotenv-vault-core --save
```

Reference the Vault package as early as possible in your `index.js` code to prevent possible conflicts.

##### Node.js
```Java
// index.js
require('dotenv-vault-core').config()
console.log(process.env) // for debugging purposes. remove when ready.
```

## Vault setup
Open your Vault project and insert the `HELLO` secret with value of your choice under `development` for local testing. For this tutorial it is `"user, your local test worked perfectly"` to complete the static text in the HTML. Once you are ready and confirmed you're logged in, sync your Dotenv Vault locally with `npx dotenv-vault pull`. Then, run locally for testing.

#### Shell
```shell
# .env
HELLO="user, your local test worked perfectly."
```


#### Node.js
```Java
node index.js
{
  HELLO: 'user, your local test worked perfectly.'
}
Running on port 5000
```

If you've set everything correctly, you will be faced with the message `"Hello user, your local test worked perfectly"` at [http://localhost:5000](http://localhost:5000).

## Build the Vault
Now that the local test is completed successfully, it is time for you to set a production value for when you deploy. Following the previous fashion, it is set to `HELLO="user, your production test worked perfectly."` Run `npx dotenv-vault open production` so you can start editing production values with the Vault interface.

#### CLI
```Java
npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666834899/dotenv_heroku_nodejs_vault_interface_production_mmdewz.png" %}

When you are done tinkering, pull the latest Vault version and build your encrypted local `.env.vault` file by running `npx dotenv-vault build`. Commit your `.env.vault` file to code without stress knowing it is both safe and necessary to do so, unlike `.env` files.

#### CLI
```shell
npx dotenv-vault build
```

## Set deployment

There is one last step to complete before you are ready - you must set the decryption `DOTENV_KEY` on Heroku. To do that, first fetch your Vault production key by running `npx dotenv-vault keys production`.

#### CLI
```shell
npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Copy over the key and jump to your Heroku project. Hop on to the Settings panel and then set `DOTENV_KEY` as key and your decryption key as value `dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production` as value.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666835672/dotenv_heroku_project_nodejs_config_vars_grk9c5.png" %}

## Commit and push

That's it!

Commit those changes safely to code and deploy to Heroku.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the `production` environment variables to `ENV`. If a `DOTENV_KEY` is not set when developing on local machine, for example, it will fall back to standard Dotenv functionality.

You'll know things worked correctly when you see `'Loading .env from encrypted .env.vault'` in your Heroku logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666955581/dotenv_heroku_logs_encrypted_loading_env_gphwdu.png" %}
