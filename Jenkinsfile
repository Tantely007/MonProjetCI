pipeline {
    agent any
    
    tools {
        maven 'Maven3' // Assurez-vous que ce nom correspond à votre config Jenkins
    }

    stages {
        stage('Clone and Clean') {
            steps {
                // On nettoie le dossier de build
                bat "mvn clean -f DemoIC"
            }
        }
        
        stage('Test') {
            steps {
                bat "mvn test -f DemoIC"
            }
        }
        
        stage('Deploy to Nexus & Sonar') {
            steps {
                // Build et envoi vers Nexus
                bat "mvn package -f DemoIC"
                bat "mvn deploy -f DemoIC"
                
                // Analyse SonarQube
                withSonarQubeEnv('SonarQube') {
                    bat "mvn sonar:sonar -f DemoIC"
                }
            }
        
        }
    stage('Docker Build & Push') {
        steps {
            script {
            // Remplacez 'votre-pseudo-dockerhub' par votre vrai pseudo
            def dockerImage = "tantely007/demo-ic-image:latest"
            
            // On build l'image à partir du Dockerfile
            bat "docker build -t ${dockerImage} ."
            
            // On se connecte et on pousse l'image sur DockerHub
            // 'dockerhub-login' est l'ID de l'identifiant créé dans Jenkins précédemment
            withCredentials([usernamePassword(credentialsId: 'dockerhub-login', 
                             passwordVariable: 'DOCKER_HUB_PASSWORD', 
                             usernameVariable: 'DOCKER_HUB_USER')]) {
                
                bat "docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}"
                bat "docker push ${dockerImage}"
            }
        }
    }
}
    }

}