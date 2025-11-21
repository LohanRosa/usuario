FROM gradle:7.5-jdk21 AS builder
WORKDIR /app
COPY . .
run gradle build --no-daemon

FROM azul/zulu-openjdk:21.0.8-jdk

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/usuario.jar

EXPOSE 8081

CMD ["java", "-jar", "/app/usuario.jar"]
