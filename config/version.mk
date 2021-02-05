# Versioning System
XTENDED_MAJOR_VERSION = XR
XTENDED_RELEASE_VERSION = v5.0

XTENDED_BUILD_DATE := $(shell date +"%Y%m%d")

ifndef XTENDED_BUILD_TYPE
    XTENDED_BUILD_TYPE := XPLOITED
endif

ifeq ($(XTENDED_BUILD_TYPE), OFFICIAL)
   LIST = $(shell cat vendor/xtended/xtended.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       XTENDED_BUILD_TYPE := XPLOITED
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst xtended_,,$(XTENDED_BUILD))

ifneq ($(WITH_GAPPS),true)
XTENDED_VERSION := Xtended-$(XTENDED_MAJOR_VERSION)-$(XTENDED_RELEASE_VERSION)-$(XTENDED_BUILD)-$(XTENDED_BUILD_TYPE)-$(XTENDED_BUILD_DATE)
else
XTENDED_VERSION := Xtended-$(XTENDED_MAJOR_VERSION)-$(XTENDED_RELEASE_VERSION)-GAPPS-$(XTENDED_BUILD)-$(XTENDED_BUILD_TYPE)-$(XTENDED_BUILD_DATE)
endif

XTENDED_MOD_VERSION := $(XTENDED_MAJOR_VERSION)-$(XTENDED_RELEASE_VERSION)

XTENDED_DISPLAY_VERSION := $(XTENDED_MAJOR_VERSION)

XTENDED_FINGERPRINT := Xtended/$(XTENDED_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(XTENDED_BUILD_DATE)
