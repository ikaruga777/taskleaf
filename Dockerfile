FROM ruby:2.6.3

RUN apt-get update -qq \
  && apt-get install -y postgresql-client \
  && apt-get clean

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  APP_HOME=/usr/src/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME/
