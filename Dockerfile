FROM ruby:3.3.8-slim-bullseye 

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
