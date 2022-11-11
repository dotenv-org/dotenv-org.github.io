---
layout: changelog
author: mot
title: "Smarter Encrypted Builds - Changelog"
---

Now `npx dotenv-vault build` is smart enough to only regenerate itself if there are any new changes.

This increases security and improves DX.

It improves security because it minimizes the chance of a nonce collision - which would expose your `DOTENV_KEY`. Please note this is still incredibly rare. You would have to rebuild your .env.vault file a few billion times before this registers as a risk. Nonetheless, we prefer to minimize the possibility.

It improves DX because it follows the principle of least surprise. Seeing changes in your .env.vault encrypted file when no key/values had changed was confusing.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1668125581/smarter-build_kglslt.gif" %}

