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

<h5 class="text-center">
  <a href="/docs/tutorials/integrations">
    <strong>Integrate Everywhere™</strong>
  </a>
</h5>

<div class="integrations-grid">
  <div>
    {% include helpers/integration.html icon="vercel" url="/docs/integrations/vercel-nodejs" name="Vercel" color="#000000" %}
  </div>
  <div>
    {% include helpers/integration.html icon="heroku" url="/docs/integrations/heroku/rails" name="Heroku" color="#430098" %}
  </div>
  <div>
    {% include helpers/integration.html icon="github" url="/docs/integrations/github/actions-nextjs" name="GitHub Actions" color="#181717" %}
  </div>
  <div>
    {% include helpers/integration.html icon="gitlab" url="/docs/integrations/gitlab/ci-quickstart" name="GitLab CI/CD" color="#FC6D26" %}
  </div>
  <div>
    {% include helpers/integration.html icon="netlify" url="/docs/integrations/netlify-astro" name="Netlify" color="#00C7B7" %}
  </div>
  <div>
    {% include helpers/integration.html icon="docker" url="/docs/integrations/docker/express" name="Docker" color="#2496ED" %}
  </div>
  <div>
    {% include helpers/integration.html icon="docker" url="/docs/integrations/docker-compose/express" name="Docker Compose" color="#2496ED" %}
  </div>
  <div>
    {% include helpers/integration.html icon="circleci" url="/docs/integrations/circleci/rails" name="CircleCI" color="#343434" %}
  </div>
  <div>
    {% include helpers/integration.html icon="serverless" url="/docs/integrations/serverless-express" name="Serverless" color="#FD5750" %}
  </div>
  <div>
    {% include helpers/integration.html icon="railway" url="/docs/integrations/railway-nodejs" name="Railway" color="#0B0D0E" %}
  </div>
  <div>
    {% include helpers/integration.html icon="render" url="/docs/integrations/render/express" name="Render" color="#46E3B7" %}
  </div>
  <div>
    {% include helpers/integration.html icon="fly" url="/docs/integrations/fly/express" name="Fly.io" color="#7B3BE2" %}
  </div>
  <div>
    {% include helpers/integration.html icon="nodejs" url="/docs/integrations/railway/nodejs" name="Node.js" color="#339933" %}
  </div>
  <div>
    {% include helpers/integration.html icon="express" url="/docs/integrations/vercel-express" name="Express" color="#000000" %}
  </div>
  <div>
    {% include helpers/integration.html icon="nextjs" url="/docs/integrations/github/actions-nextjs" name="NextJS" color="#000000" %}
  </div>
  <div>
    {% include helpers/integration.html icon="remix" url="/docs/integrations/github/actions-remix" name="Remix" color="#000000" %}
  </div>
  <div>
    {% include helpers/integration.html icon="astro" url="/docs/integrations/netlify/astro" name="Astro" color="#FF5D01" %}
  </div>




</div>

---

{:.text-center}
#### From the same people that pioneered dotenv. Trusted by more than 2.5 million developers.

{:.text-center}
#### [Get Started with Dotenv Vault](/signup){:.btn}

</article>
