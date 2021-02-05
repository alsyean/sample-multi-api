pipeline {
  agent any
  
    environment {
      AWS_ACCESS_KEY_ID = credentials('awsAccessKey')
      AWS_SECRET_ACCESS_KEY = credentials('awsScretAccessKey')
      AWS_DEFAULT_REGION = 'ap-northeast-2'
      HOME = '.' // Avoid npm root owned
    }


  stages {
 
    stage('parallel'){
      parallel {
        stage('parallel 1'){
          steps{
            echo 'In Parallel 1'
          }
        }
        
        stage('parallel 2'){
          steps{
            echo 'In Parallel 2'
          }
        }
        
      }
      
    }
            
  } 
}
