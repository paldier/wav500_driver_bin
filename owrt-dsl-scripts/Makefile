# 
# Copyright(C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-dsl-scripts
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)
PKG_MAINTAINER:=Intel
PKG_LICENSE:=Intel

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Intel
  SUBMENU:=UGW Service Scripts
  TITLE:=OWRT DSL Scripts
  URL:=http://www.intel.com
  MAINTAINER:=Intel Corporation
endef

define Package/${PKG_NAME}/description
 DSL Service script for OWRT
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/${PKG_NAME}/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/xdsl.sh $(1)/etc/init.d/xdsl.sh
	$(INSTALL_BIN) ./files/xdslrc.sh $(1)/etc/init.d/xdslrc.sh
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/xdsl.defaults $(1)/etc/uci-defaults/xdsl
endef

define Package/$(PKG_NAME)/postinst
	#!/bin/sh
	if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/xdsl enable
	fi
	exit 0
endef

define Package/$(PKG_NAME)/prerm
	#!/bin/sh
	if [ -z "$${IPKG_INSTROOT}" ]; then
		/etc/init.d/xdsl disable
		/etc/init.d/xdsl stop
	fi
	exit 0
endef

$(eval $(call BuildPackage,${PKG_NAME}))
