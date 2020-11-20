#!/bin/bash

cd ./s3

sh module-api.sh

sh module-web.sh

echo "GIT_COMMIT : ${GIT_COMMIT}"

echo "BUILD_TAG : ${BUILD_TAG}"

msg=$(git log --format=format:%s -1)

git log --oneline -1 ${GIT_COMMIT}

git log --format=format:%s -1

echo "\n msg : ${msg}"
