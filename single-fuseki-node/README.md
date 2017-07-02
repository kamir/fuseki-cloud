# Docker EMDM Fuseki

## Goals

* Start a stateless Fuseki server
* Practice SPARQL queries and onotologies.

## Help

* [Docs](https://docs.docker.com)
* [Docs > Dockerfile](https://docs.docker.com/engine/reference/builder/)
* [Docs > Commandline](https://docs.docker.com/engine/reference/commandline/cli)

## Phase 1

### Dockerfile

---SHOW CODE---

### Build docker image

`docker build -t emdm-fuseki-server-image:latest .`

### Run docker container

`docker run --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container emdm-fuseki-server-image`

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
