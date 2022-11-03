#!/bin/bash

# Restore the modification time (mtime) of all files in work tree, based on the
# date of the most recent commit that modified the file.
for f in $(git ls-files); do
  mtime=$(git log -1 --format='%at' -- "$f")
  [[ "$mtime" == "" ]] && continue
  mtime=$(date -d @"$mtime" "+%Y-%m-%dT%H:%M:%S")
  touch -d "$mtime" "$f"
done

# clone a repo, including its submodules
# https://stackoverflow.com/a/4438292/4058484
cd /primes
pwd
git submodule update --init --recursive
git submodule foreach --recursive git fetch
git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'
ls -al /primes

echo /primes/numberGenerator
ls -al /primes/numberGenerator

echo /primes/numberGenerator/python/spacetimeengine/src
ls -al /primes/numberGenerator/python/spacetimeengine/src

# git clone ${DEFAULT_REPO} src && cd src && mv data _data
cd /primes/numberGenerator/python/spacetimeengine/src
mv _data ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_data data

cd ${JEKYLL_SRC}/_data/_base
mv _maps ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_maps _maps
mv _feeds ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_feeds _feeds
mv _posts ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_posts _posts

cd /primes/numberGenerator
mv assets ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/assets assets
mv _sass ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_sass _sass
mv _layouts ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_layouts _layouts
mv _plugins ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_plugins _plugins
mv _includes ${JEKYLL_SRC}/ && ln -s ${JEKYLL_SRC}/_includes _includes
