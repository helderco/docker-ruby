# Ruby (DEPRECATED)

Based on [official ruby](https://registry.hub.docker.com/_/ruby/) image, but adds UTF-8 locale, gosu and entrypoint to map a new `ruby` user's uid and gid to a volume's onwer.

See official image for usage.

## UID mapping

By default, the `ruby` user's uid and gid will be set to the owner of the current working directory. If you wish to disable this feature, set the environment variable `MAP_RUBY_UID=no`.

    $ # run command as ruby user
    $ docker run -it --rm helder/ruby gosu ruby id
    uid=999(ruby) gid=999(ruby) groups=999(ruby)

    $ # see that it is mapping
    $ docker run -it --rm -v $PWD:/usr/src/app -w /usr/src/app helder/ruby gosu ruby id
    uid=1000(ruby) gid=1000(ruby) groups=1000(ruby)

    $ # use another directory
    $ docker run -it --rm -v $PWD:/data -e MAP_RUBY_UID=/data helder/ruby gosu ruby id
    uid=1000(ruby) gid=1000(ruby) groups=1000(ruby)

    $ # disable mapping
    $ docker run -it --rm -v $PWD:/usr/src/app -w /usr/src/app -e MAP_RUBY_UID=no helder/ruby gosu ruby id
    uid=999(ruby) gid=999(ruby) groups=999(ruby)

With this mapping, assuming the current working directory is a host volume, now any files generated inside the container (e.g., with compass), should have the same uid and gid as your host's user.
