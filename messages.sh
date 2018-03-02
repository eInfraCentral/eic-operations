#!/usr/bin/env bash

./git.sh --no-pager log --pretty=format:"%s" "$@"
