# docker-logs

Centralized logging for [Docker](https://docker.com/) containers. Built on top of [docker-gen](https://github.com/jwilder/docker-gen), [Fluentd](http://www.fluentd.org/), [Elasticsearch](http://www.elasticsearch.org/) and [Kibana](http://www.elasticsearch.org/overview/kibana/).

## Run the container

Using the `docker` command:
 
    CONTAINER="logs" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /var/lib/docker/containers:/var/lib/docker/containers \
      -d \
      viljaste/logs:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-logs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-logs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/logs:latest . \
      && cd -

## Start the container automatically

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-logs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo cp ./fig.yml /opt/logs.yml \
      && sudo cp ./logs.conf /etc/init/logs.conf \
      && cd -

## License

**MIT**
