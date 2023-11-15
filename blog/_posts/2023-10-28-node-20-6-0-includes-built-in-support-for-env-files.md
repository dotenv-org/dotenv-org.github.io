---
layout: blog
author: mot
title: "Node.js 20.6.0 includes built-in support for .env files"
image: "/assets/img/blog/node-env-file-support.png"
excerpt: "Node v20.6.0+ adds native support for loading .env files."
published: true
---

Node v20.6.0+ adds native support for loading `.env` files.

```
node --env-file=.env index.js
```

Wow, cool!

Is [dotenv](https://github.com/motdotla/dotenv) [dead](https://francoisbest.com/posts/2023/dotenv-is-dead?ref=dailydev)? [Stop using it](https://medium.com/@tony.infisical/stop-using-dotenv-in-node-js-v20-6-0-8febf98f6314)? Not so fast. **Don't drop dotenv** just yet. There are some caveats you should know first. 

First, let me say, it is great to see the NodeJS team adopt first-class `.env` support for developers. As [one of the pioneers of dotenv](https://github.com/motdotla/dotenv/graphs/contributors), it's an honor. **dotenv** is depended on by more than [14 Million](https://github.com/motdotla/dotenv/network/dependents) open source repos on GitHub alone and downloaded more than [35 Million](https://www.npmjs.com/package/dotenv) times per week. [dotenv](https://github.com/motdotla/dotenv) has proven itself as a trusty friend to millions of developers worldwide.

Anyways, let's see how this built-in support works (or [skip to the caveats](#caveats) section).

{% include components/note.html url="https://github.com/dotenv-org/examples/tree/master/dotenv-blog/2023-10-28" %}

## How it works

Install Node v20.6.0 or greater using [nvm](https://github.com/nvm-sh/nvm).

```
nvm install 20.6.0
nvm use 20.6.0
node -v
v20.6.0
```

Create your `.env` file.

```
HELLO="World"
````

Create your node script to make use of it.

```
// index.js
console.log(`Hello ${process.env.HELLO}`)
```

Run it with the `--env-file` flag.

```
node --env-file=.env index.js
Hello World
```

That's it!

Want to run it in production? Just point it to a `.env.production` file.

```
# .env.production
HELLO="production"
```

```
node --env-file=.env.production index.js
```

## Caveats

The biggest *current* caveat is that this is still an experimental feature. That means it will ship with [bugs](https://github.com/nodejs/node/pull/49424#issue-1876566254) and with [missing feature support](https://github.com/nodejs/node/issues/49148). The [top hn comment](https://news.ycombinator.com/item?id=37174916) sums it up well - albeit a bit grumpily. 

<img src="/assets/img/blog/hacker-news-node-dotenv-support.png" />

I also want to stress the word *current* because this is all still under active development. These things take time. By the time you read this, some of these caveats might no longer be around.

### Missing multiline support

The current implementation does not support multiline environment variables. If you attempt to include a multiline environment variable it will be `undefined`. For example:

```
# .env.multiline
HELLO="This
is
a
multiline"
```
```
// index.js
console.log(`Hello ${process.env.HELLO}`)
```
```
node --env-file=.env.multiline index.js
Hello undefined
```

Note: multiline support is being actively discussed and will probably get added in the near future.

### Missing override option

You cannot override your system's environment variables with your `.env` file. There is no option.

```
# .env
HELLO="World"
```
```
// index.js
console.log(`Hello ${process.env.HELLO}`)
```
```
export HELLO="System"
node --env-file=.env index.js
Hello System
```

It prints `Hello System` rather then `Hello World`. There is no option to overwrite system variables.

If you need to do this then continue using dotenv with [its override option](https://github.com/motdotla/dotenv#override).

### Missing variable expansion

Variable expansion support for dotenv exists in a separate library [dotenv-expand](https://github.com/motdotla/dotenv-expand). But it is so [widely used with 13 million downloads](https://www.npmjs.com/package/dotenv-expand) weekly that it is defacto considered part of dotenv.

As of this writing, Node does not support variable expansion. Instead, it will output the variable as a string.

```
# .env
PASSWORD="password123"
SECRET=$PASSWORD
```
```
// index.js
console.log(`The secret is ${process.env.SECRET}`)
```
```
node --env-file=.env index.js
The secret is $PASSWORD
```

So if you need variable expansion, you should continue using [dotenv](https://github.com/motdotla/dotenv) and [dotenv-expand](https://github.com/motdotla/dotenv-expand).

### Missing `.env.vault` support

`.env.vault` files are the spiritual successors to `.env` files. They have multiple security advantages over `.env` files which you can [read about here](https://www.dotenv.org/blog/2023/10/24/what-is-env-vault-file.html).

They are quite [new](https://github.com/motdotla/dotenv/pull/730), but also quite useful for production and ci, and are gaining adoption across multiple communities like [node](https://github.com/motdotla/dotenv), [python](https://github.com/dotenv-org/python-dotenv-vault), [rust](https://docs.rs/dotenv-vault/latest/dotenv_vault/), and more.

But as a new technology, they are unlikely to be adopted natively by Node until they earn similar widespread use to `.env` files. So keep using [dotenv](https://github.com/motdotla/dotenv) if you plan to make use of them.

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

## Conclusion

In conclusion, built-in support for `.env` files (even if currently experimental) is a huge and welcome step forward for Node. Big thanks to Yagiz Nizipli for making this happen. [Go sponsor him on GitHub](https://github.com/sponsors/anonrig). He is doing incredible work for Node.

But there are some current caveats, and I would recommend against npm uninstall-ing dotenv for your production apps at this time. Wait until it is non-experimental and has added support for the missing features above.

---

### Using the new `--env-file` flag?

[dotenv-vault](https://github.com/dotenv-org/dotenv-vault) is the perfect companion. Use it to sync your `.env` files and easily switch between environments. For, example `npx dotenv-vault pull production .env` to pull your production secrets to your `.env` file. [Create your Dotenv Account](https://dotenv.org) and try it today.

<img src="/assets/img/blog/dotenv-vault-screenshot2.png" />

[https://dotenv.org/signup](https://dotenv.org/signup)
