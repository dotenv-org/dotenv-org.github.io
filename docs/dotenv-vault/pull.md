--
layout: docs
title: "dotenv-vault pull"
parent: Docs
---

##### CLI

# dotenv-vault pull

Pull .env securely with dotenv-vault.

#### 1. Run pull command

```
$ npx dotenv-vault pull

remote:   Securely pulling... done
remote:   Securely pulled development (.env)
```

#### 2. View .env (optional)

You now have a .env file in the root of your project. The .env file holds your environment variables - their names and secrets.

Run ls -al to view it.

```
$ ls -al
Jul 28 17:54 .
Jul 27 13:46 ..
Jul 27 14:51 .env
Jul 28 18:11 .env.me
Jul 28 18:09 .env.vault
Jul 28 17:54 .gitignore
...
```
![](https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_900/v1659632493/Screen_Shot_2022-08-04_at_10.00.34_AM_jg9dzq.png)

That's it!

---

## Command Details

For more information on the pull command, run dotenv-vault help pull.

```
$ npx dotenv-vault help pull
Pull .env securely

USAGE
  $ dotenv-vault pull [ENVIRONMENT] [FILENAME] [-m ] [-y]

ARGUMENTS
  ENVIRONMENT  Set environment to pull from. Defaults to development
  FILENAME     Set output filename. Defaults to .env for development and .env.{environment} for other environments

FLAGS
  -m, --dotenvMe=         Pass .env.me (DOTENV_ME) credential directly (rather than reading from .env.me file)
  -y, --yes               Automatic yes to prompts. Assume yes to all prompts and run non-interactively.

DESCRIPTION
  Pull .env securely

EXAMPLES
  $ dotenv-vault pull
```

##### ARGUMENTS

*[ENVIRONMENT]*

Set environment to pull from. Defaults to development

```
$ npx dotenv-vault pull production
```

*[FILENAME]*

Set output filename. Defaults to .env for development and .env.{environment} for other environments

```
$ npx dotenv-vault pull production .env.production
```

##### FLAGS

*-m, --dotenvMe*

Pass .env.me (DOTENV_ME) credential directly (rather than reading from .env.me file)

```
$ npx dotenv-vault pull --dotenvMe=me_b1831e…
```

*-y, --yes*

Automatic yes to prompts. Assume yes to all prompts and run non-interactively.

```
$ npx dotenv-vault pull -y
```
