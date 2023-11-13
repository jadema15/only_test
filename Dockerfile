# Usa Ubuntu 20.04 como imagen base
FROM ubuntu:20.04

# Actualiza el sistema e instala herramientas básicas
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Instala OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Configura la variable de entorno JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin

# Establece el directorio de trabajo
WORKDIR /app

# Puedes continuar con el resto de las configuraciones y comandos necesarios para tu aplicación
