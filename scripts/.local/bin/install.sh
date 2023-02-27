#!/bin/bash
# File              : install_i3wm_on_debian.sh
# Author            : zhangzhao <zhangzhao@ihep.ac.cn>
# Date              : 15.07.2020
# Last Modified Date: 25.01.2021
# Last Modified By  : zhangzhao <zhangzhao@ihep.ac.cn>

### 20180515 Script written and fully commented by James Shane ( github.com/jamesshane )
### 20200209 Script refactored into functions by Caesar Campos ( github.com/cizordj )

function preparation() {
    if [ "$(id -u)" == "0" ]; then
        echo "Please run this script as a normal user"
        echo "also make sure to have 'sudo' working..."
        exit 1
    fi
    # Look for env command and link if not found to help make scripts uniform
    if [ -e /bin/env ]; then
        echo "... /bin/env found."
    else
        sudo ln -s /usr/bin/env /bin/env
    fi
    sudo ln -s /sbin/reboot /usr/bin/reboot
    sudo ln -s /sbin/poweroff /usr/bin/poweroff
    shopt -s expand_aliases # enable aliases on this script
    alias mkdir='mkdir --parents --verbose'
    alias cp='cp --verbose'
    alias rm='rm --verbose'
}

function install_required_packages() {
    # Refresh apt
    sudo apt update
    sudo apt install xserver-xorg x11-xserver-utils firmware-iwlwifi firmware-linux-nonfree autoconf unzip binutils gcc make cmake pulseaudio pavucontrol pulseaudio-module-bluetooth python3 python3-pip lightdm meson ninja-build
    # for picom runtime
    sudo apt install libxcb-damage0 libconfig9
}

function install_i3() {
    sudo apt install i3-wm
}

function install_polybar() {
    sudo apt install polybar
}

function install_picom() {
    git clone https://github.com/Arian8j2/picom-jonaburg-fix.git
    cd picom
    meson --buildtype=release . build
    ninja -C build
    sudo ninja -C build install
    cd ..
    rm -rf picom
}

preparation
install_required_packages
install_i3
install_polybar
# install_picom
