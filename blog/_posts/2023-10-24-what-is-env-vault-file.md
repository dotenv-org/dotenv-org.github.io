---
layout: blog
author: mot
title: "What is a .env.vault file"
image: "/assets/img/blog/what-is-env-vault.png"
excerpt: "A .env.vault file is an encrypted copy of your .env files."
published: true
---

It's an encrypted copy of your `.env` files.

It' easiest to understand if you generate one. So let's do that. Then I'll show you how to use it in production. Lastly, we'll talk about its security advantages.

## Generating

We're going to use the command `npx dotenv-vault local build`.

#### Prerequisites

Enter a project where you already have `.env.*` file(s) and have installed [dotenv](https://github.com/motdotla/dotenv). For example, I have a project with 3 files in it. See [example code](https://github.com/dotenv-org/examples/tree/master/dotenv-blog/what-is-env-vault-file).

* index.js
* .env
* .env.production

```javascript
// index.js
require('dotenv').config()
console.log(`Hello ${process.env.HELLO}`)
```
```ino
# .env
HELLO="development"
```
```ino
# .env.production
HELLO="production"
```

When I run `node index.js` I get the expected output `Hello development`.

```bash
$ node index.js
Hello development
```

#### Generate .env.vault

Run the local build command.

```bash
$ npx dotenv-vault local build
```

You will see a `.env.vault` file that looks something like this.

```
#/-------------------.env.vault---------------------/
#/         cloud-agnostic vaulting standard         /
#/   [how it works](https://dotenv.org/env-vault)   /
#/--------------------------------------------------/
# development
DOTENV_VAULT_DEVELOPMENT="AtEC33ZfFJQMSE6C+EBX8nzTyQzfC+xhsIfGjyWr47jiHsUi07PHzX2/RmCB0PIi"
# production
DOTENV_VAULT_PRODUCTION="t9van8HefnTIHVlK3vQ6WYLtWEOvPunEnOphV3Hw3aBTBDuwLq22yU0Tdl5fAnk="
```

It contains two keys.

* `DOTENV_VAULT_DEVELOPMENT`
* `DOTENV_VAULT_PRODUCTION`

These contain encrypted copies of your `.env` file and your `.env.production` file.

A `.env.keys` file was also generated. These keys decrypt the contents of `DOTENV_VAULT_${ENVIRONMENT}`.

```
$ npx dotenv-vault local keys
```
```
#/!!!!!!!!!!!!!!!!!!!.env.keys!!!!!!!!!!!!!!!!!!!!!!/
#/   DOTENV_KEYs. DO NOT commit to source control   /
#/   [how it works](https://dotenv.org/env-keys)    /
#/--------------------------------------------------/
DOTENV_KEY_DEVELOPMENT="dotenv://:key_f4516b0077d9aefad9fa7b36cec570e05dcb7cd6d5de1dac2562b6421af7d185@dotenv.local/vault/.env.vault?environment=development"
DOTENV_KEY_PRODUCTION="dotenv://:key_18a137f844e3511022dbf1de2b1bd5e3bd6d1ef4c78988e2521ce9f05abc506a@dotenv.local/vault/.env.vault?environment=production"
```

Try decrypting the contents of `DOTENV_VAULT_PRODUCTION`.

```
$ npx dotenv-vault local decrypt 'dotenv://:key_18a137f844e3511022dbf1de2b1bd5e3bd6d1ef4c78988e2521ce9f05abc506a@dotenv.local/vault/.env.vault?environment=production'
HELLO="production"
```

Great! It's decrypting successfully. Next, let's put this to use in production.

## Production

1. Commit `.env.vault` to code
2. Set DOTENV_KEY on server
3. Deploy your code

At runtime your encrypted secrets will be injected into your code just-in-time.

Try it on your machine with this simple example.

```
$ DOTENV_KEY='dotenv://:key_18a137f844e3511022dbf1de2b1bd5e3bd6d1ef4c78988e2521ce9f05abc506a@dotenv.local/vault/.env.vault?environment=production' node index.js

[dotenv@16.3.1][INFO] Loading env from encrypted .env.vault
Hello production
```

As you can see, it loads your env from your encrypted `.env.vault` file and successfully outputs `Hello production`. Elegant!

## Security Advantages

Do you remember the [CircleCI data breach](https://techcrunch.com/2023/01/05/circleci-breach/)? An attacker gained access to everyone's environment variables putting their software products at major risk.

But if you were using `.env.vault` files, you were not at risk. Why?

The attacker solely gained access to environment variables, not code. So he had your `DOTENV_KEY`, but not your `.env.vault` file. But without both he could not access your sensitive secrets.

This takes the [Twelve-Factor App](https://12factor.net/config)'s' principle of 'strict separation of config from code' to the next level - where even your **config** is separated.

This leads to some great second order effects.

* You are no longer scattering your secrets across multiple third-parties and tools
* Your secrets are easier to manage in one central place close to your code which means less chance of fat-fingering or forgetting to set a secret
* You add more friction to attackers and remove friction for yourself - no more hard work managing secrets across multiple servers

I hope you enjoyed reading this. I am loving using `.env.vault` files. They are simple files that don't require any additional secret manager processes to be kept running. `.env` files were simple, useful, and added additional security. I think `.env.vault` files maintain that same spirit while adding a much higher level of security. What do you think, let me know at [@dotenvorg](https://twitter.com/dotenvorg) or [@motdotla](https://twitter.com/motdotla).

---

### dotenv-vault — A secrets manager for .env and .env.vault files.

<img src="/assets/img/blog/dotenv-vault-screenshot.png" />

If you are looking to also manage your `.env` and `.env.vault` files across a larger team, complete with permissions, versions, and history then create a [Dotenv Account](https://dotenv.org). It's free with premium features.

[https://dotenv.org/signup](https://dotenv.org/signup)
