#!/bin/bash
set -e

cd versions
versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
    versions=( */ )
fi
versions=( "${versions[@]%/}" )
cd ..

for version in "${versions[@]}"; do
    echo "Updating $version"
    (
      set -x
      rm -rf versions/$version/*
      cp -r README.md template/* versions/$version/
      sed -i '' -e 's/{{ version }}/'$version'/g' versions/$version/Dockerfile
      sed -i '' -e 's/{{ version }}/'$version'/g' versions/$version/onbuild/Dockerfile
    )
done

echo "Fix Ruby 1.9"
(
  set -x;
  sed -i '' -e '1s/.*/FROM ruby:1.9/' versions/1.9/Dockerfile
)
