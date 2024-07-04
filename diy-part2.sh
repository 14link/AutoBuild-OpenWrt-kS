#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' include/image.mk
# sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' include/image.mk

# 1.Modify default IP
sed -i 's/192.168.1.1/192.168.0.252/g' package/base-files/files/bin/config_generate
# sed -i 's/192.168.1.1/192.168.0.252/g' ./package/lean/base-files/files/bin/config_generate
# 2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

# sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' include/image.mk
# sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt [$(TZ=UTC-8 date "+%Y.%m.%d")] Compiled by kSir '/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-kS'/g" ./package/base-files/files/bin/config_generate
#调整&&去重,删除不使用的源文件
rm -rf ./package/lean/autosamba
rm -rf ./feeds/luci/applications/luci-app-netdata
# rm -rf ./feeds/small/*bypass* ./feeds/small/*vssr*
# rm -rf package/lean/autosamba

git clone https://github.com/sirpdboy/autosamba package/autosamba
git clone https://github.com/sirpdboy/luci-app-netdata package/luci-app-netdata
git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge
# git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge

# sed -i '60s/ITdesk01/firkerword/' ./package/jd_openwrt_script/files/jd_openwrt_script
# rm -rf ./package/lean/dnsforwarder
# rm -rf ./package/lean/luci-theme-argon
# rm -rf ./package/lean/shadowsocksr-libev
# rm -rf ./feeds/packages/net/smartdns
# rm -rf ./feeds/passwall/xray-plugin
# rm -rf ./feeds/helloworld/luci-app-ssr-plus
# rm -rf ./package/lean/luci-app-qbittorrent
# rm -rf ./package/lean/v2ray
# rm -rf ./package/lean/v2ray-plugin
# svn co https://github.com/garypang13/openwrt-packages/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
# svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-passwall feeds/passwall/luci-app-passwall
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
# svn co https://github.com/project-openwrt/openwrt/trunk/package/lean/dnsforwarder package/lean/dnsforwarder
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.init -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# curl -fsSL  https://raw.githubusercontent.com/firkerword/luci-app-bypass/main/Makefile > ./package/luci-app-bypass/Makefile
