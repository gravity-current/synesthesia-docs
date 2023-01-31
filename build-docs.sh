#!/bin/bash

pythonVersion=python3

publicBuildDir=./build/public
privateBuildDir=./build/private
docsName=docs
embeddedDocsName=embedded_docs
publicDocsDir=$publicBuildDir/$docsName
embeddedDocsDir=$privateBuildDir/$embeddedDocsName

echo "Building Synesthesia documentation"

## Use sass to compile scss stylesheet
npx sass ./docs/stylesheets/sass_input.scss ./docs/stylesheets/sass_output.css

## You must install mkdocs
command -v $pythonVersion -m mkdocs >/dev/null 2>&1 || {
  echo >&2 "mkdocs must be installed";
  echo >&2 "Install via 'pip install mkdocs'";
  echo >&2 "Aborting!";
  exit 1;
}

cd "$(dirname "$0")"

## STEP 1: Build the standard docs site

## Remove previous build
rm -rf $publicDocsDir

#compile the docs
$pythonVersion -m mkdocs build -d $publicDocsDir --clean

echo "Docs built to $publicDocsDir"
echo "To check them out, open $publicDocsDir/index.html"




## STEP 2: Build the embedded docs site, which needs to be customized to prevent
## internal link navigation

## Keep a backup of original files
cp -r docs docs-backup
cp mkdocs.yml mkdocs-backup.yml

## find and replace links with Synesthesia "link:" protocol so they will be opened externally
echo 'Updating external links for embedded docs'
for file in `find ./docs -type f -name '*.md'`; do
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -e "s/https:\/\//link:/g" $file
    sed -i '' -e "s/http:\/\//link:/g" $file
  else
    sed -i -e "s/https:\/\//link:/g" $file
    sed -i -e "s/http:\/\//link:/g" $file
  fi
done

## delete the site url links in the yaml config file
sed -i '/^site_url/d' "mkdocs.yml"

## Remove previous build
rm -rf $embeddedDocsDir

#compile the docs
$pythonVersion -m mkdocs build -d $embeddedDocsDir --clean

#restore the backups
rm -rf docs
mv ./docs-backup ./docs
rm mkdocs.yml
mv ./mkdocs-backup.yml ./mkdocs.yml

#finally, add an external link to the theme credit in the footer of every page
## find and replace links with Synesthesia "link:" protocol
echo 'Updating theme footer link'
for file in `find $embeddedDocsDir -type f -name '*.html'`; do
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -e "s/https:\/\/squidfunk.github.io\/mkdocs-material\//link:squidfunk.github.io\/mkdocs-material/g" $file
  else
    sed -i -e "s/https:\/\/squidfunk.github.io\/mkdocs-material\//link:squidfunk.github.io\/mkdocs-material/g" $file
  fi
done

#zip the embedded docs files so they can be easily delivered to the app
echo "Zipping the embedded docs"
cd $privateBuildDir
zip -r -q $embeddedDocsName.zip $embeddedDocsName
cd -

echo "Embeddable Docs built to $embeddedDocsDir"
echo "To check them out, open $embeddedDocsDir/index.html"
