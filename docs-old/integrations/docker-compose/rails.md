---
layout: docs
title: "Docker compose with Rails - Integrations"
redirect_from:
  - /docs/integrations/docker-compose-rails
---

{% include icons/docker.html width="50" color="#2496ED" %}
{% include icons/rails.html width="50" color="#CC0000" %}

# Docker Compose with Rails

In this tutorial, learn how to integrate Dotenv Vault with Docker Compose and a Rails application.

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

Create your docker-compose.yml
```
version: "3.9"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/demo
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      SECRET_KEY_BASE: 1
      DOTENV_KEY: ${DOTENV_KEY}
      RAILS_ENV: ${RAILS_ENV}

```
[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/master/docker-compose.yml)

Here's an example of a simple welcome index page that runs on docker.

```
// welcome/index.html.erb
<h1>Welcome <%= ENV["HELLO"] %></h1>
```
[example](https://github.com/dotenv-org/integration-example-fly-rails/blob/master/app/views/welcome/index.html.erb)


## Install dotenv-vault

Create your local `.env` file.

```
HELLO="Rails on docker compose"
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
docker compose build
```

Test that it is working locally.

```
$ docker compose up
```

It says **Hello Rails on docker compose** at [http://localhost:3000](http://localhost:3000).

## Build .env.vault

First set a production value for when we deploy. I set it to **HELLO=Production**. Run **dotenv-vault open** to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-19_at_8.55.13_AM_ej1bk5.png" %}

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
$ RAILS_ENV=production DOTENV_KEY="dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production" docker compose up
```
{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-20_at_6.21.43_PM_gl1bog.png" %}


That's it!

Commit your changes to code and deploy your Docker image to your infrastructure.

When Docker runs, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables inside of Docker. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

It worked if you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="/assets/img/cloudinary/Screen_Shot_2022-10-20_at_5.06.44_PM_xwrwj8.png" %}
