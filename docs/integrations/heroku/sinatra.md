---
layout: docs
title: "Heroku with Sinatra - Integrations"
redirect_from:
  - /docs/integrations/heroku-sinatra
---

{% include icons/heroku.html width="50" color="#430098" %}
{% include icons/sinatra.html width="50" color="#000000" %}

# Heroku with Sinatra

Learn how to make Heroku, Sinatra, and Dotenv Vault work together. This tutorial assumes you have already created a `.env` file and [synced it](/docs/tutorials/sync).

## Set up Sinatra and require dotenv-vault

Set up your Sinatra app to work with Heroku and require [dotenv-vault](https://github.com/motdotla/dotenv-vault-ruby). Require it as early as possible in your sinatra application. 

```
# server.rb
require 'sinatra'
require 'dotenv-vault/load'

get '/' do
  "Welcome to #{ENV["HELLO"]}"
end
```
Example shows using environment variable [example](https://github.com/motdotla/dotenv_sinatra/blob/master/server.rb)

```
// Add 'dotenv-vault-rails' to Gemfile
gem 'dotenv-vault-rails'
```

[example](https://github.com/motdotla/dotenv_sinatra/blob/master/Gemfile)

Run bundle install.

```
$ bundle install
```

## Run dotenv-vault build

On your terminal at root of your project run npx dotenv-vault build to build your encrypted .env.vault file.

```
$ npx dotenv-vault build
```

## Get DOTENV_KEY

Run npx dotenv-vault keys production.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

## Set DOTENV_KEY

Visit your Heroku Project's Environment Variables under settings of your heroku application

Set **DOTENV_KEY** to the value returned in step 4.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-19_at_4.01.32_PM_ibbdwq.png" %}

## Commit and push

That's it! 

Commit those changes safely to code and deploy to Heroku.

When the build runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.
