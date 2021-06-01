pipeline { 

    environment { 

        registry = "nancy21/webcal" 

        registryCredential = 'docker_cred' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/Nancy9121/project.git' 

            }

        } 

        stage('Building our image') { 

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

        } 
    }}
