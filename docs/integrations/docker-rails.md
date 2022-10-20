---
layout: docs
title: "Docker with Rails - Integrations"
---

{% include helpers/reading_time.html %}

##### Integrations

# Docker with Rails

In this tutorial, learn how to integrate Dotenv Vault with Docker and a Rails application.

## Dockerfile

Create your Dockerfile in your rails application

```
# Dockerfile
FROM ruby:2.7.4
RUN apt-get update && apt-get install -y nodejs
WORKDIR /app
COPY Gemfile* .
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
```
[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/master/Dockerfile)

Here's an example of a simple welcome index page that runs on docker.

```
// welcome/index.html.erb
<h1>Welcome <%= ENV["HELLO"] %></h1>
```
[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/master/app/views/welcome/index.html.erb)


## Install dotenv-vault

Create your local `.env` file.

```
HELLO="Rails on docker"
```

Add dotenv-vault-rails gem to Gemfile
```
// Add 'dotenv-vault-rails' to Gemfile
gem 'dotenv-vault-rails'
```

[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/8fdcf12cbd6b17adec2e6dfd5875bccf7e7d28a3/Gemfile#L5)

Require [dotenv-vault](https://github.com/dotenv-org/dotenv-vault-ruby) as early as possible in your Rails application. For a Rails application require dotenv-vault/load in application.rb

```
// config/application.rb
require 'dotenv-vault/load'
```

Build your rails application via docker by running
```
docker build  -t demo .
```

Test that it is working locally.

```
$ docker run -p 3000:3000 demo
```
{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666264420/Screen_Shot_2022-10-20_at_4.42.53_PM_eacjcf.png" %}

It says **Hello Rails on docker** at [http://localhost:3000](http://localhost:3000).

## Build .env.vault

First set a production value for when we deploy. I set it to **HELLO=Production**. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666194964/Screen_Shot_2022-10-19_at_8.55.13_AM_ej1bk5.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Set DOTENV_KEY

Lastly, set the **DOTENV_KEY** on the docker run command.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Set it for Docker run. The important part here is the `-e` flag.

```
$ docker build -t demo . && docker run -e DOTENV_KEY="dotenv://:key1234@dotenv.org/vault/.env.vault?environment=production" -p 3000:3000 --init demo
```
{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666265694/Screen_Shot_2022-10-20_at_4.59.50_PM_idxvjy.png" %}


That's it! 

Commit your changes to code and deploy your Docker image to your infrastructure.

When Docker runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables inside of Docker. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

It worked if you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666265861/Screen_Shot_2022-10-20_at_5.06.44_PM_xwrwj8.png" %}
