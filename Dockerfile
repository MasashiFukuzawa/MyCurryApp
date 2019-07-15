FROM ruby:2.5.5
ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs     

RUN gem install bundler -v 2.0.2

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /MyCurryApp
COPY . /MyCurryApp
