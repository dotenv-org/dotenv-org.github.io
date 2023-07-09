---
layout: docs
title: "CI/CD in Node.js with GitHub Actions"
description: Run Node.js CI/CD in GitHub Actions with an encrypted .env.vault file
redirect_from:
  - /docs/integrations/github/actions-nodejs
  - /docs/integrations/github-actions/nodejs
---

{% include docs/headsup.html %}
{% include docs/example_link.html url="https://github.com/dotenv-org/examples/tree/master/nodejs/github-actions" %}

## Initial setup

Create a `build.js` file. It's a very simple build script that outputs 'Hello World'.

##### build.js
```js
// build.js
console.log(`Hello ${process.env.HELLO}`)
```

Create a `package.json` file.

##### package.json
```json
{
  "scripts": {
    "build": "node build.js"
  }
}
```

Create a `.github/workflows/ci.yml` file.

##### .github/workflows/ci.yml
```yml
{% raw %}# .github/workflows/ci.yml
name: npm run build
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-node@v3
      with:
        node-version: 16
    - run: npm install
    - run: npm run build
      env:
        DOTENV_KEY: ${{ secrets.DOTENV_KEY }}{% endraw %}
```

Commit that to code and push to GitHub.

Once pushed, the GitHub actions build will say `'Hello undefined'` as it doesn't have a way to access the environment variable yet. Let's do that next.

##### GitHub Actions
{% include helpers/screenshot_browser.html url="/assets/img/docs/github-actions-hello-undefined.png" www="github.com/you/app/actions" %}

{% include docs/step_install_dotenv_for_ci.md %}
{% include docs/step_build_env_vault_for_ci.md %}

## Set DOTENV_KEY

Fetch your CI `DOTENV_KEY`.

##### CLI
```shell
npx dotenv-vault@latest keys ci
# outputs: dotenv://:key_4567@dotenv.org/vault/.env.vault?environment=ci
```

Set `DOTENV_KEY` on GitHub Actions.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/docs/github-actions-config-vars.png" %}

## Build CI

Commit those changes safely to code and re-run the build.

That's it! On re-run, your `.env.vault` file will be decrypted and its CI secrets injected as environment variables – just in time.

You'll know things worked correctly when you see `'Loading env from encrypted .env.vault'` in your logs. If a `DOTENV_KEY` is not set (for example when developing on your local machine) it will fall back to standard [dotenv](https://github.com/motdotla/dotenv) functionality.

{% include helpers/screenshot_browser.html url="/assets/img/docs/github-actions-logs-vault.png" www="github actions build" %}

{% include docs/welldone_ci.html %}
