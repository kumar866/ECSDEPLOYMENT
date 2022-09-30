FROM tomcat:7-jdk8-corretto
COPY target/LoginWebApp-1*.war /usr/local/tomcat/webapps/LoginWebApp-1.war
