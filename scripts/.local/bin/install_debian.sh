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
    sudo apt install xserver-xorg x11-xserver-utils firmware-iwlwifi firmware-linux-nonfree xutils-dev libiw-dev python3-sphinx libxcb-composite0-dev libxcb1-dev libxcb-image0-dev libcairo2-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf dh-autoreconf unzip binutils gcc make pkg-config fakeroot cmake xcb-proto libxcb-ewmh-dev libasound2-dev libpulse-dev libcurl4-openssl-dev libmpdclient-dev pulseaudio pavucontrol pulseaudio-module-bluetooth python3 python3-pip python3-xcbgen libjsoncpp-dev libxcb-xrm-dev lightdm meson ninja-build libuv1-dev libxcb-damage0-dev libxcb-sync-dev libxcb-glx0-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libevdev-dev uthash-dev libpam0g-dev libx11-xcb-dev libxcb-present-dev
}

function install_xcb() {
    git clone --recursive https://github.com/Airblader/xcb-util-xrm.git
    # shellcheck disable=SC2164
    cd xcb-util-xrm/
    ./autogen.sh
    make
    sudo make install
    # shellcheck disable=SC2103
    cd ..
    rm -fr xcb-util-xrm
}

function refresh_shared_libraries() {
    #cat > /etc/ld.so.conf.d/i3.conf
    #/usr/local/lib/
    sudo ldconfig
    sudo ldconfig -p
}

function install_i3_gaps() {

    # git clone https://www.github.com/Airblader/i3 i3-gaps
    # shellcheck disable=SC2164
    # cd i3-gaps
    # rm -Rf build/
    # mkdir build
    # shellcheck disable=SC2164
    # cd build/
    # meson ..
    # ninja
    # sudo ninja install
    # which i3
    # ls -l /usr/bin/i3
    # cd ../..
    # rm -rf i3-gaps/
    sudo apt install i3-wm
}

function install_polybar() {
    git clone https://github.com/jaagr/polybar
    # shellcheck disable=SC2164
    cd polybar
    #git submodule update --init --recursive
    env USE_GCC=ON ENABLE_I3=ON ENABLE_ALSA=ON ENABLE_PULSEAUDIO=ON ENABLE_NETWORK=ON ENABLE_MPD=ON ENABLE_CURL=ON ENABLE_IPC_MSG=ON INSTALL=OFF INSTALL_CONF=OFF ./build.sh -f
    # shellcheck disable=SC2164
    cd build
    sudo make install
    make userconfig
    cd ../..
    rm -fr polybar
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
install_xcb
refresh_shared_libraries
install_i3_gaps
install_polybar
install_picom
