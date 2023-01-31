# Synesthesia Documentation Guide

Documentation for [Synesthesia](https://synesthesia.live/), the All-in-One Music Visual Solution. Check out the live documentation [here](https://app.synesthesia.live/docs/).

The Synesthesia team would love your help in developing these docs!

## Dependencies

[MKDocs](https://www.mkdocs.org/) — the library used to create the docs

- Install with `pip install mkdocs` or `choco install mkdocs`

[Material for MKDocs](https://squidfunk.github.io/mkdocs-material/) — the MKDocs theme that we use

- Install with `pip install mkdocs-material` or `choco install mkdocs-material`

[mkdocs-video](https://pypi.org/project/mkdocs-video/) - a plugin used to embed videos

- Install with `pip install mkdocs-video`

[Sass](https://sass-lang.com/) — used to style the docs

- Will be installed with `npm install`. Can also install with `npm install -g sass` or `choco install sass`

## Building

To build the docs, run the script `build-docs.sh` or `npm run build`.

## Testing

To test the docs as you work, run `mkdocs serve` or `npm run start` and go to [http://127.0.0.1:9999/](http://127.0.0.1:9999/). This server will update with live changes as you save the files.

## Styling

The docs are styled using sass. Edit the `sass_input.scss` file in the `stylesheets` directory, which gets compiled to `sass_output.css`. To preview the style changes as you work, run the command:

`sass --watch docs/stylesheets/sass_input.scss docs/stylesheets/sass_output.css`

You can also run `npm run style`, or `npm run start`. This will update with live changes as you save `sass_input.scss`.

## Creating New Pages

1. Create a new markdown file in the proper folder
2. Add this file path to the nav section in `mkdocs.yml`