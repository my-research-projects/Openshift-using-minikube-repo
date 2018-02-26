FROM openjdk:8-jre

USER root

ENV KIBANA_HOME /usr/local/kibana

ENV WORKING_DIR /usr/local/scripts

RUN apt-cache policy kibana

RUN apt-get update && apt-get install -y procps

RUN groupadd kibana
RUN useradd -ms /bin/bash -g kibana kibana && adduser kibana sudo

#RUN chmod 755 -R /usr

WORKDIR $WORKING_DIR
ADD entrypoint-kibana.sh /usr/local/scripts/entrypoint-kibana.sh
ADD kibana.yml $WORKING_DIR
RUN chmod -R 755 $WORKING_DIR

RUN mkdir -p $KIBANA_HOME/kibana-5.4.0-linux-x86_64

# install kibana

	RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-5.4.0-linux-x86_64.tar.gz && \
		tar -xvf kibana-5.4.0-linux-x86_64.tar.gz && \
	mv kibana-5.4.0-linux-x86_64 $KIBANA_HOME

ADD kibana.yml $KIBANA_HOME/kibana-5.4.0-linux-x86_64/config/kibana.yml

RUN chown -R kibana:kibana /usr/local/kibana/
RUN chown -R kibana:kibana /usr/local/scripts/kibana.yml
RUN chown kibana:kibana /usr/local/scripts/entrypoint-kibana.sh
RUN chmod +x /usr/local/scripts/entrypoint-kibana.sh
RUN echo $(ls -ltr /usr/local/kibana/kibana-5.4.0-linux-x86_64/optimize/.babelcache.json)
RUN chmod -R 777 /usr/local/kibana/

USER kibana

EXPOSE 5601 19200

RUN chmod -R og+w /usr/local/kibana

USER 1000

ENTRYPOINT ["/usr/local/scripts/entrypoint-kibana.sh"]

CMD ["kibana"]
