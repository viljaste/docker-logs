# docker-logs

Centralized logging for [Docker](https://docker.com/) containers.

## Run the container

Using the `docker` command:
 
    CONTAINER="logs" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /var/lib/docker/containers:/var/lib/docker/containers \
      -d \
      simpledrupalcloud/logs:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-logs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-logs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/logs:latest . \
      && cd -

## License

**MIT**
