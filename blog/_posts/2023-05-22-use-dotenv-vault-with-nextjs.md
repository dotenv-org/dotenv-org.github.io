---
layout: blog
author: mot
title: "Use dotenv-vault with Vercel Edge"
image: "/assets/img/blog/blog-2.png"
excerpt: "Learn how to use encrypted .env.vault files with Vercel Edge"
---

A `.env.vault` file is a great way to deploy your secrets to multiple environments. In this blog post, we'll show you how to do so with Next.js and Vercel.

## Create your edge project

Let's call it **hello-edge**.

```shell
$ npx create-next-app@latest hello-edge --use-npm --example https://github.com/vercel/examples/tree/main/edge-functions/hello-world-next
```

## Set up .env

```shell
$ npm install dotenv@16.1.0-rc2 --save
```

Modify your scripts in `package.json`

```json
"scripts": {
  "dev": "node -r dotenv/config ./node_modules/.bin/next dev",
  "build": "node -r dotenv/config ./node_modules/.bin/next build",
  "start": "node -r dotenv/config ./node_modules/.bin/next start",
  "lint": "node -r dotenv/config ./node_modules/.bin/next lint"
},
```

Create a `.env` file in the root of the project.

```
# .env
NEXT_PUBLIC_EDGE_HELLO="Universe"
```

<div class="alert alert-info">ⓘ Note that the environment variable is prefaced with NEXT_PUBLIC_. Vercel's infrastructure requires this for injected secrets at build time.</div>

Replace `pages/api/location.js` with the following code.

```
// pages/api/location.js
export const config = {
  'runtime': 'edge'
};

export default function handler(req) {
  return Response.json({ location: process.env.NEXT_PUBLIC_EDGE_HELLO });
}
```

Run `npm run dev` and visit [localhost:3000](http://localhost:3000). You should see "Hello, Universe".

Great, now let's do the same with a `.env.vault` file.

## Set up .env.vault

Install [dotenv-vault](https://dotenv.org/install).

```
$ brew install dotenv-vault
```

Build your `.env.vault` file from your `.env` file.

```
$ dotenv-vault local build
```
<div class="alert alert-info">ⓘ Note that we are using the local commands here. You can also use the cloud commands by removing the local command. For example: dotenv-vault build</div>

## Run with DOTENV_KEY

That created a `.env.vault` file and `.env.keys` file. Commit `.env.vault` safely to code. Do NOT commit `.env.keys` to code.

Inspect your `.env.keys` and use the value to run your application with your `.env.vault` file. For example:

```
$ DOTENV_KEY="dotenv://:key_388c9837f8dac11aa5907e2f62e51838d1951cf0641b6e8690c7e1fdba8d7291@dotenv.local/vault/.env.vault?environment=development" npm run dev
```

Visit [localhost:3000](http://localhost:3000). It should still say "Hello, Universe" but now it is loading from your encrypted `.env.vault`.

## Set up production

Create `.env.production` file.

```
# .env.production
NEXT_PUBLIC_EDGE_HELLO="Production"
```

Rebuild your `.env.vault` file.

```
$ dotenv-vault local build
```

It contains production environment variables and there is a newly added key in `.env.keys`. Use it to run your application with production values. For example:

```
$ DOTENV_KEY="dotenv://:key_b07bc94b734b0ba32d2a9b387381094f6fc79cfe53a4148cebc3649898e27705@dotenv.local/vault/.env.vault?environment=production" npm run dev
```

Run `npm run dev` and visit [localhost:3000](http://localhost:3000). It should say "Hello, Production". Great!

## Deploy to Vercel

Now that we have a `.env.vault` file where we keep all our encrypted secrets, we only have to set up one environment variable on Vercel - the `DOTENV_KEY`.

Delete the following files. They were part of the template project we installed and won't be used here.

* `pnpm-lock.yaml`
* `turbo.json`
* `vercel.json`

Commit those changes and deploy your app to Vercel.

{% include helpers/screenshot.html url="/assets/img/blog/blog-2-vercel-configure.png" %}

You'll see your app build and load your environment variables from the encrypted `.env.vault` file.

{% include helpers/screenshot.html url="/assets/img/blog/blog-2-vercel-build-log.png" %}

That's it! Visit your app's url and you'll see Vercel successfully use your `.env.vault` environment variables in the edge runtime.

{% include helpers/screenshot.html url="/assets/img/blog/blog-2-vercel-web.png" %}


