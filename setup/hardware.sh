#!/bin/bash

if sudo dmidecode | grep 'Manufacturer: Framework' &> /dev/null ; then
    # official workaround to enable display brightness buttons
    # https://guides.frame.work/Guide/Fedora+36+Installation+on+the+Framework+Laptop/108#s734
    sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"

    # enable hardware accelerated video decoding
    # https://fedoraproject.org/wiki/Firefox_Hardware_acceleration#Configure_VA-API_Video_decoding_on_Intel
    # https://community.frame.work/t/linux-battery-life-tuning/6665
    packages=(
        libva libva-utils libva-intel-driver
        intel-media-driver
    )
    sudo dnf install -yq ${packages[@]}

    # battery life tuning according to
    # https://community.frame.work/t/linux-battery-life-tuning/6665

    # TODO

    # CAUTION some of those tips may suspend external keyboards (annoying)
fi
