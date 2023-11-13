# Usa la imagen base de Ubuntu 20.04
FROM ubuntu:20.04

# Etiqueta del creador
LABEL maintainer="Tu Nombre <tu@email.com>"

# Actualiza el sistema e instala las herramientas necesarias
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Instala Java 17
RUN add-apt-repository ppa:linuxuprising/java && apt-get update && echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections && apt-get install -y oracle-java17-installer && apt-get install -y oracle-java17-set-default

# Instala MySQL Server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# Configura MySQL (puedes personalizar según tus necesidades)
COPY mysql-config.sql /docker-entrypoint-initdb.d/

# Instala Apache Tomcat
ENV TOMCAT_VERSION 9.0.52
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tar.gz \
    && tar xzf /tmp/tomcat.tar.gz -C /opt \
    && mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat \
    && rm /tmp/tomcat.tar.gz

# Exponer el puerto 8080 para Tomcat
EXPOSE 8080

# Iniciar Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
