#!/bin/sh
echo Validating $1...
pykwalify -q -s schema.yml -d "games/$1/game.yml" &&
yamllint -s -c no-line-warnings.yml "games/$1/game.yml" &&
pykwalify -q -s metadata-schema.yml -d "games/$1/metadata.yml" &&
yamllint -s -c no-line-warnings.yml "games/$1/metadata.yml"
