---
layout: changelog
author: mot
title: "Changed how the build command works to minimize nonce collisions"
---

Now, `npx dotenv-vault build` regenerates itself only if there are changes.

This increases security and improves DX.

It improves security by minimizing the chance of a nonce collision - which would expose your DOTENV_KEY. (Please note this is still incredibly rare. You would have to rebuild your .env.vault file a few billion times before this might occur. Nonetheless, we prefer to minimize the possibility.)

It improves DX because it follows the principle of least surprise. You will see your .env.vault file change only after you've changed your values.

{% include helpers/screenshot.html url="/assets-www/img/cloudinary/smarter-build_kglslt.gif" %}

