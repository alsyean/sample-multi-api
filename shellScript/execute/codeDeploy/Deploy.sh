#!/bin/bash 

echo "    > AWS CodeDeploy 배포"
aws deploy create-deployment \
--application-name applicationcode \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name bule \
--region ap-northeast-2 \
--s3-location bucket=spring-boot-bucket,bundleType=zip,key=Deploy/deploy.zip
