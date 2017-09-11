#!/usr/bin/env bash
find .. -name "pom.xml" -exec mvn $1 -f '{}' \;
if command -v paplay >/dev/null 2>&1; then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
fi
