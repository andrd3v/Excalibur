ARCHS := arm64 arm64e
TARGET := iphone:clang:16.5:14.0
INSTALL_TARGET_PROCESSES := Excalibur

include $(THEOS)/makefiles/common.mk

GIT_TAG_SHORT := $(shell git describe --tags --always --abbrev=0)
APPLICATION_NAME := Excalibur

#Remade by https://t.me/andrdevv
#Remade by https://github.com/andrd3v


Excalibur_USE_MODULES := 0
Excalibur_FILES += $(wildcard objc_base/*.mm objc_base/*.m)
Excalibur_FILES += $(wildcard cheat/*.mm cheat/*.m)
Excalibur_CFLAGS += -fobjc-arc -Wno-unused-function -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-module-import-in-extern-c
Excalibur_CFLAGS += -Iinclude
Excalibur_CFLAGS += -include hud-prefix.pch
Excalibur_CCFLAGS += -DNOTIFY_LAUNCHED_HUD=\"ch.xxtou.notification.hud.launched\"
Excalibur_CCFLAGS += -DNOTIFY_DISMISSAL_HUD=\"ch.xxtou.notification.hud.dismissal\"
Excalibur_CCFLAGS += -DNOTIFY_RELOAD_HUD=\"ch.xxtou.notification.hud.reload\"
Excalibur_CCFLAGS += -DNOTIFY_RELOAD_APP=\"ch.xxtou.notification.app.reload\"
MainApplication.mm_CCFLAGS += -std=c++14
Excalibur_FRAMEWORKS += CoreGraphics QuartzCore UIKit
Excalibur_PRIVATE_FRAMEWORKS += BackBoardServices GraphicsServices IOKit SpringBoardServices


ifeq ($(TARGET_CODESIGN),ldid)
Excalibur_CODESIGN_FLAGS += -Sent.plist
else
Excalibur_CODESIGN_FLAGS += --entitlements ent.plist $(TARGET_CODESIGN_FLAGS)
endif

include $(THEOS_MAKE_PATH)/application.mk

after-stage::
	$(ECHO_NOTHING)mkdir -p packages $(THEOS_STAGING_DIR)/Payload$(ECHO_END)
	$(ECHO_NOTHING)cp -rp $(THEOS_STAGING_DIR)/Applications/Excalibur.app $(THEOS_STAGING_DIR)/Payload$(ECHO_END)
	$(ECHO_NOTHING)cd $(THEOS_STAGING_DIR); zip -qr Excalibur_${GIT_TAG_SHORT}.tipa Payload; cd -;$(ECHO_END)
	$(ECHO_NOTHING)mv $(THEOS_STAGING_DIR)/Excalibur_${GIT_TAG_SHORT}.tipa packages/Excalibur_${GIT_TAG_SHORT}.tipa $(ECHO_END)



#Remade by https://t.me/andrdevv
#Remade by https://github.com/andrd3v
