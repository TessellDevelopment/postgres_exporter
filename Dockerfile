FROM ubuntu:20.04
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends curl golang jq htop -y

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/postgres_exporter /bin/postgres_exporter

EXPOSE     9187
USER       nobody
ENTRYPOINT [ "/bin/postgres_exporter", "--log.level=debug" ]
