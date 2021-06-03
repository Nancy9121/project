pipeline { 

    environment { 

        registry = "nancy21/webcal" 

        registryCredential = 'docker_cred' 

        dockerImage = '' 

    }

  
    
    agent any
    stages {
	    
	    stage("Git Clone")
	    {
		    steps {
			    echo 'cloning.....'
	git credentialsId: 'git-credential', url: 'https://github.com/Nancy9121/project.git'
	}
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

    
	    stage('build image')
{
	steps {
		script  {
sh 'docker build -t webappcal-1 .'
}
}
}
stage('Push image')
{
steps
{
	script
	{
	withCredentials([string(credentialsId: 'dockhub', variable: 'dockhub')]) {
    	sh "docker login -u nancy21 -p ${dockhub}"
}
		sh 'docker push nancy21/webcal'
}}
}
	   
	    stage('Execute Ansible')
		{
	  steps  {
		  ansiblePlaybook credentialsId: 'Anprivate-key', disableHostKeyChecking: true, installation: 'default', inventory: 'ansi.inv', playbook: 'ansible.yml'
		}
	}

	    
	    
	    stage('Deploy on K8s') { 
            steps { 


sshagent(['k8']) {
    sh "scp -o StrictHostKeyChecking=no dep.yaml centos@3.86.99.61:/home/centos"
 	script {
	try {
		sh "ssh centos@3.86.99.61:/home/centos kubectl apply -f ."  }
	catch (error) {
		sh "ssh centos@3.86.99.61:/home/centos kubectl create -f ." }
}
       }    

            }
	}
       /* stage('Building our image') { 

            steps { 

              script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        }*/
    }}
