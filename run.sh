#!/bin/bash

MIX_ENV=prod
DIR=$(pwd)

if [ "$(ls -A $DIR)" ]; then
  mix clean && \
    mix deps.clean && \
    mix deps.get --only prod && \
    npm install && \
    mix compile && \
    npm run deploy && \
    mix phoenix.digest && \
    mix ecto.create && \
    mix ecto.migrate && \
    exec mix phoenix.server
else
  echo "$DIR is Empty"
fi
