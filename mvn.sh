#!/usr/bin/env bash

find .. -name "pom.xml" -exec mvn "$@" -f '{}' \;

./beep.sh