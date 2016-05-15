#!/bin/bash

cd _book

git add .

time=`date '+%Y-%m-%d %H:%M:%S'`

git commit -m "$time"

git push origin gh-pages