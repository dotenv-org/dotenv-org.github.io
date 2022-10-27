---
layout: docs
title: "dotenv-vault rotatekey"
parent: Docs
---

##### CLI

# dotenv-vault rotatekey

Short guide coming soon. See command details below.

---

## Command Details

For more information on the rotatekey command, run dotenv-vault help rotatekey.

```
$ npx dotenv-vault help rotatekey
remote:   Rotating decryption key... done

USAGE
  $ dotenv-vault rotatekey [ENVIRONMENT] [-m <value>] [-y]

ARGUMENTS
  ENVIRONMENT  Set environment to rotate. Required.

FLAGS
  -m, --dotenvMe=<value>  Pass .env.me (DOTENV_ME) credential directly (rather than reading from .env.me file)
  -y, --yes               Automatic yes to prompts. Assume yes to all prompts and run non-interactively.

DESCRIPTION
  Rotate DOTENV_KEY

EXAMPLES
  $ dotenv-vault rotatekey
```
