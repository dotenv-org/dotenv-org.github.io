---
layout: docs
title: "GitLab CI/CD Quickstart - Integrations"
redirect_from:
  - /docs/integrations/gitlab-ci-quickstart
---

{% include helpers/reading_time.html %}

{% include icons/gitlab.html width="50" color="#FC6D26" %}

##### Integrations

# GitLab CI/CD Quickstart

In this tutorial, learn how to integrate Dotenv Vault with GitLab CI/CD.

This tutorial extends GitLab's [Get Started with GitLab CI/CD tutorial](https://docs.gitlab.com/ee/ci/quick_start/). We recommend you check that out first.

## Install dotenv-vault

GitLab's CI/CD getting started guide doesn't include a program so let's add one.

We'll write a ruby application, but you could write this in your preferred language.

```
// index.rb
puts "Hello #{ENV["HELLO"]}"
```

Run the program.

```
$ ruby index.rb
```

It outputted 'Hello '. Add a .env file and install dotenv-vault-ruby.

```
# .env
HELLO="World"
```
<small>ProTip: Make sure to add .env to your gitignore file.</small>

```
$ gem install dotenv-vault
```

```
# index.rb
require "dotenv-vault/load"

puts "Hello #{ENV["HELLO"]}"
```
[example](https://github.com/dotenv-org/integration-example-gitlab-ci-quickstart/blob/master/index.rb)

Run the program again.

```
$ ruby index.rb
```

It outputted 'Hello World'. Great! Now that we have a program, let's move on to the .gitlab-ci.yml file.

## Edit gitlab-ci.yml

For the sake of demonstration, let's simplify .gitlab-ci.yml to just one build job.

```
image: ruby:2.6

build-job:
  stage: build
  script:
    - gem install dotenv-vault
    - ruby index.rb
```
ProTip: Note the ruby version. GitLab defaults to 2.5 but we need 2.6 or greater.

Commit those changes and push to GitLab. The CI will run and display 'Hello '.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666293919/Screen_Shot_2022-10-20_at_12.22.56_PM_wjv1db.png" %}

Next, we need to build our encrypted .env.vault file.

## Build .env.vault

First set a CI value. Run **dotenv-vault open** to edit CI values.

```
$ npx dotenv-vault open ci
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666294278/Screen_Shot_2022-10-20_at_12.30.24_PM_mxkz56.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your .env.vault file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Set DOTENV_KEY

Lastly, set the DOTENV_KEY on GitLab.

Run npx dotenv-vault keys ci to get your CI decryption key.

```
$ npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

Then in GitLab, go to your project’s Settings > CI/CD and expand the Variables section. Then click 'Add variable'. [More details](https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project)

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666303626/Screen_Shot_2022-10-20_at_3.05.38_PM_sdfeax.png" %}
<small>ProTip: Uncheck 'Protect variable' if you intend to use this on unprotected branches (the common case for CI/CD).</small>

One last step, GitLab requires you additionally assign the variable. Update your .gitlab-ci.yml to the following.

```
image: ruby:2.6

variables:
  DOTENV_KEY: $DOTENV_KEY

build-job:
  stage: build
  script:
    - gem install dotenv-vault
    - ruby index.rb
```

That’s it!

Commit your changes to code and push to GitLab.

When the build runs, it will recognize the DOTENV_KEY, decrypt the .env.vault file, and load the CI environment variables to GitLab CI/CD. If a DOTENV_KEY is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666304043/Screen_Shot_2022-10-20_at_3.13.20_PM_cfylzk.png" %}
