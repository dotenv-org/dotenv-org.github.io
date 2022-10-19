---
layout: docs
title: "Heroku with Rails - Integrations"
---

{% include helpers/reading_time.html %}

##### Integrations

# Heroku with Rails

Learn how to make Heroku, Rails, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

## 1. Set up Rails app for Heroku

Set up your Rails app to work with Heroku.

Example shows using environment variable [example](https://github.com/dotenv-org/integration-example-heroku-rails/blob/374e9a3e5e5f6ffe2f4a83f08bf2c0222871ed40/app/views/welcome/index.html.erb)

```
// Add 'dotenv-vault-rails' to Gemfile
gem 'dotenv-vault-rails'
```

[example](https://github.com/dotenv-org/integration-example-heroku-rails/blob/374e9a3e5e5f6ffe2f4a83f08bf2c0222871ed40/Gemfile#L4)

Run bundle install.

```
$ bundle install
```

## 2. Require dotenv-vault-ruby

Require [dotenv-vault-ruby](https://github.com/dotenv-org/dotenv-vault-ruby).

Require it as early as possible in your Rails application. For rails application require dotenv-vault/load in application.rb

```
// config/application.rb
require 'dotenv-vault/load'
```

[example](https://github.com/dotenv-org/integration-example-heroku-rails/blob/374e9a3e5e5f6ffe2f4a83f08bf2c0222871ed40/config/application.rb#L4)

## 3. Run dotenv-vault build

On your terminal at root of your project run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## 4. Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## 5. Set DOTENV_KEY

Visit your Heroku Project's Environment Variables under settings of your heroku application

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666175727/Screen_Shot_2022-10-19_at_4.01.32_PM_ibbdwq.png" %}

## 6. Commit and push

That's it! 

Commit those changes safely to code and deploy to Heroku.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
