#!/bin/sh

# notify-send if battery is below 25%.

bash -c 'echo "* * * * * $SUDO_USER cronrunparts /etc/cron.minutely" >> /etc/crontab'

bash -c 'echo "#!/bin/sh

# notify-send if battery is below 25%.

[ \"\$(cat /sys/class/power_supply/BAT0/status)\" = \"Charging\" ] && exit
[ \"\$(cat /sys/class/power_supply/BAT0/capacity)\" -lt 25 ] &&
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/\$(id -u $SUDO_USER)/bus &&
notify-send -u critical \"Battery critically low\"" > /etc/cron.minutely/battery'

chmod +x -R /etc/cron.d
