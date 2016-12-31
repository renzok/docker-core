FROM java:openjdk-7u65-jdk

ENV MAVEN_VERSION 3.2.3
ENV MAVEN_HOME /usr/share/apache-maven-${MAVEN_VERSION}

RUN mkdir -p ${MAVEN_HOME} && \
    curl -sSL http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    | tar xzf - --strip-components=1 -C ${MAVEN_HOME} \
    && ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn


RUN useradd -m dev
ENV SHARE_DIR=/usr/src/app

RUN mkdir -p ${SHARE_DIR} && touch ${SHARE_DIR}/placeholder && chown -R dev:dev ${SHARE_DIR}

VOLUME ${SHARE_DIR}
WORKDIR ${SHARE_DIR}

#ONBUILD ADD . ${SHARE_DIR}
#ONBUILD RUN mvn install

USER dev
CMD ["mvn"]