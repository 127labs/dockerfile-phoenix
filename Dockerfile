FROM 127labs/elixir:latest

RUN apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

COPY ./run.sh /
ENTRYPOINT ["/run.sh"]
