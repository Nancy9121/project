FROM tomcat

LABEL MAINTAINER "nancy202042@gmial.com"

COPY target/WebAppCal-1.2.1.war /user/local/tomcat/websapps/WebAppCal-1.2.1.war

EXPOSE : 8000
