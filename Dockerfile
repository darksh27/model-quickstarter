FROM java:7
RUN apt-get update && apt-get install -y maven git

RUN git clone --depth 1 https://github.com/darksh27/extraction-framework.git
RUN cd extraction-framework && mvn install

RUN git clone -b development --depth 1 https://github.com/darksh27/dbpedia-spotlight.git
RUN cd dbpedia-spotlight && mvn -q clean install

RUN cp dbpedia-spotlight/bin/index_db.sh /opt/

RUN git clone --depth 1 https://github.com/darksh27/wikistatsextractor.git
RUN cd wikistatsextractor && mvn -q clean install

COPY . /opt/
WORKDIR /opt/
RUN ./prepare.sh
