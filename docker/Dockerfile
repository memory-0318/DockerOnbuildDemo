FROM maven-base:latest AS build

FROM openjdk:8-jre-alpine
RUN mkdir /app
COPY --from=build /projects/target/*.jar /app/application.jar
WORKDIR /app
CMD "java" "-jar" "application.jar"