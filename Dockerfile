FROM ruby:3.3.8-slim-bullseye

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        git \
        build-essential \
        libpq-dev \
        libyaml-dev \
        ca-certificates \
        curl \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN bundle install --jobs 4 --retry 3

RUN bundle exec rails tmp:clear

RUN RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 RAILS_MASTER_KEY_BASE_DUMMY=1 bundle exec bin/rails assets:precompile

COPY bin/render-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/render-entrypoint.sh

ENTRYPOINT ["render-entrypoint.sh"]

EXPOSE 3000

CMD ["bash", "-c", "bundle exec rails db:migrate && rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
