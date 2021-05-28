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
	    
	    stage("docker login and push" ) 
	{
	
	withCredentials([string(credentialsId: 'docker_hub_pwd', variable: 'docker_hub_pwd')]) {
    	sh "docker login -u nancy21 -p ${docker_hub_pwd}"
	
}
	sh "docker push nancy21/WebAppCal-1.2.1.war"
}
	    
   /*     stage('Nexus upload') {
            steps {
		    echo 'Analyzing....'
		  
                nexusArtifactUploader artifacts: [
	[
		artifactId: 'WebAppCal',
		classifier: '', file: "/var/lib/jenkins/workspace/pro1/target/WebAppCal-1.2.1.war",
	 	type: 'war'
	]
			],
	 credentialsId: 'nexus', 
	 groupId: 'com.web.cal',
	 nexusUrl: '172.31.2.67:8081/nexus',
	 nexusVersion: 'nexus2', 
	protocol: 'http', 
	repository: 'http://44.192.129.209:8081/nexus/content/repositories/releases',
	 version: '1.2.1'
		    
		      }
		}   */

    }
}
