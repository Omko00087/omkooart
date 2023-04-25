ARCHS = arm64 

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testers

testers_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
testers_CFLAGS = -fobjc-arc #-w #-Wno-deprecated -Wno-deprecated-declarations
testers_FILES =Tweak.xm $(wildcard SCLAlertView/*.m)

testers_LIBRARIES += substrate
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 ShadowTrackerExtra || :"
