/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <fmw_backend.h>

#include <zephyr.h>
#include <sys/printk.h>


void main(void)
{
	printk("Starting virtio scmi backend %s\n", CONFIG_BOARD);

	start_scmi_backend();

}
