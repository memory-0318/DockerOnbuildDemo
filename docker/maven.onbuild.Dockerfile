FROM maven:3-openjdk-8
RUN mkdir /projects
ONBUILD COPY . /projects
WORKDIR /projects
ONBUILD RUN mvn clean package