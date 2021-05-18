pipeline{
    agent any

    stages {

        stage('prepare Artifacts') {
            steps {
                sh '''
                zip -r ../frontend.zip *
                '''
            }

        }
        stage('upload Artifacts') {
            steps {
                sh '''
           curl -v -u admin:admin --upload-file frontend.zip http://172.31.11.104:8081/repository/frontend/frontend.zip
            '''
            }
        }
    }
}