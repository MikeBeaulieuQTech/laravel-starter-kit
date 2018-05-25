FROM centos/nodejs-6-centos7

MAINTAINER Timothy Teoh <chalcedonyt@gmail.com>

# Add builder scripts
COPY bin/      $STI_SCRIPTS_PATH/

USER root

# Set sensible home directory
RUN usermod -d /opt/app-root default

RUN mkdir -p        /opt/app-root/src \
&&  chown -R 1001:0 /opt/app-root \
&&  chmod -R og+rwx /opt/app-root \
&&  chmod -R +x     $STI_SCRIPTS_PATH

USER 1001

WORKDIR /opt/app-root/src
