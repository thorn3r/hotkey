#!/bin/bash
APP="${1}"

if [ "$(pgrep "${APP}")" ]; then
    wmctrl -a "${APP}"
elif [ "$(which "${APP}")" ]; then
    ${1}
elif [ "$(flatpak list | grep "${APP}")" ]; then
    flatpak run "$(flatpak list | grep "${APP}" | awk '{ print $2 }')"
fi
