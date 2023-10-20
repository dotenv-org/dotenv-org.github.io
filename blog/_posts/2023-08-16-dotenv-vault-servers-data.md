---
layout: blog
author: mot
title: "How Dotenv Vault servers handle data"
image: "/assets/img/blog/dotenv-vault-server-data/dotenv-vault-server-data-cover.png"
excerpt: "Examine how Dotenv Vault prioritizes your data's confidentiality and integrity, making it a trusted choice for all your secret management needs."
published: false
---

Examine how Dotenv Vault prioritizes your data's confidentiality and integrity, making it a trusted choice for all your secret management needs.

In the evolving digital landscape, we at Dotenv Vault recognize the paramount importance of data security. As the reliance on tools for managing sensitive data grows, understanding the mechanisms behind these tools becomes essential. At Dotenv Vault, we've meticulously designed our system with a profound emphasis on data security. 

That being said, let's explore the intricate processes and methodologies that we've implemented to ensure your secrets remain confidential. From our choice of encryption standards to our data storage strategies, we aim to provide transparency about the layers of security that make Dotenv Vault a trusted choice for professionals globally.

- [How Dotenv Vault servers handle data](#how-dotenv-vault-servers-handle-data)
  - [A closer look at the security workflow](#a-closer-look-at-the-security-workflow)
    - [Role of SSL in Dotenv Vault](#role-of-ssl-in-dotenv-vault)
    - [Why AES-256 GCM encryption?](#why-aes-256-gcm-encryption)
    - [Key rotation and its impact on security](#key-rotation-and-its-impact-on-security)
  - [The Dotenv Vault Store](#the-dotenv-vault-store)
    - [The strategy behind value-only storage](#the-strategy-behind-value-only-storage)
    - [Understanding TLS requirements and encryption clients](#understanding-tls-requirements-and-encryption-clients)
  - [Bringing it all together](#bringing-it-all-together)

## A closer look at the security workflow

Dotenv Vault follows a robust and secure process to handle data. When you sync your `.env` file with Dotenv Vault, it initializes an encrypted connection. Your `.env` file is encrypted and safely transported over `SSL` to Dotenv Vault's in-memory servers. This shielded payload is decrypted and momentarily preserved in memory. 

Importantly, Dotenv Vault ensures that the memory is completely flushed post the completion of necessary tasks, and the decrypted data never finds a permanent corner on the Dotenv systems. The entire process ensures an uncompromised defense line, keeping your secrets secure while they're handled within the Dotenv Vault.

{% include helpers/screenshot.html url="/assets/img/blog/common/dotenv_vault_security_overview.png" %}
*Figure 1: The Dotenv Vault security workflow; Source: [Dotenv Vault](https://www.dotenv.org/security/)*

### Role of SSL in Dotenv Vault

`SSL` is a critical component of the Dotenv Vault. `SSL` establishes an encrypted link between a web server and a browser to ensure that all data transferred between the web server and browsers remains private.

In the context of Dotenv Vault, your `.env` file is encrypted and sent securely over an `SSL` connection to the in-memory servers of Dotenv Vault. This encrypted connection provides a secure conduit for your sensitive data to travel without the risk of intercepts or manipulations by malicious actors. 

By employing `SSL`, our solution adheres to contemporary security standards, assuring the privacy and integrity of your data while in transit.

### Why AES-256 GCM encryption?

`AES-256 GCM`, or Advanced Encryption Standard-Galois/Counter Mode, is a high-security algorithm utilized in Dotenv Vault for its plethora of benefits. It is well-studied, endorsed by the National Institute of Standards and Technology, and is an IETF (Internet Engineering Task Force) standard.

Moreover, `AES-256 GCM` provides fast operations, thanks to its specific instruction set. In Dotenv Vault's process, both `KEY` and `VALUE` are encrypted with different master encryption keys using the `AES-GCM` method.

This ensures that even if an attacker manages to gain access to the decryption key of the `VALUE`, they cannot decrypt the data or identify the associated secret. The `AES-GCM` encryption safeguards your Vault, additionally solidified by the rotation of all master encryption keys on an unpublished schedule. This level of security contributes significantly to making Dotenv Vault a trusted solution for secrets management.

### Key rotation and its impact on security

Rotating encryption keys on an unpublished schedule is a step towards enhancing security in our secret manager. Occasionally shifting to new encryption keys ensures that an old, and possibly compromised key, is not the most recent one that attackers may possess.

Historically, frequent key rotation has been used as a safety measure to limit the amount of data encrypted with a single key. This practice can also prevent the key from being cracked by exhaustively trying possible key combinations.

For Dotenv Vault, changing to an unexpected schedule of encryption key rotation decreases the predictability of the key, adding to the strength and robustness of Dotenv Vault security.

The `AES-256 GCM` encryption employed by Dotenv Vault, combined with frequent key rotation ([also available for projects via CLI](https://www.dotenv.org/docs/dotenv-vault/rotatekey)), makes it a formidable tool for secrets management. The stringent security decisions and processes are what makes Dotenv Vault reliable, proven, and trusted tool for secrets management.

## The Dotenv Vault Store

In the heart of Dotenv Vault lies the Dotenv Vault Store. This is where the encrypted `VALUE` is sent for safe-keeping. The store then returns a token as an identifier that is used for securely mapping the `KEY` to the `VALUE` for future secure-read operations.

The Dotenv Vault Store provides a multitude of security features such as:

- A separate datastore from the application database.
- Non-accessible via the internet preventing all external connections.
- First-party secret storage eliminating reliance on third-party integrations.

The `AES-GCM` encrypted `VALUE` is secured with a [unique identifier (token)](https://www.dotenv.org/docs/security/env-it) and sent to the Dotenv Vault Store for preservation. The encrypted `KEY` and `TOKEN` are then stored together in the application database. 

Tokenization aids the process of data security by assuring that even if the data is intercepted or breached, it remains unintelligible and non-exploitable. This is made possible as the token generated does not carry any explicit meaning, thereby enhancing the layer of confidentiality to your data.

### The strategy behind value-only storage

This strategy is a testament to Dotenv Vault's commitment to security. The Dotenv Vault Store, essential as it is, only stores the `VALUE`, while the `KEY` is stored in the application database.

Now, what purpose does this bifurcation serve?

This separation divides the availability of information and ensures that even if an attacker gains access to one of the databases, they fail to make sense of the data as they possess only half of the puzzle.

So even if an attacker gains access to the application database, they won't be able to access the vault datastore, and vice versa, contributing largely to the security strength of Dotenv Vault.

### Understanding TLS requirements and encryption clients

While the Dotenv Vault Store is not directly accessible via the internet, certain requirements must be met for permitted connections. One of the requirements is a higher standard for Transport Layer Security (`TLS`). To connect to the Dotenv Vault datastore, the deprecated `TLS 1.0` cannot be used, ensuring better secure transmission of data.

Furthermore, clients looking to connect with the datastore need to be encrypted. These encrypted clients must connect through the application which has its own layers of encryption, again enhancing security.

Encryption clients and stricter `TLS` requirements play a pivotal role in maintaining data privacy and meeting security standards in Dotenv Vault. This layered approach to protection, with shielded layers of the application, encryption requirements, and advanced `TLS` policies strengthens the robustness of our secret manager’s security.

## Bringing it all together

Within the vast domain of secrets management, at Dotenv Vault we pride ourselves on our rigorous approach to data security. By employing advanced encryption standards, strategic data storage, and stringent security protocols, we ensure that every piece of sensitive data is treated with the utmost respect and care. Our commitment to continuous improvement, demonstrated by practices like key rotation and strict TLS requirements, is a testament to our dedication to earning and maintaining user trust. 

As we navigate the ever-expanding digital realm, our team remains committed to safeguarding your most precious digital assets. Entrusting us with your secrets means placing them in a system built on integrity, innovation, and an unwavering dedication to security.
