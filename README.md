# www

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose
```

Use [iconify](http://icon-sets.iconify.design/simple-icons/) for icons or use [simpleicons.org](https://simpleicons.org/).

Use Mac Preview to add arrows to screenshots.

Use [screely.com](https://www.screely.com/) to make aesthetic screenshots.

## Build

```
JEKYLL_ENV=production bundle exec jekyll build --verbose
cp -a _site/. ../dotenv.org/public/
mv ../dotenv.org/public/sitemap.xml ../dotenv.org/public/map.xml
rm ../dotenv.org/public/robots.txt
```
