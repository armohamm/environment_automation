From

docker pull cassiodias/minicondapsql

build:

$ docker build -t pivotal/minicondapsql .

running without web-app:

$ docker run -i -t pivotal/minicondapsql /bin/bash

running with web-app:

$ docker run -i -t -p 8888:8888 pivotal/minicondapsql
