# Utilisation d'une image de base légère contenant Go
FROM golang:1.17-alpine as builder

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers nécessaires (le code source)
COPY . .

# Compilation du projet
RUN go mod download
RUN go build -o main .

# Utilisation d'une image Alpine plus légère pour exécuter l'application
FROM alpine:latest

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie de l'exécutable depuis le builder vers le conteneur final
COPY --from=builder /app/main .

# Commande à exécuter lorsque le conteneur démarre
CMD ["./main"]
