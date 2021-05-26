FROM tomcat7

LABEL MAINTAINER "nancy202042@gmial.com"

ADD /var/lib/jenkins/workspace/pro pipeline/target/WebAppCal-1.2.1.war /home/centos/apache-tomcat-7.0.94/webapps

EXPOSE : 8000
