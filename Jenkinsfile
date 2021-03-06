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
               
                git credentialsId: 'sample-multi',
                    branch: 'master',
                    url: 'https://github.com/alsyean/smaple-multi/'
                
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
    
    stage('Check out'){
      steps {
       
        checkout scm
        sh 'git submodule update --init'
      
      }
    }
    
    stage('SonarQube'){
      
      environment {
        scannerHome = tool 'SonarQubeScanner'
      }
      
      steps {
        
        withSonarQubeEnv('SonarQubeServer') { // Will pick the global server connection you have configured
          
          sh 'chmod +x ./gradlew' 
          sh './gradlew build' 
          sh "${scannerHome}/bin/sonar-scanner -X"
          
        }
      }
      
      post {
        success {
          echo 'Successfully SonarQube'
          slackSend (channel: '#jenkins', color: '#00FF00',  message: "SonarQube 성공 : SonarQube Success")
        }
        
        failure {
          echo 'Fail SonarQube'
          slackSend (channel: '#jenkins', color: '#00FF00', message: "SonarQube 실패 : SonarQube Fail")
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
    
  stage('Deploy') {
    steps{
        dir('./shellScript/execute/codeDeploy') {
            sh 'sh ./Deploy.sh'
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
