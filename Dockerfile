FROM tomcat7

LABEL MAINTAINER "nancy202042@gmial.com"

COPY /var/lib/jenkins/workspace/pro1/target/WebAppCal-1.2.1.war /apache-tomcat-7.0.94/webapps

EXPOSE : 8000
