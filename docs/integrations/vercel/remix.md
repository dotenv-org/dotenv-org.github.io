---
layout: docs
title: "Vercel with Remix - Integrations"
redirect_from:
  - /docs/integrations/vercel-remix
---

{% include helpers/reading_time.html %}

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/remix.html width="50" color="#000000" %}

##### Integrations

# Vercel with Remix

Learn how to configure Vercel with Dotenv Vault for a Remix application. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

You can find a complete [example repo here](https://github.com/dotenv-org/integration-example-vercel-remix).

## 1. Install & preload dotenv-vault

Install [dotenv-vault](https://github.com/dotenv-org/dotenv-vault)

```
$ npm install dotenv-vault --save
```

Preload dotenv-vault-core. This will inject environment variables ahead of Remix.

```
"scripts": {
  "build": "node -r dotenv-vault-core/config node_modules/.bin/remix build",
  config node_modules/.bin/remix dev"
},
```
[example](https://github.com/dotenv-org/integration-example-vercel-remix/blob/master/package.json)

## 2. Set up Remix ENV

Do the following for any endpoints that use environment variables.

* Require dotenv-vault-core
* Add a loader that exposes process.env as data

Here's a hello world example in the app/routes/index.tsx file.

```
import { json } from "@remix-run/node";
import { useLoaderData } from "@remix-run/react";

require('dotenv-vault-core').config()

export async function loader() {
  return json({
    ENV: {
      HELLO: process.env.HELLO, // HELLO="World" in .env file
    },
  });
}

export default function Index() {
  const data = useLoaderData()

  return (
    <h1>Hello {data.ENV.HELLO}</h1>
  );
}
```
[example](https://github.com/dotenv-org/integration-example-vercel-remix/blob/master/app/routes/index.tsx)

## 3. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## 5. Set DOTENV_KEY

Visit your Vercel Project > Settings > Environment Variables.

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666027615/integrations-vercel-envs_y43bwi.gif" %}

## 6. Commit and push

That's it!

Commit those changes safely to code and push to GitHub.

When the CI runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the CI environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
