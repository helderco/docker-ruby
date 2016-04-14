FROM ruby:2.2-slim
MAINTAINER Helder Correia <me@heldercorreia.com>

# set the locale
RUN apt-get update -qq \
 && apt-get install locales -y \
 && dpkg-reconfigure locales \
 && locale-gen C.UTF-8 \
 && update-locale LANG=C.UTF-8 \
 && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
 && locale-gen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
  && curl -sSLo /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
  && curl -sSLo /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
  && export GNUPGHOME="$(mktemp -d)" \
  && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
  && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
  && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu \
  && gosu nobody true

# explicitly set user/group IDs
RUN groupadd -r ruby --gid=999 && useradd -r -g ruby --uid=999 ruby

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
