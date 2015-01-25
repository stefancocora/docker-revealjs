FROM ubuntu:14.04

# based on work from https://github.com/parente/dockerfiles
MAINTAINER Frieder Schlesier <frieder@opendriverslog.de>

ENV REVEAL_VERSION 3.0.0

RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main universe" >> /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y \
            wget \
            nodejs \
            npm \
            nodejs-legacy \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/hakimel/reveal.js/archive/${REVEAL_VERSION}.tar.gz \
    && tar xzf ${REVEAL_VERSION}.tar.gz \
    && mv /reveal.js-${REVEAL_VERSION} /revealjs \
    && rm *.tar.gz

RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli \
    && npm install

RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/' \
    && grunt --force
ADD index.html /revealjs/
ADD title.js /revealjs/plugin/

ONBUILD ADD slides.md /revealjs/md/
ONBUILD ADD images/ /revealjs/images/
ONBUILD ADD custom.css /revealjs/css/

EXPOSE 8000
VOLUME ["/revealjs/md/"]
CMD ["grunt", "serve"]
