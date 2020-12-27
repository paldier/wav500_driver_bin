#
# Openwrt Makefile for iw
#
# Simplify mode 1.0
#
#

#### Includes ###################################
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

#### Package Info ###############################
PKG_NAME:=iw_wave
PKG_REV:=Af17b634be52c5adf726b0f082f7d69e2b050702
PKG_VERSION:=4.14
PKG_RELEASE:=$(PKG_REV)

PKG_BASE_NAME:=$(PKG_NAME)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_BASE_NAME)-$(PKG_VERSION)

SBIN_FOLDER:=usr/sbin

PKG_BUILD_DEPENDS:=libnl PACKAGE_iw:iw PACKAGE_ltq-wlan-wave_5_x:ltq-wlan-wave_5_x

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=iw for Wave
  DEPENDS:=+libnl
  MENU:=1
endef

define Package/$(PKG_NAME)/description
  iw for Wave
endef

#### Directory Paths ############################
LIBNL_DIR:=$(wildcard $(BUILD_DIR)/libnl-3*)

IFX_CFLAGS += -I$(LIBNL_DIR)/include
IFX_LDFLAGS += -L$(LIBNL_DIR)/lib/.libs -lnl-3


#### Target Rules ###############################
define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/$(SBIN_FOLDER)
	$(INSTALL_BIN) ./files/iw $(1)/$(SBIN_FOLDER)/
endef

define Build/Clean
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
