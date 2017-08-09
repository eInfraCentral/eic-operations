#!/usr/bin/env bash
find .. -name "pom.xml" -exec mvn clean install package $1 -f '{}' \;
if [ -x "$(command -v paplay)" ]; then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
fi
date
