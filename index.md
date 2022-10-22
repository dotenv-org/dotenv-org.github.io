---
layout: default
title: "Sync .env files"
---

<div class="hero">
  <h1>Sync .env files</h1>

  <div>
    <h4 class="font-weight-normal">Stop sharing them over insecure channels like Slack and email and never lose an important .env file again.</h4>
    <p><a class="btn mr-05" href="/signup">Get Started with Dotenv Vault</a> <a href="/pricing">Pricing</a></p>
  </div>
</div>

<article markdown="1">

{:.text-center}
### Why you'll love using Dotenv Vault

---

### Works with a single command

You don't need to install anything to use Dotenv Vault. No error prone binaries to install, infrastructure to maintain, or custom code to write. It just works – with a single command. 

↓ Try it out – real quick.
```

$ npx dotenv-vault push

```

---

<div class="rounded video border border-success bg-dark">
  <iframe width="1108" height="625" src="https://www.youtube.com/embed/z-lBjxfhWeY" title="1 Minute Overview" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
[Learn more &rarr;](/docs/tutorials/sync)

---

### Multiple Environments

After you've pushed your .env file, you can manage your secrets across multiple environments. Open an environment to view and edit its environment variables.

↓ Open the GitHub-like UI.
```

$ npx dotenv-vault open production

```

---

<div>
  <img src="https://res.cloudinary.com/dotenv-org/image/upload/c_scale,w_900/v1659628722/Screen_Shot_2022-08-04_at_8.53.16_AM_pukxin.png">
</div>
[Learn more &rarr;](/docs/tutorials/environments)

---

### Integrate Everywhere™

Dotenv Vault integrates everywhere you already deploy your code. Run the build command to generate your encrypted .env.vault file, commit that safely to code, and deploy. There's nothing else like it.

```
$ npx dotenv-vault build
$ git commit -am "Add .env.vault"
$ git push
```
<div class="flex mt-1 mb-1">
  <div class="flex-1 text-center">
		<a href="/docs/integrations/vercel-nodejs">
			{% include icons/vercel.html width="50" %}
			<br/>
			<small>Vercel</small>
		</a>
    <br/>
    <br/>
    <a href="/docs/integrations/netlify-astro">
			{% include icons/netlify.html width="50" %}
			<br/>
			<small>Netlify</small>
		</a>
  </div>
  <div class="flex-1 text-center">
		<a href="/docs/integrations/heroku-rails">
			{% include icons/heroku.html width="50" %}
			<br/>
			<small>Heroku</small>
		</a>
		<br/>
    <br/>
    <a href="/docs/integrations/serverless-express">
			{% include icons/serverless.html width="50" %}
			<br/>
			<small>Serverless</small>
		</a>
	</div>
  <div class="flex-1 text-center">
		<a href="/docs/integrations/github-actions-nextjs">
			{% include icons/github.html width="50" %}
			<br/>
			<small>GitHub Actions</small>
		</a>
		<br/>
    <br/>
    <a href="/docs/integrations/gitlab-ci-quickstart">
			{% include icons/gitlab.html width="50" %}
			<br/>
			<small>GitLab CI/CD</small>
		</a>
	</div>
	<div class="flex-1 text-center">
		<a href="/docs/integrations/docker-express">
			{% include icons/docker.html width="50" %}
			<br/>
			<small>Docker</small>
		</a>
		<br/>
    <br/>
    <a href="/docs/integrations/circle-ci-rails">
			{% include icons/circleci.html width="50" %}
			<br/>
			<small>Circle CI</small>
		</a>
	</div>
</div>

These are just a few of the many popular platforms Dotenv Vault integrates with.

[Learn how Integrate Everywhere™ works exactly &rarr;](/docs/tutorials/deploy)

---

{:.text-center}
#### From the same people that pioneered dotenv. Trusted by more than 2.5 million developers.

{:.text-center}
#### [Get Started with Dotenv Vault](/signup){:.btn}

</article>
