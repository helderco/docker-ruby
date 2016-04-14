#!/bin/bash
set -e

# Change uid and gid of www-data so it matches ownership of current dir
if [ -z ${UNMAP_RUBY_UID+x} ]; then
    uid=$(stat -c '%u' "$PWD")
    gid=$(stat -c '%g' "$PWD")
    usermod -u $uid ruby 2> /dev/null && {
      groupmod -g $gid ruby 2> /dev/null || usermod -a -G $gid ruby
    }
fi

exec "$@"
