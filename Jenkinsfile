pipeline {
    agent any

    stages {
        stage('Validate') {
            steps {
                echo 'Validating..'
		sh 'mvn compile'
            }
        }
        stage('Unit Test') {
            steps {
                echo 'Testing..'
		sh 'mvn test'
            }
        }
        stage('Sonar Analysis') {
            steps {
                echo 'Analyzing....'
		sh 'mvn sonar:sonar \
  -Dsonar.host.url=http://3.238.14.40:9000 \
  -Dsonar.login=fb57a44f802c004d4baf1ad6de7d47b2da59d8cb'
            }
        }
    }
}
