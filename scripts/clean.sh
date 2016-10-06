#!/bin/bash
set -e

apt-get remove -y --purge qt4-qmake cmake-data qt4-linguist-tools libqt4-dev-bin
dpkg --purge `dpkg -l "*-dev" | sed -ne 's/ii  \(.*-dev\(:amd64\)\?\) .*/\1/p'` || true

if [ "$1"  == "master" ]; then
    # Clean for master (Py3/Qt5)
    apt-get remove -y libqt4* libgtk* libsane gfortran-5 *gnome* libsane *pango* \
                   glib* *gphoto*
fi

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /build
