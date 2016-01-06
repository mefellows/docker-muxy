# Muxy Dockerfile

Official Docker image for [Muxy](https://github.com/mefellows/muxy).

Base Docker Image: [dockerfile/debian](https://hub.docker.com/_/debian/)

## Installation

* Install [Docker](https://www.docker.com/).
* Download build from public Docker Hub Registry: `docker pull mefellows/muxy`
  (alternatively, you can build an image from Dockerfile: `docker build -t="mefellows/muxy" github.com/mefellows/docker-muxy`).

## Usage

Muxy requires a [config file](https://github.com/mefellows/muxy#configuration-reference) to run. Create one, and then share it at `/opt/muxy/conf/config.yml` within the Docker container, ensuring that the container is running a [privileged](https://docs.docker.com/engine/reference/run/#runtime-privilege-linux-capabilities-and-lxc-configuration) network.

Likely, you will also need to expose a port to connect to. Assuming you a proxying on port 80:

```
docker run \
  -d \
  -p 80:80 \
  -v <path to muxy config>:/opt/muxy/conf/config.yml \
  --privileged \
  mefellows/muxy
```
