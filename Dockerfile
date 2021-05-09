FROM pataquets/ubuntu:bionic

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install polipo \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  sed -i 's/^logFile/# logFile/' /etc/polipo/config && \
  sed -i 's/^logSyslog/# logSyslog/' /etc/polipo/config && \
  nl /etc/polipo/config

ENTRYPOINT [ "polipo" ]
