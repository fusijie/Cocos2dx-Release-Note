#! /bin/sh
mkdir release
gitbook build
cp -r _book/ release/
rm -rf _book
rm release/build_to_ghpage.sh
git checkout gh-pages
cp -rf release/ .
git add .
time=`date`
git commit -m "update release note at ${time}"
git push origin gh-pages