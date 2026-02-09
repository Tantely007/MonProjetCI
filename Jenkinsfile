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
    }
}
