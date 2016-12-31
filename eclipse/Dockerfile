FROM renzok/java:8

MAINTAINER Renzo Kottmann <renzo.kottmann@gmail.com>

# following a private install strategy see http://help.eclipse.org/mars/index.jsp

ENV APP_VERSION=java-mars
ENV APP_DIR=/opt/eclipse-${APP_VERSION}
ENV APP_WORKSPACE_NAME=eclipse-workspace


# preparing install 
RUN mkdir -m 2775 -p ${APP_DIR} && \
    chmod g+s ${APP_DIR} && \
    chown -R ${USER}:${HOST_GROUP} ${APP_DIR}


# install stuff
RUN curl "http://artfiles.org/eclipse.org/technology/epp/downloads/release/mars/1/eclipse-java-mars-1-linux-gtk-x86_64.tar.gz" | tar zx --directory "${APP_DIR}"


# installing required debs
RUN apt-get update -qq && \
    apt-get install --auto-remove -y \
      libswt-gtk-3-jni \
      git \
      libasm3-java \
      junit4 \
      libgtk2.0-dev \
      libcommons-httpclient-java \
      libcommons-codec-java \
      libcommons-logging-java \
      libgconf2-dev \
      libicu4j-4.4-java \
      libjsch-java \
      maven-ant-helper \
      maven-repo-helper \
      pkg-config \
      rsync \
      sat4j \
      libswt-gtk-3-java \
      unzip \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# now everything can be done as non-root
USER mate

# prepapre workspace (instance area in eclipse slang) directories
RUN mkdir -m 2775 -p ${HOME}/${APP_WORKSPACE_NAME}

WORKDIR ${HOME}/${APP_WORKSPACE_NAME}

COPY eclipse.ini ${APP_DIR}/eclipse/

VOLUME ${HOME}/${APP_WORKSPACE_NAME}

# now installing plugins
# see http://www.lorenzobettini.it/2012/10/installing-eclipse-features-via-the-command-line/
# it is a bit outdated: now it is -installIU and better disable eclipse.p2.mirrors
RUN ${APP_DIR}/eclipse/eclipse \
      -application org.eclipse.equinox.p2.director \
      -noSplash \
      -repository \
        http://dl.bintray.com/harawata/eclipse,http://download.eclipse.org/releases/mars,http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-tycho/0.9.0/N/LATEST/,http://download.jboss.org/jbosstools/updates/m2e-wro4j/,http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-egit/0.14.0/N/LATEST/ \
      -installIU \
        net.harawata.mybatipse.feature.feature.group \
      -installIU \
	org.jboss.tools.m2e.wro4j.feature.feature.group \
      -installIU \
	org.eclipse.m2e.wtp.feature.feature.group \
      -installIU \	
        org.eclipse.linuxtools.docker.feature.feature.group \
      -installIU \	
	org.sonatype.tycho.m2e.feature.feature.group \
      -installIU \	
	org.eclipse.team.svn.m2e.feature.group \
#      -installIU \
#	com.basistech.m2e.code.quality.pmd.feature.feature.group \
      -installIU \	
        org.sonatype.m2e.egit.feature.feature.group \
#      -installIU \	
#        org.basepom.m2e.property_helper.feature.feature.group \
#      -installIU \	
#        com.coderplus.m2e.remoteresourcesfeature.feature.group \
#      -installIU \	
#        com.coderplus.m2e.jaxws.feature.group \
#      -installIU \	
#        org.sonatype.m2e.buildhelper.feature.feature.group \
#       -installIU \	
#        com.basistech.m2e.code.quality.findbugs.feature.feature.group \
#       -installIU \	
#        com.basistech.m2e.code.quality.checkstyle.feature.feature.group \
      -vmargs -Declipse.p2.mirrors=false

ENTRYPOINT ["/opt/eclipse-java-mars/eclipse/eclipse"]
 
