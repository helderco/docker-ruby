FROM ruby:2.2

# Set the locale
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
