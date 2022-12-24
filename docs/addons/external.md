---
layout: docs
title: "External Share - Add-ons"
---

{% include helpers/reading_time.html %}

{% include icons/external.html width="50" color="#0B24FB" %}

##### Add-ons

# External Share

Permit an external team or individual to access your project's environment variables.

Sometimes you need to share environment variables with an external team or contractor, but you don't want to add them to your organization. Use this add-on for such a scenario.

External Team support takes just a click and then sharing the [infrastructure token](/docs/security/env-it). They will receive pull access only.

### Instructions

##### Step1

Navigate to the add-ons tab. Click External Share. Then click Add. Follow the prompts.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671899965/Dotenv_2_wvimjt.png" %}

##### Step2

On the next page, you will receive a usage example. It is a curl command that looks something like this.

```
curl --fail -d "DOTENV_VAULT=vlt_bd9e11..&DOTENV_ME=it_b6a8bc.." -X POST https://vault.dotenv.org/pull.txt > .env
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671899965/Dotenv_3_cob0qz.png" %}

##### Step3

Run the command in your terminal. It will securely fetch the environment variables and write them to a .env file on your machine.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671899977/external-share-2_kzdysp.gif" %}

That's it!


