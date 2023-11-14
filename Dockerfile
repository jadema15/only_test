# Usa Ubuntu 20.04 como imagen base
FROM ubuntu:20.04

# Cambia a un espejo en los Estados Unidos
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/us.archive.ubuntu.com/g' /etc/apt/sources.list

# Establece el directorio de trabajo
WORKDIR /app

