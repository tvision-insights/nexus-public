FROM maven:3-jdk-8-alpine

VOLUME ["/root/.m2"]
VOLUME ["/target"]

COPY . /nexus
COPY nexus-build /usr/bin/

RUN chmod 755 /usr/bin/nexus-build

WORKDIR /nexus

ENTRYPOINT ["/usr/bin/nexus-build"]
