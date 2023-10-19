# dotenv-org.github.io

Source code for www.dotenv.org

## Development

```
bundle exec jekyll serve --livereload --verbose --incremental
```

#### Productino build

```
JEKYLL_ENV=production bundle exec jekyll build
```

#### To include /docs

GitHub Actions takes care of building the docs into the deploy.

Make sure you run `NODE_ENV='production' npm run build` on the `/docs` project and push that to main before the CI here runs.

## Other Notes

Use [iconify](http://icon-sets.iconify.design/simple-icons/) for icons or use [simpleicons.org](https://simpleicons.org/).

Use [screely.com](https://www.screely.com/) to make aesthetic screenshots.

To change the kramdown rouge theme:

```
gem install rouge
rougify help style
rougify style monokai > _sass/rouge-theme.scss
```
