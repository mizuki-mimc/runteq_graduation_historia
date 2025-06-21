# Dockerfile (推奨のNode.js 20 LTSインストール方法)

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

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

RUN echo "Final final rebuild trigger"
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
