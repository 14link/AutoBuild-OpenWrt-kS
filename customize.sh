#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
		sed -i 's/192.168.1.1/192.168.0.252/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
	#	 sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings
		sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings
#3. Replace with JerryKuKu’s Argon
	#	 rm openwrt/package/lean/luci-theme-argon -rf
		sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt [$(TZ=UTC-8 date "+%Y.%m.%d")] Compiled by kSir '/g" openwrt/package/lean/default-settings/files/zzz-default-settings
		sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-kS'/g" openwrt/package/base-files/files/bin/config_generate
#
#