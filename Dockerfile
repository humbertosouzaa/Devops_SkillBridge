# ====== Etapa 1: Build com Maven + Java 21 ======
FROM maven:3.9-eclipse-temurin-21 AS build

# Diretório de trabalho (onde o Render irá montar o projeto)
WORKDIR /workspace

# Copia somente o pom.xml para baixar dependências (cache eficiente)
COPY pom.xml .

# Baixa dependências para acelerar builds futuros
RUN mvn -q dependency:go-offline

# Copia todo o projeto
COPY . .

# Compila para .jar (sem testes)
RUN mvn -q clean package -DskipTests



# ====== Etapa 2: Runtime com Java 21 ======
FROM eclipse-temurin:21-jdk

# Diretório final no container
WORKDIR /workspace

# Copia o artefato final do build
COPY --from=build /workspace/target/*.jar app.jar

# Render injeta PORT dinamicamente
ENV PORT=8080
EXPOSE 8080

# Executa o app
ENTRYPOINT ["java", "-jar", "app.jar"]
