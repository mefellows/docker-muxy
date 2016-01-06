#!/bin/bash -e

docker build -t mefellows/docker-muxy .
docker push mefellows/muxy
