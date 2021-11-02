FROM jenkins/jenkins:lts-jdk11

USER root

RUN apt update &&  apt install -y \
                   nodejs  \
                   npm  \
                   python3-pip \
                   python3-venv \
                   netcat \
                   wget \
    && apt autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /opt/ZAP_2.11.0_Linux.tar.gz https://github.com/zaproxy/zaproxy/releases/download/v2.11.0/ZAP_2.11.0_Linux.tar.gz \
    && ZAP_SHA256="c2beb84f7fa9b39af657bdb3e0d0dba96425257ea48e0e8b22eeeccd8d55681e" \
    && echo "${ZAP_SHA256} */opt/ZAP_2.11.0_Linux.tar.gz" | sha256sum -c - \
    && tar -xzvf /opt/ZAP_2.11.0_Linux.tar.gz -C /opt/
            
USER jenkins
    