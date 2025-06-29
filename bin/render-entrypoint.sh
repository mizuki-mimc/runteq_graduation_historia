#!/usr/bin/env bash
# exit on error
set -o errexit

rm -f /app/tmp/pids/server.pid

echo "Running database migrations..."
bundle exec rails db:migrate

exec "$@"
