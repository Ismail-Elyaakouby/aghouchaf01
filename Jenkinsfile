#!groovy

node('slave-maven-01') {
    
environment {
    registry = "https://hub.docker.com/88915020"
    registryCredential = '88915020'
}
    currentBuild.result = "SUCCESS"

    try {

       stage('Checkout'){

          checkout scm
       }

       stage('Test'){

         env.NODE_ENV = "test"

         print "Environment will be : ${env.NODE_ENV}"

         sh 'mvn -B -DskipTests clean install -Dmaven.clean.failOnError=false'

       }

       stage('Build Docker'){

            sh 'docker build -f Dockerfile -t hellowordv01 .'
       }

       stage('Building image') {
          steps{
                script {
                  docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        
       stage('Deploy'){

         echo 'Push to Repo'
        //sh './dockerPushToRepo.sh'

       }
    }
    catch (err) {

        currentBuild.result = "FAILURE"

        sh 'echo faiiiiiiled.//'
        throw err
    }

}
