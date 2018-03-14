FROM maven:3-jdk-8-alpine

VOLUME ["/target"]

COPY . /nexus

RUN echo -e '#!/bin/bash\nmvn package -Dmaven.test.skip=true && rm -rf /root/.m2 && cp ./target/nexus-*-SNAPSHOT.jar /target' >> /usr/bin/nexus-build && \
    chmod 755 /usr/bin/nexus-build

WORKDIR /nexus

ENTRYPOINT ["/usr/bin/nexus-build"]
