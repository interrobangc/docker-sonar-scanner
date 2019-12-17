FROM openjdk:alpine

ENV SONAR_SCANNER_VERSION 4.2.0.1873

RUN apk add --update --no-cache \
    bash \
    nodejs \
    unzip \
    wget \
    && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux && \
    sed -i -e 's/use_embedded_jre=true/use_embedded_jre=false/g' /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner && \
    ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner

CMD sonar-scanner