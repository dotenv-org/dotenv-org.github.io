---
layout: docs
title: "Circle CI with Rails - Integrations"
redirect_from:
  - /docs/integrations/circle-ci-rails
---

{% include helpers/reading_time.html %}

{% include icons/circleci.html width="50" color="#343434" %}
{% include icons/rails.html width="50" color="#CC0000" %}

##### Integrations

# Circle CI with Rails

In this tutorial, learn how to integrate Dotenv Vault with Circle CI. Setup CI file to work with rails application. [example](https://github.com/dotenv-org/integration-example-circleci/blob/master/.circleci/config.yml) 

## Install dotenv-vault

Create your local `.env` file.

```
HELLO="World"
```

Add dotenv-vault-rails gem to Gemfile
```
// Add 'dotenv-vault-rails' to Gemfile
gem 'dotenv-vault-rails'
``` 

Require [dotenv-vault](https://github.com/dotenv-org/dotenv-vault-ruby) as early as possible in your Rails application. For a Rails application require dotenv-vault/load in application.rb

```
// config/application.rb
require 'dotenv-vault/load'
```

## Test for Circle CI
```
  describe "hello spec" do
    it "returns World" do
      print(ENV["HELLO"])
      expect(ENV["HELLO"]).to eql("World")
    end
  end
```

Next, we need to build our encrypted .env.vault file.

## Build .env.vault

First set a CI value. Run **dotenv-vault open** to edit CI values.

```
$ npx dotenv-vault open ci
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666358400/Screen_Shot_2022-10-21_at_6.47.12_PM_fxfrzd.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your .env.vault file to code. It is safe to do so. It is a localized encrypted vault of your environment variables.

## Set DOTENV_KEY

Lastly, set the DOTENV_KEY on Circle CI.

Run npx dotenv-vault keys ci to get your CI decryption key.

```
$ npx dotenv-vault keys ci
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=ci
```

Then in Circle CI click projects settings 
{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666358069/Screen_Shot_2022-10-21_at_6.43.47_PM_hvbpmr.png" %} and Add Environment Variable 
{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666356075/Screen_Shot_2022-10-21_at_6.08.47_PM_lwhnw9.png" %}

That’s it!

Commit your changes to code and push.

When the build runs, it will recognize the DOTENV_KEY, decrypt the .env.vault file, and load the CI environment variables to Circle CI. If a DOTENV_KEY is not set (like during development on your local machine) it will fall back to regular dotenv.

You will know it worked when you see the message 'Loading env from encrypted .env.vault'.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666359120/Screen_Shot_2022-10-21_at_6.58.57_PM_fuz0zv.png" %}
