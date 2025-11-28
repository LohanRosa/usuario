FROM gradle:8.7-jdk21 AS builder
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM azul/zulu-openjdk:21.0.8-jdk

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar /app/usuario.jar

EXPOSE 8081

CMD ["java", "-jar", "/app/usuario.jar"]
