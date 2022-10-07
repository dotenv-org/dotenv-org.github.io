---
layout: default
title: "Security"
---

<article class="security-hero" markdown="1" style="background-image: url(https://www.dotenv.org/assets/vault/bg-black2-75038b987fd2182de1fc5c2aeba7310f7ae5b8cc3a0d993e05b483b5fdb9fb5e.png) !important; background-size: fit; background-repeat: repeat; background-position: center !important;">

<h5 class="font-weight-normal mb-0">Security</h5>

{:.mt-0}
# Proven. Trusted. Secure.

#### From the same people that pioneered [dotenv](https://github.com/motdotla/dotenv) - trusted by more than 2.5 million developers.

Trust is earned. You and 2.5 million+ developers trust us with securing your secrets through dotenv. Thank you. It's a solid foundation, but the challenges for [dotenv-vault](https://github.com/dotenv-org/dotenv-vault) are different and we are earning your trust again.

Let's get started. See how it works below.

<!--[dotenv-vault](https://github.com/dotenv-org/dotenv-vault) extends this proven & trusted foundation. See how it works below.-->

</article>

<article markdown="1">

<h2 class="mb-0 text-center">How It Works. Securely.</h2>
<h6 class="mt-04 text-center font-weight-normal">Here's what happens when you sync your .env file with <a href="https://github.com/dotenv-org/dotenv-vault">dotenv-vault</a>.</h6>

---

<div class="security-how-it-works">
  <div class="flex">
    <div>
      <p>Step 1</p>
      <h5>npx dotenv-vault push</h5>
      <p>You run <code>npx dotenv-vault push</code>. Your request is started.</p>
    </div>
    <div>
      <p>Step 2</p>
      <h5>Encrypted Connection</h5>
      <p>Your <kbd>.env</kbd> file is encrypted and sent securely over SSL to Dotenv's in-memory servers.</p>
    </div>
  </div>

  <div class="flex">
    <div>
      <p>Step 3</p>
      <h5>Dotenv Servers</h5>
      <p>This encrypted payload is decrypted and briefly held in memory to complete the next steps. Afterward, the memory is flushed. Rest assured the decrypted version is never peristed to Dotenv systems.</p>
    </div>
    <div>
      <p>Step 4</p>
      <h5>Parsing</h5>
      <p>Your .env file is parsed line by line - in memory.</p>
      <p>Note: There are minor differences between dotenv parsers across various languages and frameworks. So far Dotenv Vault handles 100% of these, and we continue to add test cases to cover all edge cases.</p>
    </div>
  </div>

  <div class="flex">
    <div>
      <p>Step 5</p>
      <h5>Secret Extraction</h5>
      <p>Each key/value pair (and any comments) are extracted - in memory.</p>
    </div>
    <div>
      <p>Step 6</p>
      <h5>Secret Division</h5>
      <p>The secret is divided into its separate key and value. This is by design. They will be stored in separate databases for added security. This way if an attacker somehow gained access to one database they would not be able to make sense of the data - having only half the puzzle.</p>
    </div>
  </div>

  <div class="flex">
    <div>
      <p>Step 7</p>
      <h5>AES-GCM Encryption</h5>
      <p>The KEY is encrypted. The VALUE is encrypted. They are encrypted with different master encryption keys. This way if an attacker somehow gained access to the VALUE decryption key they would find the data useless. They would not know if the secret belonged to Twilio or to AWS.</p>
      <p>Encryption uses the AES-GCM algorithm. It is:</p>

      <ul>
        <li>well-studied</li>
        <li>NIST recommended</li>
        <li>an IETF standard</li>
        <li>fast thanks to a dedicated instruction set</li>
      </ul>

      <p>Additionally, all master encryption keys are rotated on an unpublished schedule, further adding to the level of security.</p>
    </div>
    <div>
      <p>Step 8</p>
      <h5>Tokenization</h5>
      <p>The encrypted VALUE is sent to Dotenv Vault for safe storage. A token is returned as an identifier. The token is used in the next step for mapping the KEY to the VALUE for later secure-read operations.</p>
      <p>Multiple security measures go into the Vault. They include but are not limited to:</p>
      <ul>
        <li>Separate datastore from the application database</li>
        <li>Not accessible via the internet and all external connections are prevented</li>
        <li>Encrypted clients are required and these clients have to go through the application - which has its own additional layers of encryption</li>
        <li>There are stricter TLS requirements for connecting to the Vault. TLS 1.0 cannot be used to connect.</li>
        <li>The secrets stored in the Vault are not just encrypted at the datastore level. They are also encrypted at each datastore entry as you saw in the prior step(s).</li>
      </ul>
    </div>
  </div>

  <div class="flex">
    <div>
      <p>Step 9</p>
      <h5>Store Key Part with Token</h5>
      <p>Lastly, the encrypted KEY and token (representing the encrypted VALUE) are placed in an envelope and stored together in the application database.</p>
    </div>
    <div>
      <p>Step 10</p>
      <h5>Success 201</h5>
      <p>A success message is returned to the developer.</p>
    </div>
  </div>
</div>

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

<div class="security-statement" markdown="1">

Fellow developer,

As you already know, security is an evermoving target - an arms race. But that doesn't mean it should be hard to use. Good design can make complex things simple, and that is what we are after at Dotenv.

Dotenv is a security tool. It has been since it was first developed in 2013. We saw developers struggling to keep their secrets safe so we pioneered the .env security file format standard. The design led to a better Developer Security Experience - which led to safer secrets for millions of developers. Today, we are taking that to the next logical step.

What is the problem with .env files today? The world has changed. Developers manage secrets at greater scale than a decade ago. .env files are not easily shareable between machines, environments, and team members. As a result, developers share secrets over Slack, email, and other messaging services. It's not scaleable and is a security risk. For a CTO or CSO it is a risk they should not take.

So, today, we are extending the .env file format to support syncing across machines, environments, and team members. It's an exciting development and we welcome you to go on this journey with us.

Join us.

<p>- Mot.<br/>Founder & CTO</p>

</div>

---

{:.text-center}
#### Start syncing .env files securely.&nbsp;&nbsp;&nbsp;[Get Started with Dotenv](/signup){:.btn}

</article>
