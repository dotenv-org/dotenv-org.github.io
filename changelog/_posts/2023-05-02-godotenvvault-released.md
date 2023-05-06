---
layout: changelog
author: mot
title: "Golang .env.vault support"
---

If you're a Golang developer you can now use `.env.vault` files with your deployments.

Install godotenvvault:

```bash
go get github.com/dotenv-org/godotenvvault
```

And as early as possible in your application, import and configure it:

```golang
package main

import (
    "log"
    "os"

    "github.com/dotenv-org/godotenvvault"
)

func main() {
  err := godotenvvault.Load()
  if err != nil {
    log.Fatal("Error loading .env file")
  }

  s3Bucket := os.Getenv("S3_BUCKET")
  secretKey := os.Getenv("SECRET_KEY")

  // now do something with s3 or whatever
}
```

Visit [github.com/dotenv-org/godotenvvault](https://github.com/dotenv-org/godotenvvault) for more details.
