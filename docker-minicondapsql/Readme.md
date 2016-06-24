From

https://hub.docker.com/r/continuumio/miniconda/

build:

$ docker build -t pivotal/minicondapsql .

running with web-app:

$ docker run -i -t -p 8888:8888 pivotal/minicondapsql

running without web-app:

$ docker run -i -t pivotal/minicondapsql /bin/bash