pipeline {
  agent any
  
    environment {
      AWS_ACCESS_KEY_ID = credentials('awsAccessKey')
      AWS_SECRET_ACCESS_KEY = credentials('awsScretAccessKey')
      AWS_DEFAULT_REGION = 'ap-northeast-2'
      HOME = '.' // Avoid npm root owned
    }


  stages {
    
    stage('Build') {
        steps {  
          echo 'java jar '

          dir ('./shellScript/execute'){
            sh 'sh ./execute.sh'
          }
        }
      
    }
            
  } 
}
