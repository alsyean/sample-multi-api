#!/bin/bash 

echo "    > AWS CodeDeploy 배포"
aws deploy create-deployment \
--application-name applicationcode \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name submodule \
--region ap-northeast-2 \
--s3-location bucket=spring-boot-bucket,bundleType=zip,key=api/api.zip
