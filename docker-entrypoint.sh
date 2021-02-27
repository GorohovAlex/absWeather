#!/bin/sh
# Interpreter identifier

# Exit on fail
set -e

rm -f $APP_HOME/tmp/pids/server.pid

bundle exec rails db:create db:migrate
# TODO: remove `with_data`
# bundle exec bin/rails db:migrate:with_data

exec "$@"
