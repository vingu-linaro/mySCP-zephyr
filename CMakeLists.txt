# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13.1)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

target_sources(app PRIVATE src/main.c)

target_link_libraries(app PRIVATE arch-zephyr)

add_subdirectory("src/SCP-firmware" EXCLUDE_FROM_ALL)
