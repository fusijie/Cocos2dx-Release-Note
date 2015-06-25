#! /bin/sh
mkdir release_temp
gitbook build --output=release_temp
cp -r release_temp/ release/
rm -rf release_temp
cd release
rm -r release_temp
git add .
time=`date`
git commit -m "update release note at ${time}"
