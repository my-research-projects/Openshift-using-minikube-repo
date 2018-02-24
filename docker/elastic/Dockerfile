FROM openjdk:8-jre

USER root

ENV ELASTICSEARCH_HOME /usr/local/scripts/elasticsearch-5.4.0

ENV WORKING_DIR /usr/local/scripts

#RUN apt-get update && apt-get -y install sudo

RUN apt-get update && apt-get install -y procps
RUN groupadd elasticsearch
RUN useradd -ms /bin/bash -g elasticsearch elasticsearch && adduser elasticsearch sudo

WORKDIR $WORKING_DIR

ADD entrypoint-elasticsearch.sh $WORKING_DIR
ADD elasticsearch.yml $WORKING_DIR

# install elasticsearch

	RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.tar.gz
	RUN tar xzvf elasticsearch-5.4.0.tar.gz 

ADD elasticsearch.yml $ELASTICSEARCH_HOME/config/elasticsearch.yml

RUN chown -Rv elasticsearch:elasticsearch $WORKING_DIR
RUN chmod -R 777 $WORKING_DIR

#RUN chown -Rv elasticsearch:elasticsearch $ELASTICSEARCH_HOME
#RUN chmod -R 777 $ELASTICSEARCH_HOME

RUN echo $(ls -ltr /usr/local/scripts/elasticsearch-5.4.0/config)

EXPOSE 9200 9300

#VOLUME ["$WORKING_DIR"]
USER elasticsearch

ENTRYPOINT ["/usr/local/scripts/entrypoint-elasticsearch.sh"]