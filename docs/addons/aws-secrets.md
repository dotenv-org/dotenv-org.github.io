---
layout: docs
title: "AWS Secrets - Add-ons"
---

{% include icons/aws.html width="50" color="#232F3E" %}

##### Add-ons

# AWS Secrets

Sync your secrets to AWS Secrets when an environment variable is changed.

### Instructions

##### Step1

Navigate to the add-ons page. Click AWS Secrets. Then click Connect AWS Secrets.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119659/development-Dotenv_15_mg2ty6.png" %}

##### Step2

On the next page, generate your [AWS IAM User](https://us-east-1.console.aws.amazon.com/iamv2/home#/users) and paste in the credentials.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119659/development-Dotenv_16_vbnmf5.png" %}

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119659/IAM-Management-Console_rkcvqe.png" %}

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119659/IAM-Management-Console_1_ntzh25.png" %}

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119659/IAM-Management-Console_2_coxt9d.png" %}

Important: The AWS IAM user must have correct permissions. Below is an example. Modify for your security needs.

```
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

##### Step3

Lastly, set up the AWS Secrets config path and region.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672119658/development-Dotenv_17_pmxu4z.png" %}

That's it! 🎉 Your secrets are now synced to AWS Secrets and will continue to stay in sync when you modify your secrets.

Thank you for using Dotenv with AWS Secrets.
