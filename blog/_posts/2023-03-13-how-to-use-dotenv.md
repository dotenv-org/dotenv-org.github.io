---
layout: blog
author: mot
title: "How to use dotenv"
cover: "/assets/img/blog/blog-1.png"
excerpt: "Learn dotenv in 2 minutes. You can learn the basics of dotenv in just 2 minutes. It really is that straightforward."
---

We are going to kick off our first blog post with the basics – how to use dotenv.

## Create your project

Begin by creating a project.

Let's call it **hello-world**.

```
$ mkdir hello-world
$ cd hello-world
$ touch index.js
```

Edit the index.js file and place the following in it.

```
// index.js
console.log('Hello World')
```

Test that it runs correctly.

```
$ node index.js
```

It will output "Hello World".

## Create your .env file

A **.env** file is where you put all your secrets - your app configuration, api keys, and encryption keys.

Create a very simple one.

```
$ touch .env
```

Edit it.

```
# .env
HELLO="Universe"
```

Save those changes.

## Install dotenv and require it

Run npm install dotenv to install the dotenv library.

```
$ npm install dotenv --save
```

Then edit your **index.js** file and require dotenv at the top of the file.


```
// index.js
require('dotenv').config()
console.log(`Hello ${process.env.HELLO}`)
```

When you run this it is going to first run require dotenv, run the config command which will pull in your values from your .env file, and then load those into your process.env environment variables.

Try it out. Run **node index.js**.

```
$ node index.js
Hello Universe
```

Great! You just used dotenv at its foundational layer!

---

<iframe width="560" height="315" src="https://www.youtube.com/embed/YtkZR0NFd1g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

