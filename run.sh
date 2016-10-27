#!/bin/bash

export APP_DIR=$(pwd)

if [[ "$(ls -A $APP_DIR)" ]]; then
  mix ecto.create && mix ecto.migrate

  if [[ $NODE_COOKIE ]]; then
    exec elixir --name $NODE_NAME --cookie $NODE_COOKIE -S mix phoenix.server
  else
    exec mix phoenix.server
  fi
else
  echo "$APP_DIR is Empty"
fi
