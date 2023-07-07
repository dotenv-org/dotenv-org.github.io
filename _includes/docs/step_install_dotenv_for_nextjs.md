## Install dotenv

Install [`dotenv`](https://github.com/motdotla/dotenv).

##### CLI
```shell
npm install dotenv --save # Requires dotenv >= 16.1.0
```

Create a `.env` file in the root of your project.

##### .env
```shell
# .env
NEXT_PUBLIC_HELLO="World"
```

Preface your npm `package.json scripts` with dotenv [preloading](https://github.com/motdotla/dotenv#preload).

##### package.json
```json
"scripts": {
  "dev": "node -r dotenv/config ./node_modules/.bin/next",
  "build": "node -r dotenv/config ./node_modules/.bin/next build",
  "start": "node -r dotenv/config ./node_modules/.bin/next start"
}
```

Try running it locally.

##### CLI
```shell
npm run dev
started server on 0.0.0.0:3000, url: http://localhost:3000
```

Visit [localhost:3000](http://localhost:3000)

##### Browser
{% include helpers/screenshot_browser.html url="/assets/img/docs/nextjs-hello-world.png" www="localhost:3000" %}


Perfect. `process.env` now has the keys and values you defined in your `.env` file.

That covers local development. Let's solve for production next.
