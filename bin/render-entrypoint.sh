set -o errexit

bundle exec rails db:migrate

bundle exec rails db:seed

exec "$@"
