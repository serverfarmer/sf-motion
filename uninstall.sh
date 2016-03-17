#!/bin/sh

if grep -q /opt/farm/ext/motion/cron /etc/crontab; then
	sed -i -e "/\/opt\/farm\/ext\/motion\/cron/d" /etc/crontab
fi
