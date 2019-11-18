#!/bin/sh

apk update; apk add --no-cache \
    coreutils bash

HERE=$(dirname "$0")
mkdir -p /util/runner/log

# FIXME: dit moet op run time draaien in plaast van op build time...
chmod -R a+w /util/runner/log

mv "$HERE/runner.sh" /usr/local/bin
rm -rf "$HERE"
