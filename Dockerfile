FROM 127labs/elixir:latest

MAINTAINER Imran Ismail <imran@127labs.com>

RUN apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3 &&
  echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&
  apt-get update &&
  apt-get install yarn

COPY ./run.sh /tmp
COPY ./wait-for-it.sh /tmp

CMD ["/tmp/run.sh"]
