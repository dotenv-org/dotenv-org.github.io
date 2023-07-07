---
layout: docs
section: "Language Guides"
title: "Deploy a Node.js App to Netlify"
description: Deploy a Node.js app with an encrypted .env.vault file to Netlify.
redirect_from:
  - /integrations/netlify
  - docs/integrations/netlify/nodejs
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/netlify" %}

## Initial setup

Generate a **next.js** application (or the front-end framework of your choice).

##### CLI
```shell
npx create-next-app@latest --example hello-world .
```

This will create a handful of files.

##### CLI
```shell
ls -1
README.md
next-env.d.ts
node_modules
package-lock.json
package.json
pages
tsconfig.json
```

Edit `pages/index.tsx` to include `process.env.NEXT_PUBLIC_HELLO`.

##### pages/index.tsx
```js
export default function IndexPage() {
  return (
    <div>
      Hello {process.env.NEXT_PUBLIC_HELLO}.
    </div>
  )
}
```

Add `netlify.toml`.

##### netlify.toml
```yaml
[build]
  command = "npm run build"
  publish = ".next"
```

Commit that to code and deploy it to Netlify.

##### CLI
```shell
npx netlify-cli@latest deploy --build --prod
```

Once deployed, your app will say `'Hello .'` as it doesn't have a way to access the environment variable yet. Let's do that next.

{% include docs/step_install_dotenv_for_nextjs.md %}
{% include docs/step_build_env_vault_for_nextjs.md %}

## Set DOTENV_KEY

Fetch your production `DOTENV_KEY`.

##### CLI
```shell
npx dotenv-vault@latest keys production
# outputs: dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set `DOTENV_KEY` on Netlify using the CLI.

##### CLI
```shell
npx netlify-cli@latest env:set DOTENV_KEY "dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production"
```

Or use Netlify's UI.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/docs/netlify-config-vars.png" %}

## Deploy

Commit those changes safely to code and deploy.

That's it! On deploy, your `.env.vault` file will be decrypted and its production secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/netlify-logs-vault.png" www="npx netlify-cli@latest deploy --build --prod" %}

{% include docs/welldone.html %}
