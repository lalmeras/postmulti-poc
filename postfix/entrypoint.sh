#! /bin/bash

if [ -d "/postfix-conf" ]; then
  echo "Sync configuration from /postfix-conf (old files may be kept, recreate container to reset)"
  rsync -a /postfix-conf/ /etc/postfix/
  echo "Configuration content"
  find /etc/postfix
fi

postconf maillog_file=/dev/stdout

exec /usr/sbin/postmulti -i - -p start-fg