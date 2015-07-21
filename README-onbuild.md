# Docker ruby (onbuild)

Based on [helder/ruby](https://registry.hub.docker.com/u/helder/ruby/) image (adds utf-8 locale to official images), assumes there's a `Gemfile` (and maybe `Gemfile.lock`) in current directory.

## Basic usage

Let´s say you have the files:

    .
    └── theme
        ├── Gemfile
        └── Gemfile.lock

Add a `theme/Dockerfile` with:

    FROM helder/ruby-onbuild:2.2

After building, you'll have an image with all your ruby dependencies installed:

    docker build -t yourimage theme

## Example with docker-compose and compass

Assuming the example above, add something like this to your `docker-compose.yml`:

    compass:
      build: theme
      command: compass watch
      volumes:
        - theme:/app
      working_dir: /app

This will build your ruby dependencies to an image (compass being one of those), set the working directory
to where you want to run `compass` in, and watch for changes.
