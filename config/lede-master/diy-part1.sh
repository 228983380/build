#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
rm -rf package/lean/luci-theme-argon && echo "已删除 luci-theme-argon"
rm -rf package/lean/ddns-scripts_aliyun && echo "已删除 ddns-scripts_aliyun"
rm -rf package/lean/ddns-scripts_dnspod && echo "已删除 ddns-scripts_dnspod"
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/argon
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/sirpdboy/sirpdboy-package.git package/opentopd
git clone https://github.com/linkease/nas-packages.git package/nas
git clone https://github.com/linkease/nas-packages-luci.git package/nas_luci
# git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9
