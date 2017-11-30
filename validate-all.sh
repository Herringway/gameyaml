#!/bin/sh
find games -mindepth 1 -maxdepth 1 -type d -exec basename "{}" \; | xargs -d "\n" -n 1 ./validate.sh
find platforms -mindepth 1 -maxdepth 1 -type f -exec basename "{}" .yml \; | xargs -d "\n" -n 1 ./validate-platform.sh