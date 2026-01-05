
FROM registry.access.redhat.com/ubi8/ubi:8.7

LABEL maintainer="Mario Basic <mbasic99@gmail.com>"

RUN dnf update -y && dnf upgrade -y

RUN dnf install -y java-1.8.0-openjdk-devel

ENV NEXUS_HOME /opt/nexus

RUN mkdir -p $NEXUS_HOME

COPY nexus-3.37.3-02-unix.tar.gz $NEXUS_HOME/
RUN tar -xzvf $NEXUS_HOME/nexus-3.37.3-02-unix.tar.gz \
    -C $NEXUS_HOME/ \
    --strip-components=1 \
    --keep-directory-symlink
RUN rm $NEXUS_HOME/nexus-3.37.3-02-unix.tar.gz

EXPOSE 8081

WORKDIR $NEXUS_HOME

VOLUME /opt/nexus/sonatype-work

# runs WORKDIR/bin/nexus
CMD ["bin/nexus", "run"]