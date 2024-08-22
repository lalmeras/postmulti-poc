#! /bin/bash

if ! grep -q "multi_instance_enable = yes" /etc/postfix/main.cf; then
  echo "Init multi-instance"
  /usr/sbin/postmulti -e init
  /usr/sbin/postmulti -I postfix-slow -G mta -e create
  /usr/sbin/postmulti -I postfix-relay -G mta -e create
fi

if [ -d "/postfix-conf" ]; then
  echo "Sync configuration from /postfix-conf (old files may be kept, recreate container to reset)"
  rsync -a /postfix-conf/ /etc/
  echo "Configuration content"
  find /etc/postfix*
fi

touch /var/log/maillog /var/log/maillog-slow /var/log/maillog-relay

/usr/sbin/postfix start
/usr/bin/tail -f /var/log/maillog*