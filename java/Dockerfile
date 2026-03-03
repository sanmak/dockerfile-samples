# Build stage — use JDK for compilation
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app
COPY . .
# Uncomment the build command for your build tool:
# Maven:  RUN ./mvnw -B package -DskipTests
# Gradle: RUN ./gradlew build -x test
# For pre-built JARs, ensure the JAR is in the build context:
COPY dockerfilesamples.jar app.jar

# Runtime stage — use JRE for a smaller image
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/app.jar app.jar
RUN adduser -D appuser
USER appuser
ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
# For Spring Boot, add this to reduce startup time:
# ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar
