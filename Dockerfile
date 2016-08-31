FROM 127labs/elixir:latest

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

COPY ./run.sh /tmp
COPY ./wait-for-it /tmp

CMD ["/tmp/run.sh"]
