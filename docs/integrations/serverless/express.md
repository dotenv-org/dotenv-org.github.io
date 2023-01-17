---
layout: docs
title: "Serverless with Express - Integrations"
redirect_from:
  - /docs/integrations/serverless-express
---

{% include icons/serverless.html width="50" color="#FD5750" %}
{% include icons/express.html width="50" color="#000000" %}

##### Integrations

# Serverless with Express

In this tutorial, learn how to integrate Dotenv Vault with Serverless.
This tutorial assumes you are already familiar with the [Serverless README](https://github.com/serverless/serverless).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-serverless-express).

## Install dotenv-vault

Create your local .env file.

```
HELLO="World"
```

Add [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core) to package.json.

```
$ npm install dotenv-vault-core --save
```

In handler.js, as early as possible, require dotenv-vault-core.

```
// handler.js
require("dotenv-vault-core").config()

const serverless = require("serverless-http");
const express = require("express");
const app = express();

app.get("/", (req, res, next) => {
  return res.status(200).json({
    message: `Hello ${process.env.HELLO}!`,
  });
});
```
[example](https://github.com/dotenv-org/integration-example-serverless-express/blob/master/handler.js)

Test that it is working by invoking your function locally.

```
$ serverless invoke local --function api
```

You will receive output like the following.

```
{
  "statusCode": 200,
  "headers": {
    "x-powered-by": "Express",
    "content-type": "application/json; charset=utf-8",
    "content-length": "26",
    "etag": "W/\"1a-iEQ9RXvkycqsT4vWvcdHrxZT8OE\""
  },
  "isBase64Encoded": false,
  "body": "{\"message\":\"Hello World!\"}"
}
```

Great! Next build the localized .env.vault file for deploy.

## Build .env.vault

Set a production value for when we deploy. I set it to HELLO=Production. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666258002/Screen_Shot_2022-10-20_at_2.54.46_PM_zgadob.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Deploy with DOTENV_KEY

Configure serverless.yml to inject the DOTENV_KEY.

IMPORTANT: Also add a package ignore pattern for your **.env.me** and **.env** files. You want serverless to only package your **.env.vault** file.

```
# serverless.yml
...
provider:
  name: aws
  runtime: nodejs14.x
  environment:
    DOTENV_KEY: ${param:DOTENV_KEY}

package:
  patterns:
    - '!.env*'
    - '.env.vault'
...
```
[example](https://github.com/dotenv-org/integration-example-serverless-express/blob/master/serverless.yml)

Run **npx dotenv-vault keys** to view your decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Deploy by setting DOTENV_KEY as a param.

```
serverless deploy --param "DOTENV_KEY=dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production"
```

Your app will say 'Hello Production'.

That's it! On deploy, Serverless will inject DOTENV_KEY as an environment variable. On function execution, your .env.vault will be decrypted and load the production environment variables to your serverless function.

If you run into a snag or have a question, reach out at [support@dotenv.org](mailto:support@dotenv.org).
