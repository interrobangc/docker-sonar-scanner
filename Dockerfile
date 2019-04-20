FROM java:alpine

ENV SONAR_SCANNER_VERSION 3.3.0.1492

RUN apk add --update --no-cache \
        bash \
        wget \
        nodejs \
        && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux && \
    sed -i -e 's/use_embedded_jre=true/use_embedded_jre=false/g' /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner && \
    ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner

CMD sonar-scanner