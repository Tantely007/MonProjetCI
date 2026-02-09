# Étape 1 : Utiliser une image de base avec Java (JDK 17 correspondant à notre pom.xml)
FROM openjdk:17-jdk-slim

# Étape 2 : Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Étape 3 : Copier le fichier .jar généré par Maven (dans le dossier target) vers le conteneur
# Note : Adaptez le nom du jar si vous avez changé l'artifactId dans le pom.xml
COPY DemoIC/target/demoic-1.0-SNAPSHOT.jar app.jar

# Étape 4 : Exposer le port sur lequel votre application écoute (ex: 8080)
EXPOSE 8080

# Étape 5 : Commande pour lancer l'application au démarrage du conteneur
ENTRYPOINT ["java", "-jar", "app.jar"]