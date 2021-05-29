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
     /*   stage('Sonar Analysis') {
            steps {
                echo 'Analyzing....'
		sh 'mvn sonar:sonar \
  -Dsonar.host.url=http://172.31.2.67:9000 \
  -Dsonar.login=2e023e8c382ee3510db7955f9ae238ec6c56a4ec'
            }
      
}  */
stage('build code') {
            steps {
                echo 'building ..'
		sh 'mvn clean install'
            }
        }
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
	    
	    stage('deploy on kubernetes')
	{
	steps  {
	sshagent(['k8']) {
    	ssh "scp -o StringHostKeyChecking=no web.yml centos@204.236.197.24":/centos"
	script	{
	 try {
	sh "ssh centos@204.236.197.24 kubectl apply -f ."
	}
	  catch(error)
	{
	  sh "ssh centos@204.236.197.24 kubectl apply -f ."
	}

		}
			}
		}
	}
