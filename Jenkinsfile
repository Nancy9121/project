pipeline {
    agent any

    stages {
	    
	    stage("Git Clone")
	    {
		    steps {
			    echo 'cloning.....'
	{
	git credentialsId: 'git-credential', url: 'https://github.com/Nancy9121/project.git'
	}
	    
	    
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
      /*  stage('Sonar Analysis') {
            steps {
                echo 'Analyzing....'
		sh 'mvn sonar:sonar -Dsonar.host.url=http://172.31.22.50:9000 -Dsonar.login=5f0d4c395b8e3ff0d5f26dc31f4876c10423412d'
            }
        }*/


stage('build code') {
            steps {
                echo 'building ..'
		sh 'mvn clean install'
            }
        }
}}   
 stage ("Build Docker Image")
	{
		steps {
			echo 'buildImage...'
	sh "docker build -t nancy21/webappcal-1.2.1.war ."
	}
	}
	    
	    stage("docker login and push") 
	{
		steps {
			echo 'Pushing....'
	withCredentials([string(credentialsId: 'docker_hub_pwd', variable: 'docker_hub_pwd')]) {
    	sh "docker login -u nancy21 -p ${docker_hub_pwd}"
	
}
	sh "docker push nancy21/webappcal-1.2.1.war"
}
	}
