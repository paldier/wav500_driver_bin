#
# Openwrt Makefile for hostapd
#
# Simplify mode 1.0
#
#

#### Includes ###################################
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

#### Package Info ###############################
PKG_NAME:=hostapd_wave
PKG_REV:=2462f347bca0a7cce7e06ff88adbe3aa47c52d54
PKG_VERSION:=2.6
PKG_RELEASE:=1
PKG_BASE_NAME:=hostapd
 
stam:
	@echo the BUILD_VARIANT is
	@echo $(BUILD_VARIANT)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_BASE_NAME)-$(PKG_VERSION)

BIN_FOLDER:=usr/sbin
PKG_BUILD_DEPENDS:=libopenssl libnl librt PACKAGE_hostapd_2_3_wave_5_1_1:hostapd_2_3_wave_5_1_1

PKG_CONFIG_DEPENDS:=\
	CONFIG_WIRELESS_STA

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IEEE 802.1x Authenticator
  URL:=http://hostap.epitest.fi/
  DEPENDS:=+libopenssl +librt +libnl
  MENU:=1
endef

define Package/$(PKG_NAME)/description
  IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
endef

define Package/$(PKG_NAME)/config
$(call Package/$(PKG_NAME)/override_version)
$(call Package/$(PKG_NAME)/override_source_path)
	config WIRELESS_STA
	  depends on PACKAGE_$(PKG_NAME)
	  bool 'Linux WPA/WPA2/IEEE 802.1X Supplicant support'
	  help
	      Linux WPA/WPA2/IEEE 802.1X Supplicant
endef

#### Directory Paths ############################
OPENSSL_DIR:=$(wildcard $(BUILD_DIR)/openssl-*)
LIBNL_DIR:=$(wildcard $(BUILD_DIR)/libnl-3*)
LIBRT_DIR:=$(wildcard $(BUILD_DIR)/toolchain/ipkg-lantiq/librt)

IFX_CFLAGS += -I$(OPENSSL_DIR)/include -I$(LIBNL_DIR)/include
IFX_LDFLAGS += -L$(OPENSSL_DIR)/ -L$(LIBNL_DIR)/lib/.libs -lnl-3 -L$(LIBRT_DIR)/lib -lrt


#### Target Rules ###############################
define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/$(BIN_FOLDER)
	$(INSTALL_BIN) ./files/hostapd $(1)/$(BIN_FOLDER)
	$(INSTALL_BIN) ./files/hostapd_cli $(1)/$(BIN_FOLDER)
	$(INSTALL_BIN) $./files/hostapd.eap_user $(1)/$(BIN_FOLDER)
	$(if $(CONFIG_WIRELESS_STA), \
		$(INSTALL_BIN) ./files/wpa_supplicant $(1)/$(BIN_FOLDER); \
		$(INSTALL_BIN) ./files/wpa_cli $(1)/$(BIN_FOLDER); \
		$(INSTALL_BIN) ./files/wpa_passphrase $(1)/$(BIN_FOLDER) \
	)
endef

define Build/Clean
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
