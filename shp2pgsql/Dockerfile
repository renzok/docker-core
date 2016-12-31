FROM debian:sid

MAINTAINER Renzo Kottmann <rkottman@mpi-bremen.de>

RUN echo "deb http://ftp.halifax.rwth-aachen.de/debian/ wheezy main non-free contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends postgresql-9.1-postgis=1.5.3-2
   
ENV APP_DIR /marine-regions

VOLUME ${APP_DIR}


##RUN shp2pgsql -s 4326 -d -k -t 2D -g geom -I  -W UTF-8 /${APP_DIR}/${SOURCE_NAME}/LME66.shp ${SCHEMA_NAME}.${SOURCE_NAME} > ${STAGE_DIR}/${SOURCE_NAME}.sql


#CMD ["-s 4326", "-d", "-k", "-t 2D", "-g geom", "-I",  "-W UTF-8"]
ENTRYPOINT ["shp2pgsql"] 