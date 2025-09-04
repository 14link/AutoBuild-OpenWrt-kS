#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.0.252/g' openwrt/package/base-files/luci2/bin/config_generate

#2. Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings
#
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt [$(TZ=UTC-8 date "+%Y.%m.%d")] Compiled by kSir '/g" openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='Lede'/g" openwrt/package/base-files/files/bin/config_generate
sed -i '/helloworld/s/^#//' feeds.conf.default

# sed -i 's/KERNEL_TESTING_PATCHVER:=.*/KERNEL_TESTING_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=6.6/KERNEL_TESTING_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=6.12/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile

#
#3. Replace with JerryKuKu’s Argon
	#	 rm openwrt/package/lean/luci-theme-argon -rf
#调整&&去重,删除不使用的源文件
# rm -rf openwrt/package/lean/autosamba
# rm -rf openwrt/feeds/luci/applications/luci-app-netdata
#4. git clone
        # git clone https://github.com/sirpdboy/autosamba package/autosamba
        # git clone https://github.com/sirpdboy/luci-app-netdata package/luci-app-netdata
        # git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge
        # sed -i 's/PATCHVER:=6.6/PATCHVER:=6.1/g' target/linux/x86/Makefile
