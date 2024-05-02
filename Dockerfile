# Utilisation d'une image de base légère contenant Go
FROM golang:1.22.2-alpine3.19

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie go mod et fichiers sum
COPY go.mod go.sum ./

# Compilation du projet
RUN go mod download

# Copie des fichiers nécessaires (le code source)
COPY . .

# Construit l'app GO
RUN go build -o jk-golang-webapp-books .

# EXPOSE 80
EXPOSE 80

# Commande à exécuter lorsque pour l'executable
CMD ["./jk-golang-webapp-books"]
