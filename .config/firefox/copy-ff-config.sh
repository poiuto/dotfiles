#!/bin/bash

curDir="$(dirname "$(readlink -f "$0")")"
sudo cp $curDir/* $HOME/.mozilla/firefox/*.default-release/chrome/
