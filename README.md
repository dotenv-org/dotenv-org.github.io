# www

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose
```

Use [simpleicons.org](https://simpleicons.org/) for svg icons.

Use Mac Preview to add arrows to screenshots.

Use [screely.com](https://www.screely.com/) to make aesthetic screenshots.

## Build

```
JEKYLL_ENV=production bundle exec jekyll build --verbose
cp -a _site/. ../dotenv.org/public/
mv ../dotenv.org/public/sitemap.xml ../dotenv.org/public/map.xml
```
