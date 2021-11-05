FROM ruby:2.7.4
ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential \
            libpq-dev \
            nodejs

RUN mkdir /app

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler -v 2.1.4
ENV BUNDLER_VERSION 2.1.4
RUN bundle install

ADD . $APP_ROOT