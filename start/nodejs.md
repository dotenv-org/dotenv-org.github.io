---
layout: default
title: "Getting Started on Dotenv with Node.js"
description: Copy-and-paste guides for mastering the basics of dotenv and dotenv-vault with Node.js
---

<div class="container">
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      <a href="/start">&larr; back to start</a> 
    </div>
  </div>
  <div class="row text-center">
    <div class="col">
      {% include icons/nodejs.html width="50" color="#339933" %}
      <h1 class="fw-extrabold mt-2 lh-1">Getting Started on Dotenv with Node.js</h1>
      <div class="row">
        <div class="col-lg-10 offset-lg-1">
          <p class="lead text-body-tertiary mt-2 mb-4">Copy-and-paste guides for mastering the basics of dotenv and <span class="fw-extrabold">dotenv-vault</span> with Node.js.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container mb-5">
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      <div class="row">
        <div class="col col-auto d-flex align-items-center">
          <h5 class="fw-extrabold">Platforms</h5>
        </div>
        <div class="col">
          <div class="text-body-tertiary">
            <hr/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="digital-ocean" url="/docs/languages/nodejs/digital-ocean" name="Digital Ocean" color="#0080FF" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="fly" url="/docs/languages/nodejs/fly" name="Fly.io" color="#7B3BE2" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="heroku" url="/docs/languages/nodejs/heroku" name="Heroku" color="#430098" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="netlify" url="/docs/languages/nodejs/netlify" name="Netlify" color="#00C7B7" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="railway" url="/docs/languages/nodejs/railway" name="Railway" color="#0B0D0E" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="render" url="/docs/languages/nodejs/render" name="Render" color="#46E3B7" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="vercel" url="/docs/languages/nodejs/vercel" name="Vercel" color="#000000" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="google-cloud" url="/docs/integrations/google-cloud/nodejs" name="Google Cloud" color="#4285F4" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="aws" url="/docs/integrations/aws-lambda/nodejs" name="AWS Lambda" color="#FF9900" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="northflank" url="/docs/integrations/northflank/nodejs" name="Northflank" color="#01E3C5" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="cloud66" url="/docs/integrations/cloud66/nodejs" name="Cloud66" color="#3C72B9" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="edgio" url="/docs/integrations/edgio/nuxtjs" name="Edgio" color="#000000" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="supabase" url="/docs/integrations/supabase/nodejs" name="Supabase" color="#3ECF8E" %}
        </div>
      </div>
      <div class="row mt-5">
        <div class="col col-auto d-flex align-items-center">
          <h5 class="fw-extrabold">CI/CD</h5>
        </div>
        <div class="col">
          <div class="text-body-tertiary">
            <hr/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="github" url="/docs/languages/nodejs/github-actions" name="GitHub Actions" color="#181717" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="gitlab" url="/docs/integrations/gitlab/ci-quickstart" name="GitLab CI/CD" color="#FC6D26" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="jenkins" url="/docs/integrations/jenkins/nodejs" name="Jenkins" color="#D24939" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="aws" url="/docs/integrations/aws-beanstalk/express" name="AWS Beanstalk" color="#2A6A35" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="circleci" url="/docs/integrations/circleci/nodejs" name="CircleCI" color="#343434" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="travis-ci" url="/docs/integrations/travis-ci/nodejs" name="Travis CI" color="#3EAAAF" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="buddy" url="/docs/integrations/buddy/nodejs" name="Buddy" color="#1A86FD" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="dagger" url="/docs/integrations/dagger/nodejs" name="Dagger" color="#343434" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="bitbucket" url="/docs/integrations/bitbucket/nodejs" name="Bitbucket" color="#0052CC" %}
        </div>
      </div>
      <div class="row mt-5">
        <div class="col col-auto d-flex align-items-center">
          <h5 class="fw-extrabold">Infrastructure as Code</h5>
        </div>
        <div class="col">
          <div class="text-body-tertiary">
            <hr/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="docker" url="/docs/languages/nodejs/docker" name="Docker" color="#2496ED" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="docker" url="/docs/integrations/docker-compose/express" name="Docker Compose" color="#2496ED" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="pulumi" url="/docs/integrations/pulumi/nodejs" name="Pulumi" color="#8A3391" %}
        </div>
      </div>
      <div class="row mt-5">
        <div class="col col-auto d-flex align-items-center">
          <h5 class="fw-extrabold">Frameworks</h5>
        </div>
        <div class="col">
          <div class="text-body-tertiary">
            <hr/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="gatsby" url="/docs/integrations/gatsby/nodejs" name="Gatsby" color="#663399" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="serverless" url="/docs/integrations/serverless-express" name="Serverless" color="#FD5750" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="express" url="/docs/integrations/vercel/express" name="Express" color="#000000" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="nextjs" url="/docs/integrations/github/actions-nextjs" name="Next" color="#000000" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="nuxt" url="/docs/integrations/vercel/nuxtjs" name="Nuxt" color="#00DC82" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="remix" url="/docs/integrations/github/actions-remix" name="Remix" color="#000000" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="vite" url="/docs/integrations/vercel/vite" name="Vite" color="#646CFF" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="astro" url="/docs/integrations/netlify/astro" name="Astro" color="#FF5D01" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="angular" url="/docs/integrations/vercel/angular" name="Angular" color="#DD0031" %}
        </div>
      </div>
      <div class="row mt-5">
        <div class="col col-auto d-flex align-items-center">
          <h5 class="fw-extrabold">Miscellaneous</h5>
        </div>
        <div class="col">
          <div class="text-body-tertiary">
            <hr/>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="pnpm" url="/docs/integrations/vercel/pnpm" name="pnpm" color="#F69220" %}
        </div>
        <div class="col-6 col-lg-3 d-flex align-items-center">
          {% include helpers/integration2.html icon="openai" url="/docs/integrations/openai/nodejs" name="OpenAI" color="#412991" %}
        </div>
      </div>
    </div>
  </div>
</div>
