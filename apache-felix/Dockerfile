# from template debian 
FROM renzok/java:latest

MAINTAINER Renzo Kottmann <renzo.kottmann@gmail.com>

ENV APP_DIR='/opt/apache-felix' \
    FELIX_VERSION="5.4.0" 
# need to split env statements, so that the previous are available to the next
ENV FELIX_DISTRO="org.apache.felix.main.distribution-${FELIX_VERSION}.tar.gz" \
    FELIX_DIR="${APP_DIR}/felix-framework-${FELIX_VERSION}" \
    FELIX_BUNDLE_DIR='/var/felix/bundle'


# Install felix distribution
RUN mkdir ${APP_DIR} && \
    curl --output ${APP_DIR}/${FELIX_DISTRO} http://mirror.dkd.de/apache/felix/${FELIX_DISTRO} && \
    tar zxf ${APP_DIR}/${FELIX_DISTRO} -C ${APP_DIR} && \
    rm ${APP_DIR}/${FELIX_DISTRO} && \
    mkdir -p ${FELIX_BUNDLE_DIR} 

# now installing commonly used other bundles in system loaded bundle directory
RUN cd ${FELIX_DIR}/bundle && \
    curl --remote-name --progress-bar \
    --url http://ftp.fau.de/apache/felix/org.apache.felix.webconsole-4.2.16-all.jar \
    --remote-name --url http://apache.openmirror.de//felix/org.apache.felix.eventadmin-1.4.6.jar \
    --remote-name --url http://central.maven.org/maven2/org/eclipse/jetty/jetty-continuation/9.3.9.v20160517/jetty-continuation-9.3.9.v20160517.jar \
    --remote-name --url http://repo1.maven.org/maven2/org/apache/felix/org.apache.felix.http.api/2.3.0/org.apache.felix.http.api-2.3.0.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.base-3.0.8.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.bridge-3.0.8.jar \
    --remote-name --url http://apache.openmirror.de//felix/org.apache.felix.http.bundle-2.4.0.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.cometd-2.3.2.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.jetty-3.2.0.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.proxy-3.0.2.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.sslfilter-1.0.4.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.whiteboard-3.0.0.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.http.servlet-api-1.1.2.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.fileinstall-3.5.4.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.configadmin-1.8.8.jar \
    --remote-name --url http://ftp.fau.de/apache//felix/org.apache.felix.log-1.0.1.jar 

RUN echo "felix.fileinstall.dir=${FELIX_BUNDLE_DIR}" >> ${FELIX_DIR}/conf/config.properties && \
    echo "felix.fileinstall.log.level=4" >> ${FELIX_DIR}/conf/config.properties && \
    cat ${FELIX_DIR}/conf/config.properties


EXPOSE 8080

VOLUME /var/felix/bundle

WORKDIR ${FELIX_DIR}
# launch with gogo shell in nointeractive to be able to run in detach mode
CMD ["-Xdebug", "-Xnoagent", "-Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n", "-jar","bin/felix.jar"]

ENTRYPOINT ["java"]

