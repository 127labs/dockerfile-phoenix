MIX_ENV=prod
PORT=4001
DIR=$(pwd)

if [ "$(ls -A $DIR)" ]; then
  # Initial setup
  mix deps.get --only prod
  npm install
  mix compile

  # Compile assets
  npm run deploy
  mix phoenix.digest

  # Custom tasks (like DB migrations)
  mix ecto.migrate

  # Finally run the server
  #
  exec mix phoenix.server
else
  echo "$DIR is Empty"
  /bin/bash
fi
