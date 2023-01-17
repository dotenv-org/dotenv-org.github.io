---
layout: docs
title: "GitHub - Add-ons"
---

{% include icons/github.html width="50" color="#181717" %}

##### Add-ons

# GitHub

Auto-build encrypted .env.vault file. Generate a PR on GitHub when a development environment variable is changed.

It can become a chore to run `npx dotenv-vault build` each time you are ready to deploy new secret changes. Let GitHub do it for you with this automation add-on.

### Instructions

##### Step1

Navigate to the add-ons tab. Click GitHub. Then click Add and follow the prompts.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671833645/development-Dotenv_3_omsmdq.png" %}

##### Step2

You will be redirect to GitHub's website. Follow the OAuth flow.

That completes the steps to authorize Dotenv with GitHub.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671833644/development-Dotenv_4_rcd5d9.png" %}

##### Step3

The last step is to select the organization and repository. Choose your organization from the dropdown and enter the full the url of your GitHub repository.

Then set the base branch. In most cases, this is **master** or **main**.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671833644/development-Dotenv_5_kwwspz.png" %}

Once that is complete, you will receive a generated pull request on that repository. It will look something like this:


{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1671834259/Screen_Shot_2022-12-23_at_2.11.29_PM_gr1cwu.png" %}

That's it!

Each time your team makes a change to an environment variable, GitHub will generate a pull request with the latest built **.env.vault file**.

