# Fuseki 2.6 on Docker

## Purpose:
* We start a stateless Fuseki server to collect data from "Semantic Logging Layer"
* We develop useful SPARQL queries and onotologies for the Data Science Process model.


# Docker Documentation
## Help
* [Docs](https://docs.docker.com)
* [Docs > Dockerfile](https://docs.docker.com/engine/reference/builder/)
* [Docs > Commandline](https://docs.docker.com/engine/reference/commandline/cli)

## Working with a Dockerfile

### Build docker image

`docker build -t emdm-fuseki-server-image:latest .`

### Run docker container

`docker run --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container emdm-fuseki-server-image`

```{r, engine='bash', count_lines}
docker run --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container-001 emdm-fuseki-server-image
[2017-07-02 16:51:01] Server     INFO  Dataset: in-memory
[2017-07-02 16:51:01] Server     INFO  Fuseki 2.6.0
[2017-07-02 16:51:01] Config     INFO  FUSEKI_HOME=/apache-jena-fuseki-2.6.0
[2017-07-02 16:51:01] Config     INFO  FUSEKI_BASE=/etc/fuseki
[2017-07-02 16:51:01] Servlet    INFO  Initializing Shiro environment
[2017-07-02 16:51:01] Config     INFO  Shiro file: file:///etc/fuseki/shiro.ini
[2017-07-02 16:51:01] Config     INFO  Template file: templates/config-mem
[2017-07-02 16:51:02] Config     INFO  Register: /emdm
[2017-07-02 16:51:02] Server     INFO  Started 2017/07/02 16:51:02 GMT on port 3030
```

...or publish all ports. *Caution: Not recommended for production.*

`docker run -P --name=emdm-fuseki-server-container emdm-fuseki-server-image`


### List running docker containers

`docker ps`

### Stop docker container

`docker stop emdm-fuseki-server-image`

### List all docker containers

`docker ps -a`

### Remove created container

`docker rm emdm-fuseki-server-image`

### Run docker container with removal

`docker run --expose=3030 --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container --rm emdm-fuseki-server-image`

### Run docker container in background

`docker run --expose=3030 --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container -d emdm-fuseki-server-image`

### Step into container

`docker exec -it emdm-fuseki-server-container sh`

### Stop container

`docker stop emdm-fuseki-server-container`

### Start container

`docker start emdm-fuseki-server-container`

### Run docker container and step into

`docker run --expose=3030 --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container --rm -it emdm-fuseki-server-image sh`

### Kill container with SIGTERM

`docker kill emdm-fuseki-server-container`

### Remove our image

`docker rmi emdm-fuseki-server-image`
