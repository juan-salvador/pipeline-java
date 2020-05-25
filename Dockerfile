FROM alpine:3.11.3

RUN apk update
RUN apk --update add openjdk8
RUN apk --update add maven

ADD . /app

WORKDIR /app

RUN mvn package

EXPOSE 8081

ENTRYPOINT [ "java", "-jar", "target/pipeline-java-0.0.1-SNAPSHOT.jar" ]
