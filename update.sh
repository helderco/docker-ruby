#!/bin/bash
set -e

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
    versions=( */ )
fi
versions=( "${versions[@]%/}" )

for version in "${versions[@]}"; do
    echo "Updating $version"
    (
      set -x
      cp README.md $version
      cp README-onbuild.md $version/onbuild/Readme.md
    )
done
