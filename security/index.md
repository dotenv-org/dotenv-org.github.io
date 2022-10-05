---
layout: default
title: "Security"
---

<article class="security-hero" markdown="1">

# Proven. Trusted. Secure.

#### From the same people that pioneered [dotenv](https://github.com/motdotla/dotenv) - trusted by more than 2.5 million developers.

<!--[dotenv-vault](https://github.com/dotenv-org/dotenv-vault) extends this proven & trusted foundation. See how it works below.-->

</article>

<article class="" markdown="1">

{:.text-center}
### How It Works. Securely.

---

Here's what happens when you sync your .env file with [dotenv-vault](https://github.com/dotenv-org/dotenv-vault).

##### Step 1 – npx dotenv-vault push

You run `npx dotenv-vault push`. Your request is started.

##### Step 2 – Encrypted Connection

Your <kbd>.env</kbd> file is encrypted and sent securely over SSL to Dotenv's in-memory servers.

##### Step 3 – Dotenv Servers

This encrypted payload is decrypted and briefly held in memory to complete the next steps. Afterward, the memory is flushed. Rest assured the decrypted version is never peristed to Dotenv systems.

##### Step 4 – Parsing

Your .env file is parsed line by line - in memory.

Note: There are minor differences between dotenv parsers across various languages and frameworks. So far Dotenv Vault handles 100% of these, and we continue to add test cases to cover all edge cases.

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3 d-flex align-items-center justify-content-center">
    <div class="text-center">
      <kbd class="small">KEY=VALUE</kbd>
    </div>
  </div>
  <div class="col-8 col-lg-9">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 5</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Secret Extraction</span></p>
        <p class="small">Each key/value pair (and any comments) are extracted - in memory.</p>
      </div>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3 d-flex align-items-center justify-content-center">
    <div class="text-center">
      <kbd class="small d-block">KEY=VALUE</kbd>
      <div class="text-center">
        <svg fill="#ecd53f" class="bi bi-arrow-bar-down" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M1 3.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM8 6a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 .708-.708L7.5 12.293V6.5A.5.5 0 0 1 8 6z"></path></svg>
      </div>
      <kbd class="small">KEY</kbd>
      <kbd class="small">VALUE</kbd>
    </div>
  </div>
  <div class="col-8 col-lg-9">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 6</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Secret Division</span></p>
        <p class="small">The secret is divided into its separate key and value. This is by design. They will be <strong>stored in separate databases</strong> for added security. This way if an attacker somehow gained access to one database they would not be able to make sense of the data - having only half the puzzle.</p>
      </div>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-0">
  <div class="col-4 col-lg-3 d-flex justify-content-center">
    <div class="text-left mt-4">
      <div class="d-block">
        <kbd class="small">KEY</kbd> <svg width="20" fill="#ecd53f" class="bi bi-key-fill" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path></svg> <kbd class="small">key_b46…</kbd>
      </div>
      <div class="d-block mt-3">
        <kbd class="small">VALUE</kbd> <svg width="20" fill="#ecd53f" class="bi bi-key-fill" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path></svg> <kbd class="small">val_a8e…</kbd>
      </div>
    </div>
  </div>
  <div class="col-8 col-lg-9">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 7</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Encryption</span><small class="text-monospace ml-2">AES-GCM Algorithm</small></p>
        <p class="small">The <kbd>KEY</kbd> is encrypted. The <kbd>VALUE</kbd> is encrypted. They are <strong>encrypted with different master encryption keys</strong>. This way if an attacker somehow gained access to the VALUE decryption key they would find the data useless. They would not know if the secret belonged to Twilio or to AWS.</p>

        <hr class="bg-white mt-0">

        <p class="small mb-1"><strong>Encryption uses the AES-GCM algorithm</strong>. It is:</p>
        <ul class="small pl-3">
          <li>well-studied</li>
          <li><a class="text-secondary" target="_blank" href="https://www.nist.gov/"><u>NIST</u></a> recommended</li>
          <li>an <a target="_blank" class="text-secondary" href="https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force"><u>IETF</u></a> standard</li>
          <li>fast thanks to a <a class="text-secondary" target="_blank" href="https://en.wikipedia.org/wiki/AES_instruction_set"><u>dedicated instruction set</u></a></li>
        </ul>
        <p class="small">Additionally, all master encryption keys are rotated on an unpublished schedule, further adding to the level of security.</p>

      </div>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-0">
  <div class="col-4 col-lg-3 d-flex justify-content-center">
    <div class="text-center mt-4">
      <div class="d-block">
        <kbd class="small">val_a8e…</kbd>
      </div>
      <div class="d-block">
        <svg fill="#ecd53f" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
      </div>
      <div class="d-block">
        <svg fill="#ecd53f" width="60" class="bi bi-safe2-fill" viewBox="0 0 16 16" version="1.1" height="60" aria-hidden="true"><path d="M6.563 8H5.035a3.482 3.482 0 0 1 .662-1.596l1.08 1.08c-.094.16-.167.332-.214.516zm.921-1.223-1.08-1.08A3.482 3.482 0 0 1 8 5.035v1.528c-.184.047-.357.12-.516.214zM9 6.563V5.035a3.482 3.482 0 0 1 1.596.662l-1.08 1.08A1.988 1.988 0 0 0 9 6.563zm1.223.921 1.08-1.08c.343.458.577 1.003.662 1.596h-1.528a1.989 1.989 0 0 0-.214-.516zM10.437 9h1.528a3.483 3.483 0 0 1-.662 1.596l-1.08-1.08c.094-.16.167-.332.214-.516zm-.921 1.223 1.08 1.08A3.483 3.483 0 0 1 9 11.965v-1.528c.184-.047.357-.12.516-.214zM8 10.437v1.528a3.483 3.483 0 0 1-1.596-.662l1.08-1.08c.16.094.332.167.516.214zm-1.223-.921-1.08 1.08A3.482 3.482 0 0 1 5.035 9h1.528c.047.184.12.357.214.516zM7.5 8.5a1 1 0 1 1 2 0 1 1 0 0 1-2 0z"></path>
  <path d="M2.5 1A1.5 1.5 0 0 0 1 2.5V3H.5a.5.5 0 0 0 0 1H1v4H.5a.5.5 0 0 0 0 1H1v4H.5a.5.5 0 0 0 0 1H1v.5A1.5 1.5 0 0 0 2.5 16h12a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 14.5 1h-12zm6 3a4.5 4.5 0 1 1 0 9 4.5 4.5 0 0 1 0-9z"></path></svg>
      </div>
      <div class="d-block">
        <p class="text-dotenv small p-0 pt-1 m-0">Dotenv Vault Store</p>
      </div>
      <div class="d-block">
        <svg fill="#ecd53f" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
      </div>
      <div class="d-block">
        <kbd class="small bg-dotenv text-dark">token_fd4b…</kbd>
      </div>
    </div>
  </div>
  <div class="col-8 col-lg-8">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 8</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Tokenization</span><small class="text-monospace ml-2">VALUE</small></p>
        <p class="small">The encrypted <kbd>VALUE</kbd> is sent to Dotenv Vault for safe storage. A token is returned as an identifier. The token is used in the next step for mapping the <kbd>KEY</kbd> to the <kbd>VALUE</kbd> for later secure-read operations.</p>

        <hr class="bg-white mt-0">

        <p class="small mb-1"><strong>Multiple security measures go into the Vault.</strong> They include but are not limited to:</p>
        <ul class="small pl-3">
          <li>Separate datastore from the application database</li>
          <li>Not accessible via the internet and all external connections are prevented</li>
          <li>Encrypted clients are required and these clients have to go through the application - which has its own additional layers of encryption</li>
          <li>There are stricter TLS requirements for connecting to the Vault. TLS 1.0 cannot be used to connect.</li>
          <li>The secrets stored in the Vault are not just encrypted at the datastore level. They are also encrypted at each datastore entry as you saw in the prior step(s).</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-0">
  <div class="col-4 col-lg-3 d-flex justify-content-center">
    <div class="text-center mt-4">
      <div class="d-block text-left border rounded p-1 border-dotenv mr-lg-2">
        <kbd class="small">key_b46…</kbd>
        <kbd class="small bg-dotenv text-dark">token_fd4b…</kbd>
      </div>
      <div class="d-block mb-1">
        <svg fill="#ecd53f" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
      </div>
      <div class="d-block">
        <svg fill="#ecd53f" width="60" class="bi bi-server" viewBox="0 0 16 16" version="1.1" height="60" aria-hidden="true"><path d="M1.333 2.667C1.333 1.194 4.318 0 8 0s6.667 1.194 6.667 2.667V4c0 1.473-2.985 2.667-6.667 2.667S1.333 5.473 1.333 4V2.667z"></path>
  <path d="M1.333 6.334v3C1.333 10.805 4.318 12 8 12s6.667-1.194 6.667-2.667V6.334a6.51 6.51 0 0 1-1.458.79C11.81 7.684 9.967 8 8 8c-1.966 0-3.809-.317-5.208-.876a6.508 6.508 0 0 1-1.458-.79z"></path>
  <path d="M14.667 11.668a6.51 6.51 0 0 1-1.458.789c-1.4.56-3.242.876-5.21.876-1.966 0-3.809-.316-5.208-.876a6.51 6.51 0 0 1-1.458-.79v1.666C1.333 14.806 4.318 16 8 16s6.667-1.194 6.667-2.667v-1.665z"></path></svg>
      </div>
      <div class="d-block">
        <p class="text-dotenv small p-0 pt-1 m-0">Dotenv Application Database</p>
      </div>
    </div>
  </div>
  <div class="col-8 col-lg-8">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 9</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Store Key Part with Token</span></p>
        <p class="small">Lastly, the encrypted <kbd>KEY</kbd> and token (representing the encrypted <kbd>VALUE</kbd>) are placed in an envelope and stored together in the application database.</p>
      </div>
    </div>
  </div>
</div>

<div class="form-row mb-2">
  <div class="col-4 col-lg-3">
    <div class="text-center" style="opacity: 0.4">
      <svg fill="white" width="20" class="bi bi-arrow-down" viewBox="0 0 16 16" version="1.1" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path></svg>
    </div>
  </div>
</div>

<div class="form-row mb-0">
  <div class="col-4 col-lg-3 d-flex justify-content-center align-items-center">
    <div class="text-center">
      <div class="position-relative" style="margin-top: -25px;">
        <svg fill="white" width="70" class="bi bi-laptop" viewBox="0 0 16 16" version="1.1" height="70" aria-hidden="true"><path d="M13.5 3a.5.5 0 0 1 .5.5V11H2V3.5a.5.5 0 0 1 .5-.5h11zm-11-1A1.5 1.5 0 0 0 1 3.5V12h14V3.5A1.5 1.5 0 0 0 13.5 2h-11zM0 12.5h16a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5z"></path></svg>
      </div>
      <div class="position-relative" style="margin-top: -50px;">
        <svg fill="#ecd53f" width="24" class="bi bi-cloud-check-fill" viewBox="0 0 16 16" version="1.1" height="24" aria-hidden="true"><path d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 4.854-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708.708z"></path></svg>
      </div>
    </div>
  </div>
  <div class="col-8 col-lg-8">
    <div class="form-row">
      <div class="col">
        <p style="opacity: 0.8" class="mb-0 text-left text-secondary">Step 10</p>
        <p class="text-left mb-1"><span class="text-monospace text-white">Success 201</span></p>
        <p class="small">A success message is returned to the developer.</p>
      </div>
    </div>
  </div>
</div>


</article>
