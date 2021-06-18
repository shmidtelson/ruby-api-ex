# syntax=docker/dockerfile:1
FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install
COPY . /code

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]