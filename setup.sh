#!/bin/bash
. /opt/farm/scripts/init



if [ "$OSVER" != "debian-squeeze" ] && [ "$OSVER" != "debian-wheezy" ] && [ "$OSVER" != "debian-jessie" ]; then
	echo "skipping motion daemon setup, unsupported operating system version"
	exit 1
fi

path=/srv/apps/motion

if [ "`getent passwd motion`" = "" ]; then
	useradd -s /bin/false -d $path -M motion
	usermod -aG video motion
fi

mkdir -p $path/data
chmod 0711 $path
chmod 0755 $path/data
chown motion:motion $path $path/data

bash /opt/farm/scripts/setup/role.sh motion

/etc/init.d/motion stop
update-rc.d -f motion remove

chmod 0711 /etc/motion

cfg=/etc/motion/.s3cfg
touch $cfg
chmod 0640 $cfg
chown root:motion $cfg
ln -sf $cfg $path/.s3cfg

if ! grep -q /opt/sf-motion/cron/archiver.sh /etc/crontab; then
	echo >>/etc/crontab
	echo "7 * * * * motion /opt/sf-motion/cron/archiver.sh" >>/etc/crontab
fi
