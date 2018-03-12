# DOCKER-VERSION 1.12.1 
FROM ubuntu:16.04
MAINTAINER Anderson Miller <anderson.miller@frogdesign.com>

RUN echo "8.8.8.8" >> /etc/resolv.conf
RUN echo "8.8.4.4" >> /etc/resolv.conf
RUN apt-get update -qq --fix-missing
RUN apt-get install -y -qq apt-utils software-properties-common
RUN apt-get install -y nodejs npm curl git-core
RUN apt-get install -y gzip git curl python libssl-dev pkg-config build-essential

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN mkdir /build/
WORKDIR /build/
COPY bin /build/bin
COPY doc /build/doc
COPY src /build/src
COPY tests /build/tests
COPY var /build/var
COPY CHANGELOG.md /build/CHANGELOG.md
COPY CONTRIBUTING.md /build/CONTRIBUTING.md
COPY LICENSE /build/LICENSE
COPY Makefile /build/Makefile
COPY README.md /build/README.md
COPY settings.json.template /build/settings.json.template
COPY start.bat /build/start.bat


EXPOSE 9001
CMD /bin/bash /build/bin/run.sh --root
