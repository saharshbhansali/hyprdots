#!/usr/bin/env sh

scrDir=`dirname "$(realpath "$0")"`
source $scrDir/globalcontrol.sh
cvaDir="${XDG_CONFIG_HOME:-$HOME/.config}/cava"
CAVA_CONF="${cvaDir}/config"
WALL_DCOL="${cvaDir}/Wall-Dcol"
KEY_LINE='### HYPRDOTS CAVA: Autogenerated line below for wallbash###'

if pkg_installed cava ; then

    sed -i "/${KEY_LINE}/,\$d" "${CAVA_CONF}"
    if grep -q "${KEY_LINE}" "${CAVA_CONF}"; then
        sed -i "/${KEY_LINE}/r ${WALL_DCOL}" "${CAVA_CONF}"
    else
        echo "${KEY_LINE}" >> "${CAVA_CONF}"
        sed -i "/${KEY_LINE}/r ${WALL_DCOL}" "${CAVA_CONF}"
    fi

    pkill -USR2 cava

fi
