#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
rm -rf package/lean/{luci-theme-argon,ddns-scripts_aliyun,ddns-scripts_dnspod}
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git luci-theme-argon
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
echo 'src-git opentopd  https://github.com/sirpdboy/sirpdboy-package' >> feeds.conf.default
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
#echo 'src-git kiddin9 https://github.com/kiddin9/openwrt-packages.git;master' >> feeds.conf.default
