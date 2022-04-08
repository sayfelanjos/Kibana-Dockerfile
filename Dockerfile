FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https  \
        wget  \
        gnupg  \
        ca-certificates && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-8.x.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends kibana

USER kibana

ENV PATH=$PATH:/usr/share/kibana/bin

CMD ["kibana"]

EXPOSE 5601