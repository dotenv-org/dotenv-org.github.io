---
layout: docs
title: "dotenv-vault keys"
parent: Docs
---

##### CLI

# dotenv-vault keys

Short guide coming soon. See command details below.

---

## Command Details

For more information on the keys command, run dotenv-vault help keys.

```
$ npx dotenv-vault help keys
List .env.vault decryption keys

USAGE
  $ dotenv-vault keys [ENVIRONMENT] [-m <value>] [-y]

ARGUMENTS
  ENVIRONMENT  Set environment to fetch key(s) from. Defaults to all environments

FLAGS
  -m, --dotenvMe=<value>  Pass .env.me (DOTENV_ME) credential directly (rather than reading from .env.me file)
  -y, --yes               Automatic yes to prompts. Assume yes to all prompts and run non-interactively.

DESCRIPTION
  List .env.vault decryption keys

EXAMPLES
  $ dotenv-vault keys
```
