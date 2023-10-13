FROM openjdk:19-jdk-alpine
RUN apk update && \
    apk add tar \
            wget
RUN wget -O petclinic.tar.gz "https://github.com/spring-petclinic/spring-framework-petclinic/archive/refs/tags/v5.3.22.tar.gz" -q \
    && tar -xzf petclinic.tar.gz \
    && rm -f petclinic.tar.gz
RUN apk del tar \
            wget

EXPOSE 8080
WORKDIR spring-framework-petclinic-5.3.22
ENTRYPOINT ["./mvnw", "jetty:run-war"]
