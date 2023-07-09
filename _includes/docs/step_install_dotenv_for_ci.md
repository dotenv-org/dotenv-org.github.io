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
HELLO="World"
```

As early as possible in your application, import and configure dotenv.

##### build.js
```js
// build.js
require('dotenv').config()
console.log(process.env) // remove this after you've confirmed it is working

console.log(`Hello ${process.env.HELLO}`)
```

Try running it locally.

##### CLI
```shell
node build.js
{
  ...
  HELLO: 'World'
}
Hello World
```

Perfect. `process.env` now has the keys and values you defined in your `.env` file.

That covers local simulation of the CI. Let's solve for the real CI environment next.
