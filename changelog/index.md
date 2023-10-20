---
layout: changelog
title: "Changelog"
---

<time datetime="2023-10-20">2023-10-20</time>
## New Blog

New blog design rolled out.

---

<time datetime="2023-07-03">2023-07-03</time>
## Experimental Dark Mode

You can now toggle on dark mode. It is experimental at the moment so ymmv (your mileage might vary).

![](/assets/img/changelog/dark-mode.png)

---

<time datetime="2023-07-02">2023-07-02</time>
## Compare Environments

You can now compare environments from a single page.

* See secret differences and spot if any are missing
* Go directly to a secret
* Copy secrets across environments in a couple clicks

![](/assets/img/changelog/compare-environments.png)

---

<time datetime="2023-06-30">2023-06-30</time>
## Dedicated Deploy Page

Each of your projects now has a dedicated deploy page.

* See your .env.vault file
* See your decryption keys
* See instructions, language libraries, and guides on how to deploy secrets securely with a .env.vault file

![](/assets/img/changelog/encrypted-deploys.png)

---

<time datetime="2023-06-08">2023-06-08</time>
## Edit Quote Format

Edit an environment variable's quote format in the UI.

Click the edit button next to your secret, then click Advanced Settings, and then at the top right edit the quote format.

![](/assets/img/changelog/edit-quote-format.png)

---

<time datetime="2023-05-30">2023-05-30</time>
## Dotenv 16.1.0 Released

dotenv@16.1.0 released.

BIG release with first-class support for `.env.vault` files.

![](/assets/img/changelog/dotenv-16-1-0.jpg)

---

<time datetime="2023-05-20">2023-05-20</time>
## dotenv RC Candidate 2

Release Candidate 2 for dotenv@16.1.0 is released. It inludes a slew of additional functionality.

* `populate` command
* Fixes cannot resolve fs error on platforms like Replit.
* Accepts URL as path
* Adds `.env.vault` support

![](/assets/img/changelog/dotenv-16-1-rc2.png)

---

<time datetime="2023-05-07">2023-05-07</time>
## Spanish language README

We added a README in Español. Thank you to Francisco Hernandez for this contribution.

![](/assets/img/changelog/spanish-language-readme.png)

Visit [README-es.md](https://github.com/motdotla/dotenv/blob/master/README-es.md) for more details.

---

<time datetime="2023-05-06">2023-05-06</time>
## Windows Installer

Prefer to install dotenv-vault as an executable on Windows, rather than npx? Now you can.

[32-bit installer](https://dotenv-vault-assets.dotenv.org/channels/stable/dotenv-vault-x86.exe)

[64-bit installer](https://dotenv-vault-assets.dotenv.org/channels/stable/dotenv-vault-x64.exe)

![](/assets/img/changelog/install-windows.png)

Visit [/install](/install) for more details.

---

<time datetime="2023-05-05">2023-05-05</time>
## Homebrew Binary

Prefer to install dotenv-vault with homebrew, rather than npx? Now you can.

```bash
$ brew install dotenv-org/brew/dotenv-vault
```

Then use the commands directly on your cli:

```bash
dotenv-vault help
```

Visit [/install](/install) for more details.

---

<time datetime="2023-05-05">2023-05-05</time>
## dotenv-vault@1.22.0

Node 16 (and greater) is now required to use dotenv-vault 1.22 (and greater).

If you have an older version of node that you cannot upgrade, please install dotenv-vault via the [homebrew](/install) or [windows](/install) installer or similar.

[Library changelog](https://github.com/dotenv-org/dotenv-vault/blob/master/CHANGELOG.md#1220-2023-05-05)

---

<time datetime="2023-05-03">2023-05-03</time>
## GitHub Pages

We've moved our www site to GitHub pages. This includes all docs.

Anyone can suggest edits [here](https://github.com/dotenv-org/dotenv-org.github.io).

![](/assets/img/changelog/homepage-in-may-23.png)

---

<time datetime="2023-05-02">2023-05-02</time>
## Golang .env.vault support

If you're a Golang developer you can now use `.env.vault` files with your deployments.

Install godotenvvault:

```bash
go get github.com/dotenv-org/godotenvvault
```

And as early as possible in your application, import and configure it:

```golang
package main

import (
    "log"
    "os"

    "github.com/dotenv-org/godotenvvault"
)

func main() {
  err := godotenvvault.Load()
  if err != nil {
    log.Fatal("Error loading .env file")
  }

  s3Bucket := os.Getenv("S3_BUCKET")
  secretKey := os.Getenv("SECRET_KEY")

  // now do something with s3 or whatever
}
```

Visit [github.com/dotenv-org/godotenvvault](https://github.com/dotenv-org/godotenvvault) for more details.

---

<time datetime="2023-04-07">2023-04-07</time>
## NodeJS .env.vault support

[dotenv](https://github.com/motdotla/dotenv/tree/v16.1.0-rc1) is getting first-class native support for decrypting .env.vault files.

It's currently released as an RC candidate. Once released, [dotenv](https://github.com/motdotla/dotenv) will be deprecated.

![](/assets/img/changelog/rc-candidate.png)

---

<time datetime="2023-04-06">2023-04-06</time>
## dotenv-vault local commands

You can now run the following three commands to generate your own **.env.vault** file, without relying on dotenv.org to do it for. It works by managing all your secrets completely locally.

* npx dotenv-vault local build
* npx dotenv-vault local decrypt
* npx dotenv-vault local keys

Upgrade to [dotenv-vault@1.19.0](https://github.com/dotenv-org/dotenv-vault/blob/master/CHANGELOG.md#1190-2023-04-06) to use them. You can read more about these commands [here](https://github.com/dotenv-org/dotenv-vault#local-build).

---

<time datetime="2023-03-25">2023-03-25</time>
## New Website

We've redesigned the www site to better describe the benefits of using **dotenv-vault**.

Our goal is toward better explaining the innovation around **.env.vault** and how it benefits developers, dev ops teams, and CSOs.

![](/assets/img/cloudinary/Simplify-Your-Secrets-Dotenv_2_nrbhd3.png)

---

<time datetime="2022-12-20">2022-12-20</time>
## GitHub Add-on

Auto-build your encrypted .env.vault file on each environment change.

It can become a chore to run `npx dotenv-vault build` each time you are ready to deploy new secret changes. Let GitHub do it for you with this [automation add-on](https://www.dotenv.org/docs/addons/github).

![](/assets/img/cloudinary/Screen_Shot_2022-12-23_at_2.11.29_PM_gr1cwu.png)

---

<time datetime="2022-12-11">2022-12-11</time>
## Billing Improvements

Billing teams will be happy. We've added:

* Invoice attached to billing email
* Invoices generated with your billing address (set in settings)

![](/assets/img/cloudinary/Screen_Shot_2022-12-11_at_9.46.16_PM_etlmc1.png)

---

<time datetime="2022-12-07">2022-12-07</time>
## Dotenv VSCode Rust Support

Added [Rust](https://www.rust-lang.org/) support to [dotenv-vscode](https://github.com/dotenv-org/dotenv-vscode).

Updated to <strong>0.20.0</strong>.

Dotenv VSCode now has syntax, auto-cloaking, auto-completion, and in-code secret peeking for the following languages:

* JavaScript/Node
* Ruby
* Python
* PHP
* Go
* Java
* C#
* Rust

![](/assets/img/cloudinary/dotenv-vscode_wvfyxn.png)

---

<time datetime="2022-11-18">2022-11-18</time>
## DOTENV_KEY rotation for dotenv-vault-rails

Added support for rotating <strong>DOTENV_KEY</strong> in [dotenv-vault-rails](https://github.com/dotenv-org/dotenv-vault-ruby).

Update to <strong>0.10.0</strong> or greater to support key rotation in Ruby and Rails.

[Pull Request](https://github.com/dotenv-org/dotenv-vault-ruby/pull/2)

![](/assets/img/cloudinary/Screen_Shot_2022-11-18_at_10.12.52_AM_cobxaf.png)

---

<time datetime="2022-11-08">2022-11-08</time>
## Smarter Encrypted Builds

Now, `npx dotenv-vault build` regenerates itself only if there are changes.

This increases security and improves DX.

It improves security by minimizing the chance of a nonce collision - which would expose your DOTENV_KEY. (Please note this is still incredibly rare. You would have to rebuild your .env.vault file a few billion times before this might occur. Nonetheless, we prefer to minimize the possibility.)

It improves DX because it follows the principle of least surprise. You will see your .env.vault file change only after you've changed your values.

![](/assets/img/cloudinary/smarter-build_kglslt.gif)

---

<time datetime="2022-11-06">2022-11-06</time>
## python-dotenv-vault further extended

[python-dotenv-vault](https://github.com/dotenv-org/python-dotenv-vault) has extended support for:

* [Comma separated DOTENV_KEY capability](https://github.com/dotenv-org/python-dotenv-vault/blob/master/CHANGELOG.md#020) (for use with key rotation)
* [Multiple environment support](https://github.com/dotenv-org/python-dotenv-vault/blob/master/CHANGELOG.md#011) 

These changes put python-dotenv-vault at parity with [dotenv](https://github.com/motdotla/dotenv).

![](/assets/img/cloudinary/Screen_Shot_2022-11-08_at_9.18.11_PM_u9qdha.png)

---

<time datetime="2022-10-30">2022-10-30</time>
## python-dotenv-vault

Decryption support for .env.vault files has been added to Python. If you're using [Flask](https://flask.palletsprojects.com/), [Django](https://www.djangoproject.com/), [FastAPI](https://fastapi.tiangolo.com/), or plain ol' Python, you can use Dotenv Vault with it.

Check it out at [python-dotenv-vault](https://github.com/dotenv-org/python-dotenv-vault) and tell your Python friends.

![](/assets/img/cloudinary/Screen_Shot_2022-10-30_at_12.06.32_PM_yqfcwx.png)

---

<time datetime="2022-10-27">2022-10-27</time>
## Rotate Dotenv Key

Rotate your <strong>DOTENV_KEY</strong> with the following command:

```
$ npx dotenv-vault rotatekey production
```

![](/assets/img/cloudinary/rotatekeys_axduqs.gif)

Then:

1. Update DOTENV_KEY by comma-appending the new value
2. Rebuild and deploy your .env.vault file
3. Update DOTENV_KEY by removing the old value

[See docs](/docs/dotenv-vault/rotatekey) for more information. Supported for [NodeJS](https://github.com/motdotla/dotenv) library. [Ruby](https://github.com/dotenv-org/dotenv-vault-ruby) and [Python](https://github.com/dotenv-org/dotenv-vault-python) support coming soon.

---

<time datetime="2022-10-22">2022-10-22</time>
## New Integrations

We added a handful of new integrations. What should we add next?

* [Astro](https://www.dotenv.org/docs/integrations/netlify/astro)
* [Fly.io](https://www.dotenv.org/docs/integrations/fly/express)
* [Railway](https://www.dotenv.org/docs/integrations/railway/nodejs.html)
* [Remix](https://www.dotenv.org/docs/integrations/github/actions-remix)
* [Render](https://www.dotenv.org/docs/integrations/render/express)
* [Serverless](https://www.dotenv.org/docs/integrations/serverless/express.html)

---

<time datetime="2022-10-15">2022-10-15</time>
## Spam Protection with Turnstile

We swapped our honeypot spam protection mechanism for [Cloudflare Turnstile](https://blog.cloudflare.com/turnstile-private-captcha-alternative/). It is more reliable at catching spam and the experience is still good – no annoying captchas identifying traffic signs. 

![](/assets/img/cloudinary/Screen_Shot_2022-10-22_at_5.58.56_PM_obre5m.png)

---

<time datetime="2022-10-06">2022-10-06</time>
## New Docs

We have updated our [/docs](/docs) site. It's built with [Jekyll](https://jekyllrb.com/). This way we've been able to make it [public on GitHub](https://github.com/dotenv-org/www) – making it easy to edit.

![](/assets/img/cloudinary/screely-1666487750729_jrea3n.png)

---

<time datetime="2022-10-02">2022-10-02</time>
## Integrate Everywhere

Integrate Everywhere™ is our new approach to integrations. It works everywhere you can deploy your code. No more brittle integrations coordinating API calls. Instead, build and encrypt your local .env.vault file, commit it to code, and deploy. There's nothing else like it.

```
$ npx dotenv-vault build
$ git commit -am "Add .env.vault"
$ git push
```

![](/assets/img/cloudinary/screely-1666490843091_ygumti.png)

---

<time datetime="2022-05-02">2022-05-02</time>
## Unlimited Projects

You can now create an unlimited amount of projects.

* Create an unlimited amount of projects
* Create an unlimited amount of secrets per project
* Access those secrets using [dotenv-vault](/install)

![](/assets/img/changelog/unlimited-projects.png)

---

<time datetime="2022-04-02">2022-04-02</time>
## Multiple Environments

Manage your secrets across multiple environments.

* Develompent, ci, staging, and production environments
* Manage secrets across multiple environments through both the ui and [dotenv-vault](/install)

![](/assets/img/cloudinary/multiple-environments-dd9fb70b646a091813ec5be6b67f0e524be605b31467985f96dcafc5bc9a30e3_rtsye7.gif)
