FROM jenkins/jenkins:slim

USER root

RUN apt update &&  apt install -y \
                   netcat \
                   wget \
    && apt autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt update \
    && apt install -y google-chrome-stable

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt install -y nodejs      
RUN npm install -g selenium-side-runner \     
    && npm install -g chromedriver

RUN wget -O /opt/ZAP_2.11.1_Linux.zip https://github.com/zaproxy/zaproxy/releases/download/w2022-02-14/ZAP_WEEKLY_D-2022-02-14.zip \
    && ZAP_SHA256="d842ed773275e0d939f165e867ae756c2aae7cee16cacf028754ec00e3792405" \
    && echo "${ZAP_SHA256} */opt/ZAP_2.11.1_Linux.zip" | sha256sum -c - \
    && unzip /opt/ZAP_2.11.1_Linux.zip -d /opt/ \
    && ln -s /opt/ZAP_D-2022-02-14 /opt/zap
            
USER jenkins
    