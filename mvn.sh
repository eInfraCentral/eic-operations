find .. -name "pom.xml" -exec mvn $2 -f '{}' \;
if command -v paplay >/dev/null 2>&1 then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
fi
