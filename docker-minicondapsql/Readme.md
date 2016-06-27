# Using miniconda and psql client Docker container

## Pull From

* $ docker pull cassiodias/minicondapsql

## And run

* $ docker run -i -t pivotal/minicondapsql /bin/bash

## Building your own

* $ git clone https://github.com/cassiodias/environment_automation.git
* $ cd environment_automation/docker-minicondapsql
* $ docker build -t pivotal/minicondapsql .

Running without web-app support:
* $ docker run -i -t pivotal/minicondapsql /bin/bash

Running with web-app support:
* $ docker run -i -t -p 8888:8888 pivotal/minicondapsql
