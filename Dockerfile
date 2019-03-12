FROM maven:3-jdk-12

WORKDIR /usr/src/steve
COPY . .
RUN sed -i 's/db.ip = localhost/db.ip = db/' src/main/resources/config/prod/main.properties
RUN sed -i 's/server.host = 127.0.0.1/server.host = 0.0.0.0/' src/main/resources/config/prod/main.properties

CMD mvn -B -V -e clean package -DskipTests -Djdk.tls.client.protocols="TLSv1,TLSv1.1,TLSv1.2" && java -jar target/steve.jar
