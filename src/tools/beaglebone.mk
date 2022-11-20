###############################################################################
#
# Copyright...
#
#
###############################################################################

.PHONY : setup-beaglebone
setup-beaglebone: setup-beaglebone-debug setup-beaglebone-release

.PHONY : setup-beaglebone-debug
setup-beaglebone-debug:
	. /opt/poky/4.0.4/environment-setup-cortexa8hf-neon-poky-linux-gnueabi && \
	cmake \
		-DCMAKE_TOOLCHAIN_FILE=/opt/poky/4.0.4/sysroots/x86_64-pokysdk-linux/usr/share/cmake/OEToolchainConfig.cmake \
		-B build/beaglebone/debug \
		-S src/ \
		-DCMAKE_BUILD_TYPE=DEBUG

.PHONY : setup-beaglebone-release
setup-beaglebone-release:
	. /opt/poky/4.0.4/environment-setup-cortexa8hf-neon-poky-linux-gnueabi && \
	cmake \
		-DCMAKE_TOOLCHAIN_FILE=/opt/poky/4.0.4/sysroots/x86_64-pokysdk-linux/usr/share/cmake/OEToolchainConfig.cmake \
		-B build/beaglebone/release \
		-S src/ \
		-DCMAKE_BUILD_TYPE=RELEASE

.PHONY : beaglebone
beaglebone: beaglebone-debug beaglebone-release

.PHONY : beaglebone-debug
beaglebone-debug: setup-beaglebone-debug
	cmake \
		--build build/beaglebone/debug

.PHONY : release
beaglebone-release: setup-beaglebone-release
	cmake \
		--build build/beaglebone/release
