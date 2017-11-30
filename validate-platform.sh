#!/bin/sh
pykwalify -q -s schema.yml -d "platforms/$1.yml" &&
yamllint -s -c no-line-warnings.yml "platforms/$1.yml"