FROM viljaste/base:dev

MAINTAINER Jürgen Viljaste <j.viljaste@gmaul.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN apt-get update && /src/build.sh && /src/clean.sh

EXPOSE 80

CMD ["/src/run.sh"]
