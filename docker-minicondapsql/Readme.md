# Using miniconda and psql client Docker container

## Pull From

* $ docker pull cassiodias/minicondapsql

## And run

* $ docker run -i -t cassiodias/minicondapsql

## Building your own

* $ git clone https://github.com/cassiodias/environment_automation.git
* $ cd environment_automation/docker-minicondapsql
* $ docker build -t cassiodias/minicondapsql .

Running
* $ docker run -i -t cassiodias/minicondapsql

Running with Jupyter Notebook server and interact with Miniconda via your browser:
* $ docker run -i -t -p 8888:8888 cassiodias/minicondapsql /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"

## Gotchas

If "Cannot connect to the Docker daemon. Is the docker daemon running on this host?"

* $ eval "$(docker-machine env default)"
