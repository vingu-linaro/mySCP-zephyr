#!/bin/bash - 
qemu-system-aarch64	-kernel /home/vingu/Linaro/Kernel/out/binaries/arm64/Image \
			-hda /home/vingu/Tools/Dev/qemu-imgs-manipulator/images/qemu-image-aarch64-0.img \
			-append 'root=/dev/vda console=ttyAMA0 loglevel=8 sched_debug nokaslr' -nographic \
			-machine virt,gic-version=max -m 2G -cpu cortex-a57 \
			-smp 2 \
			-semihosting-config enable=on,target=native \
			-serial tcp:localhost:54323 \
			-device vhost-user-scmi-device,chardev=vscmi0,id=scmi0 \
			-chardev socket,path=vscmi-guest0.sock,id=vscmi0 \
			-object memory-backend-file,id=virt_sram,size=1M,mem-path=/dev/shm/vmem0,share=on \
			-global virtio-mmio.force-legacy=false \
			-dtb virt-scmi-guest0.dtb
