---
layout: blog
author: mot
title: "Community Spotlight: David Cochrum"
image: "/assets/img/blog/community-spotlight-david-cochrum.png"
excerpt: "Meet David Cochrum, the creator of dotenv-vault-laravel."
published: true
---

<img src="/assets/img/blog/community-spotlight-david-cochrum.png" />

Meet [David Cochrum](https://chrum.me/), the creator of [dotenv-vault-laravel](https://github.com/davidcochrum/dotenv-vault-laravel). He's a full stack software engineer that specializes in PHP and JavaScript.

In this spotlight post, I ask him some questions about Laravel, as well as the `.env.vault` file format.

## Question 1: Laravel Ecosystem

> Having worked with Laravel for some time, what significant changes have you observed in the framework and its ecosystem? How have these changes influenced your development approach?

Over the years of working with Laravel, I have seen the level of convenience grow while the learning curve shrunk. Obviously, Laravel is quite opinionated in its approach, but those opinions cover the vast majority of use cases and generally make the framework a breeze to work with.

Take create, read, update, and delete (CRUD) operations, for example. So much of web apps are CRUD operations against resource models. Laravel added a great convenience when it [introduced resource controllers](https://laravel.com/docs/5.5/releases) and [route model binding](https://laravel.com/docs/5.4/releases) to go with it. So long as you’re following the Laravel conventions, much of the boilerplate work is handled for you. That in turn empowers developers to crank out more functionality without dying of boredom along the way.

I believe the popularity of Laravel has grown largely due to of these opinionated conveniences. As such, there’s a package to add on just about any common functionality these days directly through Packagist and GitHub. Third-party packages also benefit from auto discovery to the point where most can be added just by including the Composer dependency. The integration and configuration of these auto-discovered packages within your app is effortless and often requires no further modification than the installation.

Now, the Computer Science purists will also tell you that some of Laravel’s conventions and conveniences come at the cost of breaking certain programming paradigms and principles. While this is undeniably true, in my humble opinion, Laravel does a pretty decent job of balancing principles with practicality. Sure, Facades are an example of an anti-pattern, but I think, when used responsibly, the benefits can outweigh the penalty of broken rules.

Early on when I first started real app development, the seniors above me decided to base our re-build on Symfony. While this allowed for some low-level convenience, the decision was also made that the Symfony validation package wasn’t good enough for our purposes and instead, each CRUD module would require complex validator classes for each of the forms within. I believe we wasted quite a bit of developer time/resources in re-inventing a pretty decent wheel. Reflecting on that time now, I believe that was a huge mistake. Yes, it was the more principled approach, but I don’t think we gained much, if anything, by writing our own validation instead of leveraging the widely used package.


## Question 2: Laravel Benefits

> Laravel is known for its elegant syntax and robust features. Can you share an example from your experience where Laravel uniquely benefited a project you worked on, perhaps in ways other PHP frameworks might not have?

In my opinion, Laravel's most valuable feature is how it allows you to go from nothing to a minimum viable product (MVP) faster than any other framework. Because of its popularity, so many community packages are available to be quickly integrated into your project as well. Say you need to add OAuth to your project, for example. With other frameworks or languages, that typically requires a significant amount of work. Whereas with Laravel, the OAuth package offered, [Fortify](https://laravel.com/docs/10.x/fortify), does the overwhelming majority of the work for you and requires minimal effort to integrate.

## Question 3: Your Experience with Laravel

> What drew you to specialize in Laravel, and how has it shaped your journey as a developer? Are there any projects or achievements within the Laravel community that you're particularly proud of?

I wouldn't say I necessarily specialize in Laravel, but it is definitely my framework of choice when I'm offered a choice. I've worked on projects using Symfony, CodeIgniter v3, Zend v1, and even a homegrown framework that predates all of the others.

Many moons ago I was tasked with extending and maintaining APIs for various mobile apps which were all bundled into a single WordPress XMLRPC plugin. I was given more freedom on one project and I presented the case that I should be given the time to learn and build this next API using a concept I had just heard of: Object Oriented Programming (OOP). I was successful in convincing the stakeholders that allowing me the time to learn and build in this way would be worthwhile. I tried out numerous frameworks, but with the help of [Jeffrey Way's Laracasts](https://laracasts.com/), Laravel just seemed to come so naturally and truly helped me learn and adopt programming principles that I hadn't known before.

Speaking of Laracasts, I would consider that project and community one of the best things to come from Laravel. I'm sure many other developers like myself got their start from working through those videos and tutorials. I certainly wouldn't be where I am today without Laracasts. Nor would I be as efficient as I am within my IDE.

## Question 4: Laraval with .env.vault

> What drew you to the .env.vault mechanism? How do you think it will affect the Laravel ecosystem? Is it useful to it? Laravel has its own encryption mechanism for .env files, how is .env.vault different and or more useful in your mind?

I'm currently working on a Zend Framework v1 monolith project that my team and I are attempting to modernize. These apps use Zend's ini files for configuration which also can be overridden via .env values. I'm working on protecting these secrets and making them more portable while simultaneously starting the process of migrating the apps from Zend to Laravel. During my search for solutions, I came across [dotenv.org](https://www.dotenv.org/) and its vault for secure secret storage that seemed to fit my needs. I did, however, see an opportunity to author [my first Laravel package](https://github.com/davidcochrum/dotenv-vault-laravel) which simply wrapped the [PHP Dotenv library](https://github.com/dotenv-org/phpdotenv-vault) for dead-simple integration with the framework.

I think the vault mechanism can be useful for those who are looking for a storage solution for their secrets which may not be available or is costly with their hosting provider. Additionally, the remote sync feature offered on [dotenv.org](https://www.dotenv.org) with the potential for granular access control across user accounts adds a great value that is missing from Laravel's encryption mechanism.

---

Thank you David for the thoughts and for your [dotenv-vault-laravel](https://github.com/davidcochrum/dotenv-vault-laravel) contribution to the Laravel community.

<img src="/assets/img/blog/community-spotlight-david-cochrum-1.png" />

<img src="/assets/img/blog/community-spotlight-david-cochrum-2.png" />
