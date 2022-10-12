---
layout: default
title: "Security"
---

<article class="security-hero" markdown="1">

<h5 class="font-weight-normal mb-0">Security</h5>

{:.mt-0}
# Proven. Trusted. Secure.

#### From the same people that pioneered [dotenv](https://github.com/motdotla/dotenv) - trusted by more than 2.5 million developers.

Trust is earned. You and 2.5 million+ developers trust us with securing your secrets through dotenv. Thank you. It's a solid foundation, but the challenges for [Dotenv Vault](https://github.com/dotenv-org/dotenv-vault) are different and we are earning your trust again.

Let's get started. See how it works below.

</article>

<article markdown="1">

<h2 class="mb-0 text-center">How It Works. Securely.</h2>
<h6 class="mt-04 text-center font-weight-normal">Here's what happens when you sync your .env file with <a href="https://github.com/dotenv-org/dotenv-vault">Dotenv Vault</a>.</h6>

---

<div class="security-how-it-works">
  <div class="flex">
    <div class="flex-1">
      {% include vault/step1.html %}
    </div>
    <div class="flex-1">
      {% include vault/step2.html %}
    </div>
  </div>

  <div class="flex">
    <div class="flex-1">
      {% include vault/step3.html %}
    </div>
    <div class="flex-1">
      {% include vault/step4.html %}
    </div>
  </div>

  <div class="flex">
    <div class="flex-1">
      {% include vault/step5.html %}
    </div>
    <div class="flex-1">
      {% include vault/step6.html %}
    </div>
  </div>

  <div class="flex">
    <div class="flex-1">
      {% include vault/step7.html %}
    </div>
    <div class="flex-1">
      {% include vault/step8.html %}
    </div>
  </div>

  <div class="flex">
    <div class="flex-1">
      {% include vault/step9.html %}
    </div>
    <div class="flex-1">
      {% include vault/step10.html %}
    </div>
  </div>
</div>

---

{:.text-center}
#### Learn more about security in the [security docs](/docs/security).

---

<h2 class="mb-0 text-center">Security Specifications</h2>
<h6 class="mt-04 text-center font-weight-normal">Here's additional specifications that went into build Dotenv Vault.</h6>

<table class="specs-table">
  <tr><td><p><span class="text-green">✓</span> The Dotenv Vault is a separate datastore from the application database. This way if an attacker gains access to the application database they do not gain access to the vault datastore.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> The Dotenv Vault datastore is not accessible via the internet and all external connections are prevented. This way an attacker can not remotely access the Dotenv Vault datastore.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> Encrypted clients are required and these clients have to go through the application - which has its own layers of encryption.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> There are stricter TLS requirements for connecting to the Dotenv Vault datastore. TLS 1.0 cannot be used to connect.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> The secrets stored in the Dotenv Vault are not just encrypted at the datastore level. They are also encrypted at each VALUE. This way even if an attacker gains access to the datastore they could not make sense of the encrypted values.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> The VAULT does NOT store the KEY. It ONLY stores the VALUE. The KEY is stored in the application database and a shared pointer (in both datastores) allows them to be identified as a pair. This way an attacker must gain access to both the application database and the Dotenv Vault datastore to make sense of the values.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> The encryption key(s) used to encrypt the secret values are rotated on an unpublished schedule. This way an attacker might gain access to an old encryption key but not the most recent - foiling their ability to decrypt the secret values.</p></td></tr>
  <tr><td><p><span class="text-green">✓</span> Encryption uses AES-GCM encryption. It is a well-studied, NIST recommended, and IEFT standard algorithim.</p></td></tr>
</table>

{:.w-100}
**As you see, we go to great lengths to make sure your secrets are safe. Afterall, we keep our secrets here too.**

---

<h2 class="mb-0 text-center">Security Statement</h2>
<h6 class="mt-04 text-center font-weight-normal">A message from Dotenv's Founder & CTO.</h6>

Fellow developer,

As you already know, security is an evermoving target - an arms race. But that doesn't mean it should be hard to use. Good design can make complex things simple, and that is what we are after at Dotenv.

Dotenv is a security tool. It has been since it was first developed in 2013. We saw developers struggling to keep their secrets safe so we pioneered the .env security file format standard. The design led to a better Developer Security Experience - which led to safer secrets for millions of developers. Today, we are taking that to the next logical step.

What is the problem with .env files today? The world has changed. Developers manage secrets at greater scale than a decade ago. .env files are not easily shareable between machines, environments, and team members. As a result, developers share secrets over Slack, email, and other messaging services. It's not scaleable and is a security risk. For a CTO or CSO it is a risk they should not take.

So, today, we are extending the .env file format to support syncing across machines, environments, and team members. It's an exciting development and we welcome you to go on this journey with us.

Join us.

<p>- Mot.<br/>Founder & CTO</p>

---

{:.text-center}
#### Sync .env files securely.&nbsp;&nbsp;&nbsp;[Get Started with Dotenv](/signup){:.btn}

</article>
