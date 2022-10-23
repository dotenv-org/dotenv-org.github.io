---
layout: default
title: "Dotenv Vault Spec"
---

<article markdown="1">

# Spec

This page documents the Dotenv Vault Spec. It is a work in progress.

## Vault API

### GET /v1/login

##### URL Params

* `DOTENV_VAULT`
* `requestUid`

##### Response

302 Redirect to login page

---

### POST /v1/login_submit

##### Body

* `DOTENV_VAULT`
* `requestUid`

##### Additional Requirements

Current user must be logged in.

---

### GET /v1/logout 

Lands user on a page to complete logout

##### URL Params

* `DOTENV_VAULT`
* `requestUid`

##### Additional Requirements

Current user must be logged in.

---

### POST /v1/revoke

Revoke a DOTENV_ME token.

##### Body

* `DOTENV_VAULT`
* `requestUid`
* `userHashid`

##### Additional Requirements

Current user must be logged in.

---

### POST /v1/revoke/all

Revoke all of a user's DOTENV_ME tokens for that project.

* `DOTENV_VAULT`
* `requestUid`

---

### POST /v1/check

Check on status of a requestUid.

##### Body

* `DOTENV_VAULT`
* `requestUid`

---

### POST /v1/whoami

Check who is logged in.

##### Body

* `DOTENV_ME`
* `DOTENV_VAULT`

---

### GET /v1/open

##### Body

* `DOTENV_VAULT`
* `environment`

##### Additional Requirements

Current user must be logged in.

---

### POST /v1/push

##### Body

* `environment`
* `projectUid` (todo: change to DOTENV_VAULT)
* `meUid` (todo: change to DOTENV_ME)
* `dotenv`

---

### POST /v1/pull

##### Body

* `DOTENV_VAULT`
* `DOTENV_ME`
* `environment`

---

### POST /v1/versions

##### Body

* `environment`
* `projectUid` (todo: change to DOTENV_VAULT)
* `meUid` (todo: change to DOTENV_ME)

---

### POST /v1/build

##### Body

* `DOTENV_ME`
* `DOTENV_VAULT`

---

### POST /v1/keys

##### Body

* `DOTENV_ME`
* `DOTENV_VAULT`
* `environment`

</article>


