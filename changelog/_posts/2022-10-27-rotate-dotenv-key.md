---
layout: changelog
author: mot
title: "Rotate DOTENV_KEY - Changelog"
---

Rotate your <strong>DOTENV_KEY</strong> with the following command:

```
$ npx dotenv-vault rotatekey production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666888594/rotatekeys_duop0c.gif" %}

Then set <strong>DOTENV_KEY2</strong> on your server, rebuild your .env.vault file, and deploy. Once deployed assign DOTENV_KEY2 to DOTENV_KEY and delete DOTENV_KEY. Nice work, you just made a zero-downtime key rotation.

[See docs](/docs/dotenv-vault/rotatekey) for more information. Supported for [NodeJS](https://github.com/dotenv-org/dotenv-vault-core) library. [Ruby](https://github.com/dotenv-org/dotenv-vault-ruby) and [Python](https://github.com/dotenv-org/dotenv-vault-python) support coming soon.
