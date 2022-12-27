---
layout: docs
title: "AWS Parameter Store - Add-ons"
---

{% include helpers/reading_time.html %}

{% include icons/aws.html width="50" color="#232F3E" %}

##### Add-ons

# AWS Parameter Store

Sync your secrets to AWS Parameter Store when an environment variable is changed.

### Instructions

##### Step1

Navigate to the add-ons page. Click AWS Parameter Store. Then click Connect AWS Secrets.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672120610/development-Dotenv_18_evhrln.png" %}

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

##### Step3

Lastly, set up the AWS Parameter Store config path and region.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1672120611/development-Dotenv_19_mmgxnw.png" %}

That's it! 🎉 Your secrets are now synced to AWS Parameter Store and will continue to stay in sync when you modify your secrets.

Thank you for using Dotenv with AWS Parameter Store.
