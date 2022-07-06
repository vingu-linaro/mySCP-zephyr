#!/bin/bash - 
rm -rf build/*
rm /dev/shm/vmem0

source /home/vingu/Linaro/Zephyr/zephyrproject/zephyr/zephyr-env.sh

west build -t run -b qemu_cortex_a53  -- -G"Unix Makefiles" -DSCP_FIRMWARE_SOURCE_DIR:PATH=/home/vingu/Linaro/Zephyr/mySCP-firmware/src/SCP-firmware/product/virtio-zephyr/fw/ -DSCP_LOG_LEVEL=DEBUG -DCMAKE_OBJCOPY:FILEPATH=/home/vingu/bin/zephyr-sdk-0.13.1/aarch64-zephyr-elf/bin/aarch64-zephyr-elf-objcopy -DCMAKE_OBJDUMP:FILEPATH=/home/vingu/bin/zephyr-sdk-0.13.1/aarch64-zephyr-elf/bin/aarch64-zephyr-elf-objdump -DDISABLE_CPPCHECK=1

