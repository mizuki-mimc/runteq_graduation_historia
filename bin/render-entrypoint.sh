#!/usr/bin/env bash
# exit on error
set -o errexit

rm -f /app/tmp/pids/server.pid

echo "Setting up the database..."
bundle exec rails db:setup

exec "$@"
