FROM jenkins:alpine
USER root
RUN apk update && apk add libstdc++ && rm -rf /var/cache/apk/*
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

