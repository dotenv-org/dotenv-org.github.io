---
layout: docs
title: "Syncing .env Files - Tutorial"
parent: Docs
redirect_from:
  - /docs/getting-started/with-dotenv-vault
  - /get-started
---

{% include helpers/reading_time.html %}

{% include icons/dotenv.html width="30" color="#ECD53F" %}

##### Tutorial

# Syncing .env Files

Sync environment variables securely with Dotenv Vault. I'll show you how in this tutorial. Let's get started.

---

<div style="width: 328px;" class="m-auto">
<div class="rounded video border border-success bg-dark">
  <iframe width="1108" height="625" src="https://www.youtube.com/embed/z-lBjxfhWeY" title="1 Minute Overview" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div>

---

#### Run dotenv-vault new

Open terminal, enter your project's root directory (where you keep your .env file), and run dotenv-vault new.

```
$ npx dotenv-vault new
```

<small>FYI: npx is a very powerful command that lets you run code built with NodeJS and published through the npm registry.</small>

#### Name your project

On the page that opens, name your project (typically prefilled for you), and enter your email address.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1659056744/Screen_Shot_2022-07-28_at_5.55.15_PM_jnnhto.png" %}

#### View .env.vault file (optional)

A .env.vault was generated for your project. It uniquely identifies your project in dotenv-vault. Think of it like a unique git url at GitHub. It identifies your project so that you (and your teammates) pull the correct .env from dotenv-vault.

Run ls -al to view it.


```
$ ls -al
Jul 28 17:54 .
Jul 27 13:46 ..
Jul 27 14:51 .env
Jul 28 18:09 .env.vault
Jul 28 17:54 .gitignore
Jul 27 14:49 index.js
Jul 27 14:12 node_modules
Jul 27 14:48 package-lock.json
Jul 27 14:12 package.json
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1659059249/Screen_Shot_2022-07-28_at_6.46.24_PM_s5qd3s.png" %}

#### Run dotenv-vault login

Next, authenticate your machine by running dotenv-vault login.

```
$ npx dotenv-vault login
```

#### Click log in

On the next screen, follow the login process and click 'Log in'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1658986132/dotenv-vault-login-2_vdb9sq.png" %}

#### View .env.me file (optional)

You now have a .env.me file in the root of your project. The .env.me file uniquely authorizes you to access a project's shared .env file. You can think of it like your unique SSH key at GitHub.

Run ls -al to view it.

```
$ ls -al
Jul 28 17:54 .
Jul 27 13:46 ..
Jul 27 14:51 .env
Jul 28 18:11 .env.me
Jul 28 18:09 .env.vault
Jul 28 17:54 .gitignore
Jul 27 14:49 index.js
Jul 27 14:12 node_modules
Jul 27 14:48 package-lock.json
Jul 27 14:12 package.json
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_900/v1659128781/dotenv-me_bsffi2.png" %}

#### Run dotenv-vault push

Return one last time to terminal and run dotenv-vault push.

This will securely push your .env file to dotenv-vault. Each time you change your .env file, run dotenv-vault push.

```
$ npx dotenv-vault push

remote:   Securely pushing (.env)... done
remote:   Securely pushed development (.env)

Run npx dotenv-vault open to view in the ui
```

Congratulations 🎉, you just pushed (and secured) your first .env file in dotenv-vault.

<small>ProTip: For a list of all available commands, run npx dotenv-vault help.</small>

#### Run dotenv-vault open (bonus)

Let's check out the UI. Run dotenv-vault open.

```
$ npx dotenv-vault open
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1658987582/dotenv-vault-ui_ep5nrs.png" %}

That's it! Thanks for using dotenv-vault.
