FROM maven:3-openjdk-8 as stage1
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package

FROM tomcat:9
COPY --from=stage1 /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
