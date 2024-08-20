FROM docker.elastic.co/elasticsearch/elasticsearch:8.15.0

COPY elasticsearch/config/hunspell /usr/share/elasticsearch/config/hunspell

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
