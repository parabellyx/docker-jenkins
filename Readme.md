# docker-jenkins

This container is derived from jenkins/jenkins:lts-jdk11 with the following components added:

* nodejs
* npm
* python3-pip
* python3-venv
* Zaproxy

To start the container, run the following command:

```sh
$ sudo nerdctl build -t jenkins:0.2 .
$ mkdir jenkins_home
$ sudo nerdctl run --rm -p 8080:8080 -p 50000:50000 -v ${PWD}/jenkins_home:/var/jenkins_home jenkins:0.2
```
