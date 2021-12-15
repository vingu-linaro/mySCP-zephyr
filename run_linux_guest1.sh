#!/bin/bash - 
qemu-system-aarch64	-kernel /home/vingu/Linaro/Kernel/out/binaries/arm64/Image \
			-hda /home/vingu/Tools/Dev/qemu-imgs-manipulator/images/qemu-image-aarch64-1.img \
			-append 'root=/dev/vda console=ttyAMA0 loglevel=8 sched_debug nokaslr' -nographic \
			-machine virt,gic-version=max -m 1G -cpu cortex-a57 -smp 2 -semihosting-config enable=on,target=native \
			-serial tcp:localhost:54324 \
			-device vhost-user-scmi-device,chardev=vscmi1,id=scmi1 \
			-chardev socket,path=vscmi-guest1.sock,id=vscmi1 \
			-object memory-backend-file,id=virt_sram,size=1M,mem-path=/dev/shm/vmem0,share=on \
			-global virtio-mmio.force-legacy=false \
			-dtb virt-scmi-guest1.dtb 

