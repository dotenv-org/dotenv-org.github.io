---
layout: blog
author: mot
title: "PHP dotenv is inconsistent across development and production"
image: "/assets/img/blog/phpdotenv-is-inconsistent.png"
excerpt: "Avoid phpdotenv's inconsistencies by following these best practices."
published: true
---

<img src="/assets/img/blog/phpdotenv-is-inconsistent.png" />

I recently added [`.env.vault` support for PHP](https://github.com/dotenv-org/phpdotenv-vault), and I came across serious inconsistencies across development and production using [phpdotenv](https://github.com/vlucas/phpdotenv).

Values can come up blank (yikes!) and `load` works differently than the [other](https://github.com/theskumar/python-dotenv) [major](https://github.com/bkeepers/dotenv) [dotenv](https://github.com/motdotla/dotenv) libraries.

Luckily, the fix is straightforward.

* Use `$_SERVER`  - don't use `$_ENV` or `getenv`
* Use `safeLoad()` - don't use `.load()`

Let's dive in. 

> Also, let me say that I know how difficult it is to maintain a widely-embedded library like [phpdotenv](https://github.com/vlucas/phpdotenv). There are good historical reasons a library might have inconsistencies. Sometimes changing the inconsistencies leads to worse cascading effects.

## Setup

Install [phpdotenv](https://github.com/vlucas/phpdotenv).

```
composer require vlucas/phpdotenv
```

Create a `.env` file.

```
HELLO="File"
```

Then load your `.env` file in a way that will output `Hello File` using each available accessor.

1. `$_ENV`
2. `$_SERVER`
3. `getenv`


```php
<?php
// example1.php
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$env_hello = $_ENV['HELLO'];
$server_hello = $_SERVER['HELLO'];
$getenv_hello = getenv('HELLO');

echo "ENV:    Hello {$env_hello}";
echo "\n";
echo "SERVER: Hello {$server_hello}";
echo "\n";
echo "getenv: Hello {$getenv_hello}";
```

Ok, let's run some scenarios demonstrating the inconsistencies.

## Scenarios

### Scenario 1 - `getenv` missing value

In the first scenario, the `getenv` value comes back blank.

```php
<?php
// example1.php
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$env_hello = $_ENV['HELLO'];
$server_hello = $_SERVER['HELLO'];
$getenv_hello = getenv('HELLO');

echo "ENV:    Hello {$env_hello}";
echo "\n";
echo "SERVER: Hello {$server_hello}";
echo "\n";
echo "getenv: Hello {$getenv_hello}";
```
```
$ php example1.php
ENV:    Hello File
SERVER: Hello File
getenv: Hello
```

`getenv` returns `Hello [blank]`.

### Scenario 2 - `createUnsafeImmutable` not thread-safe

In the second scenario, we remove thread-safety.

Change `createImmutable` to `createUnsafeImmutable` in order to populate data to `getenv`.

```php
<?php
// example2
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createUnsafeImmutable(__DIR__);
$dotenv->load();

$env_hello = $_ENV['HELLO'];
$server_hello = $_SERVER['HELLO'];
$getenv_hello = getenv('HELLO');

echo "ENV:    Hello {$env_hello}";
echo "\n";
echo "SERVER: Hello {$server_hello}";
echo "\n";
echo "getenv: Hello {$getenv_hello}";
```

```
$ php example2.php
ENV:    Hello File
SERVER: Hello File
getenv: Hello File
```

That works. `getenv` now correctly returns `Hello File`, but it is [not thread safe](https://github.com/vlucas/phpdotenv#putenv-and-getenv) - super dangerous for any production application!

So, let's switch it back to `createImmutable` and try something else.

### Scenario 3 - `$_ENV` missing value

In the third scenario, `$_ENV` comes back blank.

Mimic the behavior of an already set environment variable on the server by pre-setting `HELLO=Server`.

```php
<?php
// example1.php
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$env_hello = $_ENV['HELLO'];
$server_hello = $_SERVER['HELLO'];
$getenv_hello = getenv('HELLO');

echo "ENV:    Hello {$env_hello}";
echo "\n";
echo "SERVER: Hello {$server_hello}";
echo "\n";
echo "getenv: Hello {$getenv_hello}";
```

```
$ HELLO="Server" php example1.php
PHP Warning:  Undefined array key "HELLO" in /Users/scottmotte/Code/dotenv-org/examples/dotenv-blog/2023-11-07/example1.php on line 8
Warning: Undefined array key "HELLO" in /Users/scottmotte/Code/dotenv-org/examples/dotenv-blog/2023-11-07/example1.php on line 8

ENV:    Hello
SERVER: Hello Server
getenv: Hello Server
```

`$_ENV` is blank (and we get a warning)! This is inconsistent behavior between development and production.

But `$_SERVER` is consistent in all three scenarios. Use that going forward. Easy enough.

## `load()` vs `safeLoad()`

In the other 3 major dotenv libraries ([node](https://github.com/motdotla/dotenv), [ruby](https://github.com/bkeepers/dotenv), [python](https://github.com/theskumar/python-dotenv)), the `load` method quietly does nothing when a `.env` file is not present.

> This is for good reason. Your `.env` file is not committed to code. So when you deploy your code to production (or ci) there is no `.env` file present. The expecation is the server already has your environment variables in memory.

Let's see what [phpdotenv](https://github.com/vlucas/phpdotenv) does in this scenario.

Remove your `.env` file and run the script again.

```
rm .env
```

```
$ php example1.php
PHP Fatal error:  Uncaught Dotenv\Exception\InvalidPathException: Unable to read any of the environment file(s) at [../.env]. in /../vendor/vlucas/phpdotenv/src/Store/FileStore.php:68
Stack trace:
...
```

It issues a stacktrace error, killing your app!

This really surprised me because this is a really dangerous default. It encourages the developer to commit their `.env` file to code to fix the problem.

Luckily, the fix is easy again. Use `safeLoad` instead of `load`. 

But in my experience, a developer new to `.env` files won't have the experience to correctly reach for `safeLoad` here. They are too likely to commit their `.env` file to code and move on with their day. I'll admit I don't have the historical context for this decision here, but currently I think this naming pattern should be reversed. `load` should be become something like `loadAndHaltIfMissingEnv`, and `safeLoad` should become `load`.

Anyways, let's see the fix.

```
<?php
// example3
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad(); // <--- use safeLoad

$env_hello = $_ENV['HELLO'];
$server_hello = $_SERVER['HELLO'];
$getenv_hello = getenv('HELLO');

echo "ENV:    Hello {$env_hello}";
echo "\n";
echo "SERVER: Hello {$server_hello}";
echo "\n";
echo "getenv: Hello {$getenv_hello}";

```

```
$ php example3.php
ENV:    Hello
SERVER: Hello
getenv: Hello
```

All blank values and no stacktrace, as it should be.

Let's simulate production again.

```
$ HELLO="Server" php example3.php
ENV:    Hello
SERVER: Hello Server
getenv: Hello Server
```

`$_SERVER` correctly returns `Hello Server`. 

Phew 💛🌴, I'm feeling better.

## Conclusion

In conclusion, use `$_SERVER`, and use `safeLoad` instead of `load`. Do the same when using [phpdotenv-vault](https://github.com/dotenv-org/phpdotenv-vault) with encrypted `.env.vault` files.

Happy PHPing!
