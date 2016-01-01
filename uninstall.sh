#!/bin/sh

if grep -q /opt/sf-motion/cron /etc/crontab; then
	sed -i -e "/\/opt\/sf-motion\/cron/d" /etc/crontab
fi
