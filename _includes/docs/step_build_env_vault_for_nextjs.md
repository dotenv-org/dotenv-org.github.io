## Build .env.vault

Push your latest `.env` file changes and edit your production secrets. [Learn more about syncing](/docs/tutorials/sync)

##### CLI
```shell
npx dotenv-vault@latest push
npx dotenv-vault@latest open production
```

Use the UI to configure those secrets per environment.

##### UI
{% include helpers/screenshot_browser.html url="/assets/img/docs/nextjs-edit-production-value.gif" www="dotenv.org" %}

Then build your encrypted `.env.vault` file.

##### CLI
```shell
npx dotenv-vault@latest build
```

Its contents should look something like this.

##### .env.vault
```shell
#/-------------------.env.vault---------------------/
#/         cloud-agnostic vaulting standard         /
#/   [how it works](https://dotenv.org/env-vault)   /
#/--------------------------------------------------/

# development
DOTENV_VAULT_DEVELOPMENT="/HqNgQWsf6Oh6XB9pI/CGkdgCe6d4/vWZHgP50RRoDTzkzPQk/xOaQs="
DOTENV_VAULT_DEVELOPMENT_VERSION=2

# production
DOTENV_VAULT_PRODUCTION="x26PuIKQ/xZ5eKrYomKngM+dO/9v1vxhwslE/zjHdg3l+H6q6PheB5GVDVIbZg=="
DOTENV_VAULT_PRODUCTION_VERSION=2
```
