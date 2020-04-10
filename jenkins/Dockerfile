FROM jenkinsci/blueocean

USER root

RUN apk update
RUN apk add --update git \
    vim \
    maven \
    make \
    python \
    python-dev \
    py-pip \
    build-base

RUN pip install awscli --ignore-installed six

RUN apk add --update nodejs npm

RUN npm config set unsafe-perm true

RUN npm install -g newman