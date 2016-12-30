# from template debian 
FROM renzok/debian:v1

MAINTAINER Renzo Kottmann <renzo.kottmann@gmail.com>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update -qq && \
    apt-get install --auto-remove -y \
      oracle-java8-installer \
      oracle-java8-set-default && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

USER ${USER}

ENTRYPOINT ["java"]
 
