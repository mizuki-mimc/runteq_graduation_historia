#!/usr/bin/env bash
# exit on error
set -o errexit

rm -f /app/tmp/pids/server.pid

echo "Setting up the database..."

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:setup

exec "$@"
