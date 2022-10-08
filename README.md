# www

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose
```

## Build

```
JEKYLL_ENV=production bundle exec jekyll build --verbose
cp -a _site/. ../dotenv.org/public/
```
