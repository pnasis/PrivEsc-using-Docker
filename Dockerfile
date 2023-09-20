FROM debian:wheezy

ENV WORKDIR /privesc

RUN mkdir -p $WORKDIR

VOLUME [ $WORKDIR ]

WORKDIR $WORKDIR
