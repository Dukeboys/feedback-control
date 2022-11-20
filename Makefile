
###############################################################################
#
# Copyright...
#
#
###############################################################################

###############################################################################
# Default Build targets
###############################################################################
.DEFAULT_GOAL := all
all: debug release

# Inclusion of per architecture build targets
include src/tools/beaglebone.mk
include src/tools/native.mk

.PHONY : setup
setup: setup-debug setup-release

.PHONY : setup-debug
setup-debug: setup-beaglebone-debug setup-native-debug

.PHONY : setup-release
setup-release: setup-beaglebone-release setup-native-release

.PHONY : debug
debug: beaglebone-debug native-debug

.PHONY : release
release: beaglebone-release native-release

.PHONY : clean
clean: 
	rm -rf build
