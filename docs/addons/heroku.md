---
layout: docs
title: "Heroku - Add-ons"
---

{% include icons/heroku.html width="50" color="#430098" %}

##### Add-ons

# Heroku

Sync your secrets to Heroku when an environment variable is changed.

### Instructions

##### Step1

Navigate to the add-ons page. Click Heroku. Then click Connect Heroku.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672117009/development-Dotenv_13_zmhxmk.png" %}

##### Step2

You will be redirected to Heroku's website. Click Allow. This grants Dotenv access to sync config vars between Heroku and Dotenv.

That completes the steps to authorize Dotenv with Vercel.

##### Step3

The last step is to select an app from the drop down. Choose the app and click Finish Configuration.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672117008/development-Dotenv_14_pwrnhc.png" %}

That's it! 🎉 Your secrets are now synced to Heroku and will continue to stay in sync when you modify your secrets.

Thanks for using Dotenv.
