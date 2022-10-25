---
layout: docs
title: "Heroku with Flask - Integrations"
---

{% include helpers/reading_time.html %}

{% include icons/heroku.html width="50" color="#430098" %}
{% include icons/flask.html width="50" color="#000000" %}

##### Integrations

# Heroku with Flask

In this tutorial we'll show you how to integrate Dotenv Vault with a Flask app deployed to Heroku. This tutorial assumes you have already learned how to [sync a .env file](/docs/tutorials/sync).

## Install Flask

Install Flask and Gunicorn.

```
$ pip install flask
```

Create a `app.py` file.

```
# app.py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
  return "<p>Hello, World!</p>"
```

Create a `wsgi.py` file.

```
from app import app

if __name__ == '__main__':
  app.run(debug=False)
```

## Install dotenv-vault

Create your .env file.

```
# .env
HELLO="Development"
```

Install dotenv-vault.

```
$ pip install python-dotenv-vault --no-cache-dir
```

Require dotenv-vault at the top of your code in app.py, and 

```
# app.py
import os
from dotenv_vault import load_dotenv
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
  hello = os.getenv("HELLO")
  return f"<p>Hello, {hello}!</p>"
```

Run the app. It should say 'Hello Development'.

```
$ flask run --host '0.0.0.0'
```

Great, let's deploy that to Heroku.

## Deploy to Heroku

Install gunicorn.

```
$ pip install flask gunicorn
```

Create a Procfile.

```
web: gunicorn --workers 4 --bind 0.0.0.0:${PORT} wsgi:app
```

Create runtime.txt.

```
python-3.9.13
```

Freeze your requirements.txt.

```
pip freeze > requirements.txt
```

Set up your .gitignore file.

```
# .gitignore
.DS_Store
.env
.flaskenv
*.pyc
*.pyo
env/
venv/
.venv/
env*
dist/
build/
```

Commit all your changes to git and create your app on Heroku.

```
$ git commit -am "Ready for Heroku"
$ heroku create
$ git push heroku
```

It will say 'Hello, None!'.

Great. We're ready build our encrypted .env.vault file and configure Dotenv Vault with heroku.

## Build .env.vault

Set a production value for when we deploy. I set it to HELLO=Production. Run dotenv-vault open to edit production values.

```
$ npx dotenv-vault open production
```

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_800/v1666719268/Screen_Shot_2022-10-25_at_10.34.11_AM_vnz5fw.png" %}

Then build your localized encrypted .env.vault file.

```
$ npx dotenv-vault build
```

Great! Commit your `.env.vault` file to code and deploy it to heroku. It is safe and necessary to do so.

## Set DOTENV_KEY

Lastly, set the **DOTENV_KEY** on Heroku.

Run npx dotenv-vault keys production to get your production decryption key.

```
$ npx dotenv-vault keys production
remote:   Listing .env.vault decryption keys... done

dotenv://:key_1234@dotenv.org/vault/.env.vault?environment=production
```

Visit your Heroku Project's Settings > Reveal Config Vars > Environment Variables. Set DOTENV_KEY.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666175727/Screen_Shot_2022-10-19_at_4.01.32_PM_ibbdwq.png" %}

## Commit and push

That's it! 

Commit those changes safely to code and deploy to Heroku.

When the app boots, it will recognize the `DOTENV_KEY`, decrypt the .env.vault file, and load the production environment variables to `ENV`. If a `DOTENV_KEY` is not set (like during development on your local machine) it will fall back to regular dotenv.

You'll know things worked correctly if you see the message 'Loading env from encrypted .env.vault' in your heroku logs.

{% include helpers/screenshot.html url="https://res.cloudinary.com/dotenv-org/image/upload/v1666564831/Screen_Shot_2022-10-23_at_3.39.19_PM_pftocm.png" %}
