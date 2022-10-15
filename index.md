---
layout: default
title: "Sync .env files"
---

<div class="hero">
  <h1>Sync .env files</h1>

  <div>
    <h4 class="font-weight-normal">Stop sharing them over insecure channels like Slack and email and never lose an important .env file again.</h4>
    <p><a class="btn" href="/signup">Get Started with Dotenv Vault</a>&nbsp;&nbsp;<a href="/pricing">See Pricing</a></p>
    <p>
      From the same people that pioneered dotenv.
      <br/>
      Trusted by more than 2.5 million developers.
    </p>
  </div>
</div>

<article markdown="1">

{:.text-center}
### Why you'll love using Dotenv Vault

---

### Works with a single command

You don't need to install anything to use Dotenv Vault. No error prone binaries to install, infrastructure to maintain, or custom code to write. It just works – with a single command.

```
$ npx dotenv-vault push
```

<div class="rounded video border border-success bg-dark">
  <iframe width="1108" height="625" src="https://www.youtube.com/embed/z-lBjxfhWeY" title="1 Minute Overview" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

---

### Multiple Environments

After you've pushed your .env file, you can manage your secrets across multiple environments. Open an environment to view and edit its environment variables.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_900/v1659628722/Screen_Shot_2022-08-04_at_8.53.16_AM_pukxin.png" %}

---

### Deploy Everywhere™

Dotenv Vault works everywhere you already deploy your code. Run the build command to generate your encrypted .env.vault file, commit that safely to code, and deploy. There's nothing else like it.

```
$ npx dotenv-vault build
$ git commit -am "Add .env.vault"
$ git push
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1665603984/npx-build_qqcbcb.gif" %}

---

{:.text-center}
#### Sync .env files instantly.&nbsp;&nbsp;&nbsp;[Get Started with Dotenv Vault](/signup){:.btn}

</article>

<!--
Make your experience even better!

  <h2>Add your teammates</h2>

  <p>Add your teammates and stop sharing .env files over insecure channels like Slack and email. Spend your time coding rather than updating .env.example files, and never lose an important .env file again. Tell your teammates to run:</p>

  <h2>Manage their access</h2>

<pre><code>npx dotenv-vault pull</code></pre>
-->
