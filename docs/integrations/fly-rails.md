---
layout: docs
title: "Fly.io with Rails - Integrations"
---

{% include helpers/reading_time.html %}

##### Integrations

# Fly.io with Rails

In this tutorial, learn how to integrate Dotenv Vault with Fly.io and a Rails application.

## Deploy to Fly.io

Deploy your Rails app to fly.io.

```
flyctl launch
```

Here's an example of a simple welcome index page that runs on Fly.io.

```
// welcome/index.html.erb
<h1>Welcome <%= ENV["HELLO"] %></h1>
```
[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/master/app/views/welcome/index.html.erb)

That will deploy your Rails app to Fly's infrastructure.

## Install dotenv-vault

Create your local `.env` file.

```
HELLO="Rails on fly"
```

Add dotenv-vault-rails gem to Gemfile
```
// Add 'dotenv-vault-rails' to Gemfile
gem 'dotenv-vault-rails'
```

[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/8fdcf12cbd6b17adec2e6dfd5875bccf7e7d28a3/Gemfile#L5)

Run bundle install.

```
$ bundle install
```
Require [dotenv-vault](https://github.com/dotenv-org/dotenv-vault-ruby).

Require it as early as possible in your Rails application. For a Rails application require dotenv-vault/load in application.rb

```
// config/application.rb
require 'dotenv-vault/load'
```

Test that it is working locally and go to welcome page.

```
$ rails s
```

It says **Hello Rails on fly** at [http://localhost:3000](http://localhost:3000).

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666257784/Screen_Shot_2022-10-20_at_2.52.41_PM_v2ovxx.png" %}


## Build .env.vault

First set a production value for when we deploy. I set it to **HELLO=Production**. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666258002/Screen_Shot_2022-10-20_at_2.54.46_PM_zgadob.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Set DOTENV_KEY

Lastly, set the **DOTENV_KEY** on Fly.io.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set it on Fly.io

```
$ flyctl secrets set RAILS_ENV=production DOTENV_KEY='dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production'
```

WARNING: The single apostrophe is important. Otherwise, Fly.io will truncate the DOTENV_KEY incorrectly and decryption will not work.

That's it! 

Commit your changes to code and run:

```
$ flyctl deploy
```

When the deploy runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to Fly.io. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
