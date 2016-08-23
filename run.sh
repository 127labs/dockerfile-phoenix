#!/bin/bash

export MIX_ENV=prod
export APP_DIR=$(pwd)

if [ "$(ls -A $DIR)" ]; then
  mix clean && \
    mix deps.clean --all && \
    mix deps.get --only $MIX_ENV && \
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
