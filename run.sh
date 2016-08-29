#!/bin/bash

export APP_DIR=$(pwd)
export APP_HOST=$(hostname -I)

if [[ "$(ls -A $APP_DIR)" ]]; then
  mix ecto.create && mix ecto.migrate

  if [[ $APP_COOKIE && $APP_NAME ]]; then
    exec elixir --name $APP_NAME@$APP_HOST --cookie $APP_COOKIE -S mix phoenix.server
  else
    exec mix phoenix.server
  fi
else
  echo "$APP_DIR is Empty"
fi
