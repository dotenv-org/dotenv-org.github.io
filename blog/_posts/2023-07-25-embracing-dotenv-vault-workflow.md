---
layout: blog
author: mot
title: "Embracing the Dotenv Vault workflow"
image: "/assets/img/blog/embracing-workflow/embracing-dotenv-vault-workflow-cover.png"
excerpt: "Learn how you can seamlessly manage sensitive data, ensure high-level security, and simplify your developer experience from SecOps to DevOps with the streamlined Dotenv Vault workflow."
---

{% include helpers/reading_time.html %}

Embracing the Dotenv Vault workflow
======

Managing application configuration centrally necessitates careful attention to secret data like API keys and database credentials. Such confidential information, often dispersed across codebases, is challenging to manage and exposes security risks. 

Secret Management is the key to addressing this—a secure workflow for storing, retrieving, and sharing secret data without exposing it in the application code. And this is where Dotenv Vault comes into play!

## Bridging the gap between SecOps and DevOps

Dotenv Vault acts as a unified solution for secret and developer operations (SecOps and DevOps). It simplifies secret management, eliminating the need for multiple platforms and tools.

Our solution replaces messy manual secret handling with a sleek process that effectively manages secrets across various environments. It allows secrets to be synchronized and deployed like code, making management easier. Its features range from robust encryption to efficient CLI interactions.
<div style="background: #b8e5ff; padding: 1rem; color: black; margin-bottom: 2%">ℹ Discover the <a href="https://www.dotenv.org/blog/2023/06/27/tackling-pitfalls-manual-.env-file-sharing.html">pitfalls of manual .env sharing here</a>.</div>

As a single toolkit, Dotenv Vault eliminates dependency on multiple platforms and tools, simplifying the process. With it, managing secrets across different environments becomes as simple as managing your codebase.

## Fostering an efficient workflow with Dotenv Vault

Dotenv Vault simplifies the otherwise complex task of syncing and deploying secrets. Here's how:
1. **Developer experience simplicity:** Designed by developers, Dotenv Vault offers simplicity and powerful CLI interactions. Setup requires only [two lines of CLI input](https://www.dotenv.org/docs/sync/quickstart) and there are no strict request limits, supporting an unrestricted workflow for a smooth user experience.
    ```shell
    # create a new Dotenv Vault project and login
    # flags: -y, --yes  Automatic yes to prompts. Assume yes to all prompts and run non-interactively.
    npx dotenv-vault new [DOTENV_VAULT] [-y] 
    npx dotenv-vault login [DOTENV_ME] [-y] 
    ```
    <div style="background: #b8e5ff; padding: 1rem; color: black; margin-bottom: 2%">ℹ See how Dotenv Vault makes <a href="https://www.dotenv.org/blog/2023/07/11/making-secret-management-easy.html">secret management easy here</a>.</div>
2. **Code-like syncing and deployment:** Dotenv Vault revolutionizes secret syncing and deployment. It treats secrets like code, allowing updates to the `.env` file to be pushed and pulled like code revisions, ensuring the latest version is always used. 
    ```shell
    # .env file sync process with Dotenv Vault CLI
    # flags: -m, --dotenvMe= Pass .env.me (DOTENV_ME) credential directly (rather than reading from .env.me file)
    $ npx dotenv-vault@latest pull [ENVIRONMENT] [FILENAME] [-m ] [-y] 
    $ npx dotenv-vault@latest push [ENVIRONMENT] [FILENAME] [-m ] [-y]
    ```
3. **Granular environment management:** Dotenv Vault makes [managing multiple environments](https://www.dotenv.org/docs/tutorials/environments) like `Development`, `Staging`, `Production` effortless, setting them up with an intuitive user interface. Our solution even supports creating an `Example` environment for tutorials or guidance, showcasing Dotenv Vault's flexibility in managing various environments.
    ```shell
    # open a Dotenv Vault project or one of its environments via the Web GUI
    $ npx dotenv-vault@latest open [ENVIRONMENT] [-y]
    ```
4. **Robust core encryption:** Dotenv Vault provides robust security using [`AES-256 GCM` encryption](https://www.dotenv.org/security/). [`DOTENV_KEY`](https://www.dotenv.org/docs/security/dotenv-key) acts as the decryption key for [`.env.vault`](https://www.dotenv.org/docs/security/env-vault) files, ensuring secure access to secrets. Regular [rotation](https://www.dotenv.org/docs/dotenv-vault/rotatekey) of the `DOTENV_KEY` enhances security by limiting unauthorized access. 
    ```shell
    # build the .env.vault file and its decryption keys
    $ npx dotenv-vault@latest build [-m ] [-y]

    # fetch a given environment decryption key
    $ npx dotenv-vault@latest keys [ENVIRONMENT] [-m ] [-y]
    ```
    <div style="background: #b8e5ff; padding: 1rem; color: black; margin-bottom: 2%">ℹ Find more information on the <a href="https://www.dotenv.org/blog/2023/07/18/look-into-dotenv-vault-file-standards.html">Dotenv Vault file standards here</a>.</div>
5. **First-party storage:** Dotenv Vault's unique approach [eliminates reliance on third-party services](https://www.dotenv.org/blog/2023/07/04/overcoming-external-integrations-woes.html), reducing the risk of secrets leakage. Secrets are stored and managed in-house end-to-end, with encryption and decryption occurring in memory for [enhanced security](https://www.dotenv.org/security/).
   
By transforming complex processes into a simplified setup and code-like syncing, Dotenv Vault optimizes workflows and enhances security. Our solution has broken away from reliance on [third-party services](https://www.dotenv.org/blog/2023/07/04/overcoming-external-integrations-woes.html), storing secrets in-house for safer handling.

Dotenv Vault isn't just a toolkit, it's a breakthrough in secret management, delivering efficiency and security within your workflow. 

## Getting acquainted with the Dotenv Vault workflow

A strong understanding of the workflow our solution entails can significantly streamline your approach to secure secret management in applications. This workflow consists of a series of steps, with each aiming to improve the accessibility and handling of secrets.

1. **Create your application:** Initiate with any language, framework, or hosting platform.
    ```shell
    # initialize your application and install dependencies
    $ npm init
    $ npm install express express dotenv --save
    ```
2. **Integrate Dotenv Vault:** Embed Dotenv Vault into your app, setting secrets in the `.env` file.
    ```shell
    # create a new Dotenv Vault project and login
    $ npx dotenv-vault@latest new
    $ npx dotenv-vault@latest login
    ```
3. **Manage your secrets across environments:** Use the Web GUI to view and edit environment variables across different application versions.
    ```shell    
    # open your Dotenv Vault project, enter your secrets via the Web GUI, and pull latest changes to .env
    $ npx dotenv-vault@latest open
    $ npx dotenv-vault@latest pull production
    ```
4. **Synchronize your secrets:** Sync your `.env` file with Dotenv Vault to store it securely and make it accessible when needed.
    ```shell
    # pull your .env and push latest changes to your Dotenv Vault project
    $ npx dotenv-vault@latest pull
    $ npx dotenv-vault@latest push
    ```
6. **Build a project identifier and commit:** Build an encrypted `.env.vault` file, safely storing your secrets for codebase commits.
    ```shell
    # build your .env.vault and commit it 
    $ npx dotenv-vault@latest build
    $ git add .env.vault
    $ git commit -am "Build encrypted .env.vault file for deploy"
    ```
7. **Fetch the decryption key:** Get your `DOTENV_KEY` for the required environment and set it as an environment variable on your hosting platform.
    ```shell
    # obtain a .env.vault production decryption key 
    $ npx dotenv-vault@latest keys production
    # DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production' 

    # set your .env.vault decryption key as an environment variable on your hosting platform
    $ heroku config:set DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production'
    ```
8. **Finalize deployment:** Deploy to your hosting platform, decrypting the `.env.vault` file at runtime.
    ```shell
    $ DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production' node index.js
    # [dotenv@16.3.1][INFO] Loading env from encrypted .env.vault
    # Example app listening on port 3000
    ```

<div style="background: #b8e5ff; padding: 1rem; color: black; margin-bottom: 2%">ℹ Browse our <a href="https://www.dotenv.org/blog/2023/06/20/unlocking-secrets-dotenv-vault.html">ready-to-use Node.js examples</a> for more hands-on insight into the workflow.</div>

## Bringing it all together

Dotenv Vault provides secure and efficient secret management for your applications. It's all about keeping your sensitive data - like API keys or database credentials - safe, without cluttering your application's code.

Instead of manual chaos, our solution streamlines the process, treating secrets like code. It allows you to treat secrets just like code and respects your workflow by not imposing unnecessary limits.

In short, Dotenv Vault provides a safer, simpler, and more efficient way to manage your application's secrets. [Embrace Dotenv Vault](https://vault.dotenv.org/account/signup) for a safer, simpler, and efficient secret management process today.
<div style="background: #b8e5ff; padding: 1rem; color: black; margin-bottom: 2%">ℹ Explore more <a href="https://www.dotenv.org/blog/2023/06/20/unlocking-secrets-dotenv-vault.html">Dotenv Vault advantages here</a>.</div>