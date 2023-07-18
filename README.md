# dotenv-org.github.io

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose --incremental
```

Use [iconify](http://icon-sets.iconify.design/simple-icons/) for icons or use [simpleicons.org](https://simpleicons.org/).

Use Mac Preview to add arrows to screenshots.

Use [screely.com](https://www.screely.com/) to make aesthetic screenshots.

To change the kramdown rouge theme:

```
gem install rouge
rougify help style
rougify style monokai > _sass/rouge-theme.scss
```

## Build

```
JEKYLL_ENV=production bundle exec jekyll build
```

## Afterbuild (to include docs2)

```
npm run build --prefix ../docs
cp ../docs/out/docs.html _site/docs2.html
cp -r ../docs/out/docs _site/docs2
cp -r ../docs/out/_next _site/_next
```


