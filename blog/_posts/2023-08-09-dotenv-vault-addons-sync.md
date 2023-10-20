---
layout: tailwind-blog
author: mot
title: "Dotenv Vault add-ons to sync secrets with"
image: "/assets/img/blog/dotenv-vault-addons/dotenv-vault-addons-sync-cover.png"
excerpt: "Start syncing secrets seamlessly across popular platforms like AWS, Heroku, and Vercel in just a few clicks with these Dotenv Vault add-ons."
published: false
---

Start syncing secrets seamlessly across popular platforms like AWS, Heroku, and Vercel in just a few clicks with these Dotenv Vault add-ons.

Contrary to popular belief, managing environment variables isn't a daunting task - not when you have Dotenv Vault at your disposal. Our powerful tool employs a myriad of addons designed to enhance your experience and make secret management more efficient than ever. 

These addons serve as extensions, augmenting the capabilities of Dotenv Vault and allowing integration of several platforms for a unified secret management approach.

- [Dotenv Vault add-ons to sync secrets with](#dotenv-vault-add-ons-to-sync-secrets-with)
  - [Exploring the Dotenv Vault sync add-ons](#exploring-the-dotenv-vault-sync-add-ons)
    - [Syncing Dotenv Vault with the AWS Parameter Store](#syncing-dotenv-vault-with-the-aws-parameter-store)
    - [Integrating Dotenv Vault with AWS Secrets](#integrating-dotenv-vault-with-aws-secrets)
    - [Connecting Dotenv Vault to Heroku](#connecting-dotenv-vault-to-heroku)
    - [Linking Dotenv Vault with Vercel](#linking-dotenv-vault-with-vercel)
  - [Bringing it all together](#bringing-it-all-together)

## Exploring the Dotenv Vault sync add-ons

[Dotenv Vault add-ons](https://www.dotenv.org/docs/addons) are built to facilitate the seamless synchronization of secrets. They offer a platter of functionalities that not only address your secret management needs but also optimize the efficiency of your workflows.

When it comes to deploying secrets efficiently, add-ons play a pivotal role. Integrating an add-on like [AWS Parameter Store](https://www.dotenv.org/docs/addons/aws-parameter-store), [AWS Secrets](https://www.dotenv.org/docs/addons/aws-secrets), [Heroku](https://www.dotenv.org/docs/addons/heroku), or [Vercel](https://www.dotenv.org/docs/addons/vercel) can lead to efficient deployment and synchronization. Modify an environment variable and voila - your secrets are immediately synced to your selected platform.

### Syncing Dotenv Vault with the AWS Parameter Store

The [AWS Parameter Store add-on](https://www.dotenv.org/docs/addons/aws-parameter-store) serves as a bridge between Dotenv Vault and AWS Parameter Store, a secure and scalable configuration service provided by AWS. This add-on responds to any changes in your environment variables by syncing your secrets to AWS Parameter Store.

To initiate this, you first navigate to the add-ons page, click on [AWS Parameter Store](https://www.dotenv.org/docs/addons/aws-parameter-store), and connect it. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Parameter-Store-add-on-connect.png" %}
*Figure 1: Syncing Dotenv Vault with the AWS Parameter Store; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-parameter-store)*

There onwards, you generate your AWS IAM User, paste in the credentials, and set up the AWS Parameter Store configuration path and region. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Parameter-Store-add-on-IAM-User.png" %}
*Figure 2: Entering AWS IAM User details in the Dotenv Vault add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-parameter-store)*

Here’s an example IAM User policy you can use for the process:

```jsx
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:PutParameter",
                "ssm:DeleteParameter",
                "ssm:GetParameterHistory",
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameter",
                "ssm:DeleteParameters",
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        }
    ]
}
```

Voila! Your secrets are now in sync with AWS Parameter Store and will remain so even when you modify your secrets.

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Parameter-Store-add-on-app.png" %}
*Figure 3: Finalizing the Dotenv Vault AWS Parameter Store add-on integration; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-parameter-store)*

### Integrating Dotenv Vault with AWS Secrets

Similarly, the [AWS Secrets add-on](https://www.dotenv.org/docs/addons/aws-secrets) connects Dotenv Vault to AWS Secrets, offering another alternative for secret synchronization. 

The process is equally intuitive, beginning from the [add-ons page](https://www.dotenv.org/docs/addons) on your Dotenv Vault dashboard.

This time, you select [AWS Secrets](https://www.dotenv.org/docs/addons/aws-secrets) and once again, click to connect. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Secrets-add-on-connect.png" %}
*Figure 4: Connecting Dotenv Vault with the AWS Secrets add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-secrets)*

After providing your AWS IAM User credentials, you proceed to set up the AWS Secrets configuration path and region. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Parameter-Store-add-on-IAM-User.png" %}
*Figure 5: Entering AWS IAM User details in the Dotenv Vault add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-secrets)*

You can use this sample IAM User policy to get started:

```jsx
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:UntagResource",
                "secretsmanager:DescribeSecret",
                "secretsmanager:DeleteResourcePolicy",
                "secretsmanager:PutSecretValue",
                "secretsmanager:CreateSecret",
                "secretsmanager:DeleteSecret",
                "secretsmanager:CancelRotateSecret",
                "secretsmanager:ListSecretVersionIds",
                "secretsmanager:UpdateSecret",
                "secretsmanager:GetRandomPassword",
                "secretsmanager:GetResourcePolicy",
                "secretsmanager:GetSecretValue",
                "secretsmanager:StopReplicationToReplica",
                "secretsmanager:PutResourcePolicy",
                "secretsmanager:ReplicateSecretToRegions",
                "secretsmanager:RestoreSecret",
                "secretsmanager:RotateSecret",
                "secretsmanager:UpdateSecretVersionStage",
                "secretsmanager:ValidateResourcePolicy",
                "secretsmanager:RemoveRegionsFromReplication",
                "secretsmanager:ListSecrets",
                "secretsmanager:TagResource"
            ],
            "Resource": "*"
        }
    ]
}
```

Just like that, your secrets are now mirrored in AWS Secrets, maintaining synchronization whenever an alteration occurs in your secrets.

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-AWS-Secrets-add-on-app.png" %}
*Figure 6: Finalizing the Dotenv Vault AWS Parameter Store add-on integration; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/aws-secrets)*

### Connecting Dotenv Vault to Heroku

The [Heroku add-on](https://www.dotenv.org/docs/addons/heroku) links Dotenv Vault to Heroku, establishing a connection where a change in your environment variables triggers a secret sync to Heroku.

Once you select Heroku in the [add-ons page](https://www.dotenv.org/docs/addons) and click to connect Heroku, you will be redirected to Heroku's website. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-Heroku-add-on-connect.png" %}
*Figure 7: Syncing Dotenv Vault with Heroku via add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/heroku)*

Upon granting Dotenv the permission to sync config vars between Heroku and Dotenv, the only step left is to choose an app from the dropdown, select it, and finalize the configuration. Now, your secrets are in a constant sync between Dotenv and Heroku.

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-Heroku-add-on-app.png" %}
*Figure 8: Finalizing the Dotenv Vault-Heroku add-on integration; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/heroku)*

### Linking Dotenv Vault with Vercel

The [Vercel add-on](https://www.dotenv.org/docs/addons/vercel) consolidates Dotenv Vault and Vercel, offering an effective sync solution for your secrets. 

This add-on is initialized from its dedicated page where you select `Add Vercel` and click to connect.

Following this, generate your Vercel API token on the platform and paste it in. 

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-Vercel-add-on-API-token.png" %}
*Figure 9: Linking Dotenv Vault to Vercel via add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/vercel)*

The last step involves choosing the project to sync with and clicking to finish the configuration. You now have your secrets synced to Vercel, with the sync staying intact when you modify your secrets.

{% include helpers/screenshot.html url="/assets/img/blog/dotenv-vault-addons/Dotenv-Vault-Vercel-add-on-app.png" %}
*Figure 10: Selecting a Vercel project for the Dotenv Vault add-on; Source: [Dotenv Vault](https://www.dotenv.org/docs/addons/vercel)*

## Bringing it all together

Dotenv Vault and its sync add-ons open up a world of possibilities in unified secret management. These add-ons bring a new level of versatility to Dotenv Vault, empowering you to seamlessly sync with different platforms for maximum accessibility.

Thanks to this, you get to experience a more streamlined and secure secret management process, with the continuous sync of secrets between varying services and platforms. The customizable nature of Dotenv Vault, amplified by plugin integration, makes sure it caters to your specific needs.

In conclusion, add-ons in Dotenv Vault can greatly expand its capabilities, reshaping it as a more potent, successful, and user-centric tool for your secret management. They represent a true step forward in the push for safer and more efficient ways to handle environment variables and secrets. 

As the technological landscape continues to evolve, these add-ons will undoubtedly play a significant role in helping developers like yourself maintain and boost security in a rapidly changing digital environment.
