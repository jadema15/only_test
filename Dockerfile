# Usa Ubuntu 20.04 como imagen base
FROM ubuntu:20.04

# Cambia a un espejo en los Estados Unidos
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/us.archive.ubuntu.com/g' /etc/apt/sources.list

# Actualiza el sistema e instala herramientas básicas
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /app

# Copia el contenido del repositorio al directorio de trabajo
COPY . /app

# Expone el puerto (ajusta según las necesidades de tu aplicación Spring Boot)
EXPOSE 9090

# Comando para ejecutar la aplicación al iniciar el contenedor
CMD ["java", "-jar", "target/proyecto.jar"]


