---
layout: docs
title: "Vercel with pnpm - Integrations"
---

{% include icons/vercel.html width="50" color="#000000" %}
{% include icons/pnpm.html width="50" color="#F69220" %}

# Vercel with pnpm

Are you receiving the following error when using pnpm and dotenv preloading?

```
/path/to/node_modules/.bin/react-native:2
basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
          ^^^^^^^

SyntaxError: missing ) after argument list
```

Pnpm has a [quirk](https://github.com/pnpm/pnpm/issues/4782) when it comes to [node preloading](https://glebbahmutov.com/blog/preloading-node-module/). 

This tutorial shows you how to get around that quirk (see step 3). Otherwise, it is the same as the [Vercel with NextJS tutorial](/docs/integrations/vercel/nextjs).

## 1. Install dotenv-vault-core

Install [dotenv-vault-core](https://github.com/dotenv-org/dotenv-vault-core).

```
$ pnpm install dotenv-vault-core
```

## 2. Preload dotenv-vault-core

Preload NextJS scripts using dotenv-vault-core. This will inject the environment variables ahead of NextJS.

```
"scripts": {
  "dev": "node -r dotenv-vault-core/config ./node_modules/.bin/next dev",
  "build": "node -r dotenv-vault-core/config ./node_modules/.bin/next build",
  "start": "node -r dotenv-vault-core/config ./node_modules/.bin/next start",
  "lint": "node -r dotenv-vault-core/config ./node_modules/.bin/next lint"
},
```
[example](https://github.com/dotenv-org/integration-example-vercel-nextjs/blob/master/package.json)

# 3. Add .npmrc

Here is the way to fix the quirk. Add a `.npmrc` file in the root of your project.

```
node-linker=hoisted
```

## 4. Run dotenv-vault build

Run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 5. Set DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Visit your Vercel Project > Settings > Environment Variables.

Set **DOTENV_KEY** to the value returned above.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/integrations-vercel-envs_y43bwi.gif" %}

## 6. Commit and push

That's it!

Commit those changes safely to code and push to Vercel.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/Screen_Shot_2022-11-11_at_8.28.40_AM_svdlil.png" %}
