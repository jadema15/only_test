# Etapa 1: Construir la aplicación con Maven
FROM maven:3.8-openjdk-17 AS builder

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn clean package -DskipTests

# Etapa 2: Ejecutar la aplicación con JRE y Tomcat
FROM adoptopenjdk:17-jre-hotspot

WORKDIR /app

# Copiar el JAR generado en la etapa anterior
COPY --from=builder /app/target/demo-11-0.0.1-SNAPSHOT.war app.war

# Exponer el puerto en el que la aplicación se ejecuta (ajusta según la configuración de tu aplicación)
EXPOSE 8080

# Comando para ejecutar la aplicación al iniciar el contenedor
CMD ["java", "-jar", "app.war"]
