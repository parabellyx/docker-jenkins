# docker-jenkins

This container is derived from jenkins/jenkins:lts-jdk11 with the following components added:

* nodejs
* npm
* python3-pip
* python3-venv
* Zaproxy

To start the container, run the following command:

```sh
$ docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins

```
