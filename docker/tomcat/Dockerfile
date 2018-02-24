# Pull the base image for tomcat
FROM tomcat:8-jre9

ENV ADMIN_PORT "9200"
ENV SOCKET_PORT "9300"
ENV ELASTICSEARCH_HOST "elasticsearch"
ENV ELASTICSEARCH_INDEX="spring_elastic_kibana"

ENV TOMCAT_HOME /usr/local/tomcat
RUN mkdir -p /usr/local/scripts
ENV WORKDIR /usr/local/scripts

RUN chmod 755 -R $TOMCAT_HOME
RUN chmod 777 -R /usr/local

# Copy images to tomcat path
ADD spring-elastic-kibana.war $TOMCAT_HOME/webapps/
ADD entrypoint-tomcat.sh /usr/local/scripts

RUN chmod 755 /usr/local/scripts/entrypoint-tomcat.sh

#WORKDIR /usr/local/scripts

RUN echo $(ls -ltr /usr/local/scripts)

EXPOSE 8080

WORKDIR $WORKDIR

RUN chmod -R og+w /usr/local/tomcat

USER 1000

ENTRYPOINT ["/usr/local/scripts/entrypoint-tomcat.sh"]