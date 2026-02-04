# !/usr/bin/bash
USB_PORT=/dev/serial/by-id/usb-Arduino__www.arduino.cc__0043_054433A4937351203706-if00
docker run
    \ --device=$USB_PORT:/dev/arduino
    \ -v /home/taichi/source/medal-detector:/works
    \ -e RAVEDUDE_PORT=/dev/arduino
    \ -d
    \ --name arduino-x-rust-ctr
    \ medal-detector-build 
    \ sleep infinity