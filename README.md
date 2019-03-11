# Rtl_433 docker build

This is a minimal docker build for [rtl_433](https://github.com/merbanan/rtl_433) based on alpine.

Build with `docker build -t mindavi/rtl_433`.
Run it with `docker run --device "/dev/bus/usb:/dev/bus/usb" mindavi/rtl_433_docker`.
