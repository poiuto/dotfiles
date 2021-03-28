#!/bin/bash

sudo bash -c "echo '[Unit]
Description=Lock the screen on resume from suspend
Before=sleep.target

[Service]
User=$SUDO_USER
Environment=DISPLAY=:0
ExecStart=/usr/bin/slock

[Install]
WantedBy=suspend.target'
" > /etc/systemd/system/lockscreen-on-suspend.service
sudo systemctl enable lockscreen-on-suspend.service
