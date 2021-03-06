#!/bin/sh
VERSION=`cat package.json | underscore select '.version' --outfmt text`
PACK_NAME=`cat package.json | underscore select '.name' --outfmt text`
NPM_VERSION=`npm view $PACK_NAME version`
echo "New version - $VERSION, old - $NPM_VERSION"
if [ "$VERSION" != "$NPM_VERSION" ] && [ "$TRAVIS_BRANCH" = "master" ] && [ "$TRAVIS_EVENT_TYPE" != "pull_request" ]
then
    npm publish
else 
    echo "Package $PACK_NAME does not need to be updated"
fi