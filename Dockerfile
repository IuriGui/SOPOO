FROM maven:3.9.6-eclipse-temurin-21 AS builder

RUN git clone https://github.com/IuriGui/SOPOO /app

WORKDIR /app

RUN mvn clean package -DskipTests

FROM quay.io/wildfly/wildfly:latest

COPY --from=builder /app/target/*.war /opt/jboss/wildfly/standalone/deployments/app.war

EXPOSE 8080

ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

