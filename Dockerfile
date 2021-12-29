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

RUN wget -O /opt/ZAP_2.11.1_Linux.tar.gz https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2.11.1_Linux.tar.gz \
    && ZAP_SHA256="5f83666e5863f4f94eac583942f1c4e15f9cc7b7307d05bc6ce6545265c6382c" \
    && echo "${ZAP_SHA256} */opt/ZAP_2.11.1_Linux.tar.gz" | sha256sum -c - \
    && tar -xzvf /opt/ZAP_2.11.1_Linux.tar.gz -C /opt/ \
    && ln -s /opt/ZAP_2.11.1 /opt/zap
            
USER jenkins
    
