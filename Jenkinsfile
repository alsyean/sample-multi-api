pipeline {
  agent any
  
    environment {
      AWS_ACCESS_KEY_ID = credentials('awsAccessKey')
      AWS_SECRET_ACCESS_KEY = credentials('awsScretAccessKey')
      AWS_DEFAULT_REGION = 'ap-northeast-2'
      HOME = '.' // Avoid npm root owned
    }


  stages {
    
     stage('Start') {
            agent any
            steps {
                slackSend (channel: '#jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
      }
    
    stage('Clone'){

            agent any

            steps{
                echo 'git clone'

                checkout ([$ class : 'GitSCM',  master : [[name : '* / master']],
                  userRemoteConfigs : [[url: 'https://github.com/alsyean/sample-multi-api']]])
                    
              
                
            }

            post {
                success {
                  echo 'successfully clone'
                  
                   slackSend (channel: '#jenkins', color: '#00FF00', message: "SUCCESSFUL : Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                                
                  mail  to: 'doc_test@tmpbox.net',
                          subject: "success Pipelinee",
                          body: "Something is success with deploy frontend"                  
                }

                always {
                    echo 'i tired ...'
                }

                cleanup {
                    echo 'after all other post'
                }

                failure {
                    echo 'fail clone'
                    
                  slackSend (channel: '#jenkins', color: '#00FF00', message: "FAILED Git Clone")
                  
                    mail  to: 'doc_test@tmpbox.net',
                          subject: "Deploy Frontend Success",
                          body: "Successfully deployed frontend!"

                }
            }

    }    
    
    stage('Build') {
        steps {  
          echo 'java jar '

          dir ('./shellScript/execute'){
            sh 'sh ./execute.sh'
          }
        }
      
    }
    
    stage('s3 Upload') {
          steps {
           echo 's3 Upload' 
            
            dir ('./shellScript/execute'){ 
              sh 'sh ./s3Upload.sh'
            }
          }
    }
    
    
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
