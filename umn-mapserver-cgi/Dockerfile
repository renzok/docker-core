FROM debian:jessie	
MAINTAINER Renzo Kottmann <rkottman@mpi-bremen.de>

ENV GMS_DIR=/genes-mapserver
ENV LANG C.UTF-8
#RUN update-locale LANG=C.UTF-8

# Update and upgrade system
RUN apt-get -qq update --fix-missing && \
    apt-get install -y cgi-mapserver mapserver-bin


RUN mkdir ${GMS_DIR}

VOLUME ${GMS_DIR}

ENTRYPOINT ["/usr/lib/cgi-bin/mapserv"]