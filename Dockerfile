#
# Dockerfile for cpuminer
# usage: docker run creack/cpuminer --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/cpuminer --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM ubuntu:16.04
MAINTAINER Evgeniy Ozhiganov <eozhiganov@gail.com>

RUN		apt-get update -qq && apt-get install -qqy \
  automake \
  libcurl4-openssl-dev \
  git \
  make \
  build-essential


RUN             git clone https://github.com/pooler/cpuminer

RUN		cd cpuminer-multi && ./autogen.sh && ./configure CFLAGS="-O3" && make

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd"]
