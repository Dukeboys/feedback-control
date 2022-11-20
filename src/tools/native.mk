###############################################################################
#
# Copyright...
#
#
###############################################################################

.PHONY : setup-native
setup-native: setup-native-debug setup-native-release

.PHONY : setup-native-debug
setup-native-debug:
	cmake \
		-B build/native/debug \
		-S src/ \
		-DCMAKE_BUILD_TYPE=DEBUG

.PHONY : setup-native-release
setup-native-release:
	cmake \
		-B build/native/release \
		-S src/ \
		-DCMAKE_BUILD_TYPE=RELEASE

.PHONY : native
native: native-debug native-release

.PHONY : native-debug
native-debug: setup-native-debug
	cmake \
		--build build/native/debug

.PHONY : release
native-release: setup-native-release
	cmake \
		--build build/native/release
