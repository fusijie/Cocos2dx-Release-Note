#! /bin/sh
gitbook build 
cp -r _book/ release/
rm -rf _book
cd release
rm build_to_ghpage.sh
git add .
time=`date`
git commit -m "update release note at ${time}"
git push origin gh-pages
