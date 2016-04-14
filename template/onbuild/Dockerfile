FROM helder/ruby:{{ version }}
MAINTAINER Helder Correia <me@heldercorreia.com>

ONBUILD COPY Gemfile* /
ONBUILD RUN bundle install
