FROM jenkins:alpine
RUN apk update && apk add libstdc++ && rm -rf /var/cache/apk/*
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

