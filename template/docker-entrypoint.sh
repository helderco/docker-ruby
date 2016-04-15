#!/bin/bash
set -e

# Change uid and gid of ruby user so it matches ownership of current dir
if [ "$MAP_RUBY_UID" != "no" ]; then
    if [ ! -d "$MAP_RUBY_UID" ]; then
        MAP_RUBY_UID=$PWD
    fi

    uid=$(stat -c '%u' "$MAP_RUBY_UID")
    gid=$(stat -c '%g' "$MAP_RUBY_UID")

    usermod -u $uid ruby 2> /dev/null && {
      groupmod -g $gid ruby 2> /dev/null || usermod -a -G $gid ruby
    }
fi

exec "$@"
