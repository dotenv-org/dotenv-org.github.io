---
layout: changelog
author: mot
title: "dotenv-vault local commands"
---

You can now run the following three commands to generate your own **.env.vault** file, without relying on dotenv.org to do it for. It works by managing all your secrets completely locally.

* npx dotenv-vault local build
* npx dotenv-vault local decrypt
* npx dotenv-vault local keys

Upgrade to [dotenv-vault@1.19.0](https://github.com/dotenv-org/dotenv-vault/blob/master/CHANGELOG.md#1190-2023-04-06) to use them. You can read more about these commands [here](https://github.com/dotenv-org/dotenv-vault#local-build).
