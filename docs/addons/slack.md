---
layout: docs
title: "Slack - Add-ons"
---

{% include helpers/reading_time.html %}

{% include icons/slack.html width="50" color="#4A154B" %}

##### Add-ons

# Slack

Notify your team on Slack when an environment variable is changed.

Connecting Dotenv to Slack takes just a couple clicks, instantly notifying your team of any secret changes.

### Instructions

##### Step1

Navigate to the add-ons tab. Click Slack. Then click Connect to Slack and follow the prompts.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1671822030/development-Dotenv_cnnle8.png" %}

##### Step2

You will be redirected to Slack's website. Select your organization (top right) and then click Allow. This grants Dotenv access to post messages in the Slack channel of your choosing.

That completes the steps to authorize Dotenv with Slack.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1671822030/Dotenv-development-is-requesting-permission-to-access-the-dotenv-Slack-workspace-dotenv-Slack_vwbe0v.png" %}

##### Step3

The last step is to select a channel. Enter your Channel ID and then click Finish Configuration.

(Find the Channel ID by clicking the channel name and scrolling to the bottom of the pop up modal.)

You should receive a notification in your Slack that Dotenv is configured 🎉.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,h_574,w_800/v1671822030/development-Dotenv_2_bnb5uv.png" %}

**ProTip:** If you do not receive the notification that Slack is configured correctly, you might need to additionally add the Dotenv app to your Slack. Type /add app in your Slack channel and then search for Dotenv and add it.

That's it!
