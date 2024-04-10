export THEOS_DEVICE_IP=127.0.0.1 
export THEOS_DEVICE_PORT=2222

export ARCHS = arm64 #arm64e #armv7 < ios 10 and lower
export TARGET := iphone:clang:16.4:7.0

#both rootless and rootful causes errors. leave blank 
#but on iphone 8 ios 15 i have to set THEOS_PACKAGE_SCHEME = rootless or i get error
# THEOS_PACKAGE_SCHEME = rootlful
THEOS_PACKAGE_SCHEME = rootless

# INSTALL_TARGET_PROCESSES = SpringBoard
INSTALL_TARGET_PROCESSES = Reader

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VoiceDreamCracked

VoiceDreamCracked_FILES = Tweak.x
VoiceDreamCracked_FRAMEWORKS = UIKit 

VoiceDreamCracked_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
