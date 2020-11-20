#!/bin/bash

cd ../


if [ -d ./${api} ]; then
  rm -rf ./${api}
fi

mkdir -vp ./${api}

cp ../../module-api/build/libs/* ./${api}

cp ./codeDeploy/* ./${api}

cd ./${api}

zip -r ${api}.zip * -x module*.sh 

find ./ ! -name *.zip -exec rm {} \; 

aws s3 sync ../${api} s3://spring-boot-bucket/${api}

echo "s3 upload api module"
