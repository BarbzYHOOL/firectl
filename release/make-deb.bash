#!/usr/bin/env bash

fpm -s python -t deb \
    --python-bin python3 --python-pip pip3 \
    -n 'firectl' \
    -d 'firejail' -d 'python3' \
    -d 'python3-click' --no-python-dependencies \
    --python-install-bin '/usr/bin' \
    --python-install-lib '/usr/lib/python3/dist-packages' \
    --exclude '*pycache*' \
    --after-install 'deb-postinst.sh' \
    --deb-interest '/usr/share/applications' \
    --before-remove 'deb-prerm.sh' \
    --after-remove 'deb-postrm.sh' \
    --iteration 1 \
    ../setup.py
