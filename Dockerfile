FROM ruby:3.3.8-slim-bullseye 

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    yarn \
    libyaml-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

RUN echo "Final final rebuild trigger"
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]