# www

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose
```

Use [simpleicons.org](https://simpleicons.org/) for svg icons.

## Build

```
JEKYLL_ENV=production bundle exec jekyll build --verbose
cp -a _site/. ../dotenv.org/public/
```
