# Etapa 1: Build
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:21-jdk

# Crear usuario y grupo no-root
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Crear directorio y asignar permisos
WORKDIR /app
COPY target/producto-service-0.0.1-SNAPSHOT.jar app.jar
RUN chown -R appuser:appgroup /app

# Exponer puertos
EXPOSE 8080 8081 8082

# Cambiar a usuario no-root
USER appuser

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
