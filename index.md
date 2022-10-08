---
layout: default
title: "Sync .env files"
---

<article class="hero" markdown="1" style="background-image: url(https://raw.githubusercontent.com/motdotla/dotenv/master/dotenv.svg) !important; background-size: 25rem; background-repeat: no-repeat; background-position: 12rem -5rem;">

# Sync .env files

{:.font-weight-normal}
#### Dotenv Vault makes it safe and easy to sync your .env files across multiple machines, teammates, and environments.

[Get Started with Dotenv](/signup){:.btn} &nbsp;&nbsp;[See Pricing](/pricing)

</article>

<article markdown="1">

{:.text-center}
### Why you'll love using Dotenv

---

### Works with a single command

You don't need to install anything to use Dotenv Vault. No error prone binaries to install, infrastructure to maintain, or custom code to write. It just works – with a single command.

```
$ npx dotenv-vault push

remote:   Securely pushing (.env)... done
remote:   Securely pushed development (.env)

Run npx dotenv-vault open to view in the ui
```

[Watch the 1 minute overview video](https://www.youtube.com/watch?v=z-lBjxfhWeY)

### Multiple Environments

After you've pushed your .env file, you can manage your secrets across multiple environments. Open an environment to view and edit its environment variables.

```
$ npx dotenv-vault open production

local:    Opening project page... done

Run npx dotenv-vault build to encrypt .env.vault file
```

### Deploy Everywhere™

Dotenv Vault works everywhere you already deploy your code. Run the build command to generate your encrypted .env.vault file, commit that safely to code, and deploy. There's nothing else like it.

```
$ npx dotenv-vault build

remote:   Securely building .env.vault... done
remote:   Securely built .env.vault

Next, commit .env.vault to code and deploy
```

---

{:.text-center}
#### Start syncing .env files instantly.&nbsp;&nbsp;&nbsp;[Get Started with Dotenv](/signup){:.btn}

</article>

<!--
Make your experience even better!

  <h2>Add your teammates</h2>

  <p>Add your teammates and stop sharing .env files over insecure channels like Slack and email. Spend your time coding rather than updating .env.example files, and never lose an important .env file again. Tell your teammates to run:</p>

  <h2>Manage their access</h2>

<pre><code>npx dotenv-vault pull</code></pre>
-->
