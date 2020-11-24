#!/bin/bash 

echo "    > AWS CodeDeploy 배포"
aws deploy create-deployment \
--application-name abee-application-ApiSever \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name abee-application-ApiSever \
--region ap-northeast-2 \
--s3-location bucket=abee-devops-cicd,bundleType=zip,key=api/api.zip
