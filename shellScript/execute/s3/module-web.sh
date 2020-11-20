#!/bin/bash

cd ../

if [ -d ./${web} ]; then
  rm -rf ./${web}
fi

mkdir -vp ./${web}

cp ../../module-web/build/libs/* ./${web}

cp ./codeDeploy/* ./${web}

cd ./${web}

zip -r ${web}.zip * -x module*.sh 

find ./ ! -name *.zip -exec rm {} \; 

aws s3 sync ../${web} s3://spring-boot-bucket/${web}

echo "s3 upload web module"
