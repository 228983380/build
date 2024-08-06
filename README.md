
# 云编译OpenWrt

在线云编译，是github推出的一项服务，它提供了高性能的虚拟服务器环境，基于它可以进行构建、测试、打包、部署项目。利用它可以省去本地搭建或者购买服务器的时间成本，你只需要使用本仓库的代码，按照下方的使用方法，修改一些参数，即可开始编译openwrt，等待几个小时后，你就可以下载固件了。

说明：源码来自各位大佬分享，为了方便编译，做了一些修改，可以支持不同分支的opewrt源码，同时集成了打包img镜像的功能。

- 官方源码：    https://github.com/openwrt/openwrt      

- lede源码：    https://github.com/coolsnowwolf/lede  

- lienol源码：  https://github.com/Lienol/openwrt 

- immortalwrt源码： https://github.com/immortalwrt/immortalwrt

- hanwckf大佬mt798x闭源仓库- [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x).

- 237大佬mt798x闭源仓库- [padavanonly/immortalwrt-mt798x](https://github.com/padavanonly/immortalwrt-mt798x).

- hanwckf大佬mt798x uboot仓库- [hanwckf/bl-mt798x](https://github.com/hanwckf/bl-mt798x).

### 刷砖也不怕！可以通过串口救砖：[MediaTek Filogic 系列路由器串口救砖教程](https://www.cnblogs.com/p123/p/18046679)


## 使用方法

1，注册账号

- 点击github.com 网站右上角的【Sign up】按钮，根据要求填写完成即可！

2，设置权限

- 右上角点击自己的头像，下拉菜单中选择【Settings/设置】 > 【Developer settings/开发者设置】 > 【Personal access tokens/个人访问令牌 > 【Tokens（classic）/令牌（经典）】 > 【 Generate new token/生成新令牌 】 ( Name: GITHUB_TOKEN, Select: public_repo )，其他选项根据自己需要可以多选，提交保存，复制系统生成的加密 KEY 的值，先保存到自己电脑的记事本，下一步会用到这个值。

- 打开仓库 https://github.com/itq5/build-openwrt ，点击右上的 Fork 按钮，复制一份仓库代码到自己的账户下，稍等几秒钟，提示 Fork 完成后，到自己的账户下访问自己仓库里的 build-openwrt 。在右上角的 Settings > Secrets > Actions > New repostiory secret ( Name: GH_TOKEN, Value: 填写刚才GITHUB_TOKEN的值 )，保存。并在左侧导航栏的 Actions > General > Workflow permissions 下选择 Read and write permissions 并保存。图示如下：



3，设置config
- 进入config文件夹，需要用哪个分支的源码，就打开哪个文件夹。
   
设置config文件，可以从本地设置好后，复制进去替换掉即可。


4，添加插件或主题

-  进入config文件夹，需要用哪个分支的源码，就打开哪个文件夹。打开diy-part2.sh文件，电视盒子必须安装amlogic插件，格式如下：

    #####Add a feed source
    
    echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic' >>feeds.conf.default
    
   
5，开始编译，
 
 - 点击菜单栏的【Actions】，左边菜单栏选择编译流程（说明：通用编译适合常用设备，如果你是电视盒子，那么请选择电视盒子编译）
 
 
 7，下载固件


---
## JDCloud-AX6000-Baili workflow 手动运行可选项：
- [x] Use the original MAC address order
- Choose mt_wifi firmware
- Choose warp firmware
- [ ] Use GSW switch driver (non-DSA)
- [ ] Use luci-app-mtk wifi config
- [ ] Not build luci-app-dockerman

- #### 1. Use the original MAC address order
该选项默认开启，即修改源码中的WAN、LAN地址顺序，恢复原厂MAC地址顺序并固定WiFi MAC，不需要请取消打钩。  
目前源码的WAN、LAN的MAC地址读取位置与原厂相反，所以WAN、LAN的MAC较原厂MAC是反的，同时目前源码的WiFi MAC最后一个字节重启后会变。  
开启该选项后可以恢复WAN、LAN原厂MAC顺序，同时将WiFi MAC写到无线对应dat文件中，以便固定WiFi MAC。  

- #### 2. Choose mt_wifi/warp firmware
默认mt_wifi和warp使用TP XDR6088的fw-20230808，个人使用感觉无线ping丢包较少。  
mt_wifi：  
no-new-fw：不使用新的无线firmware，使用mt798x-7.6.6.1-src驱动中的fw-20220906  
mt7986-fw-20221208：使用mt7986-7.6.7.0-20221209-b9c02f-obj提取的fw-20221208  
mt7986-fw-jdc：使用JDCOS-JDC04-4.2.0.r4080固件提取的fw-20230228  
mt7986-fw-20230421：使用mtk-openwrt-feeds(20230421)的fw-20230421  
mt7986-fw-20230808：使用TP XDR6088的fw-20230808  
mt7986-fw-20231024：使用mtk-openwrt-feeds(20231024)的fw-20231024  
warp：  
no-new-fw：不使用新的无线firmware，使用warp_20221209-3e6ae1-src驱动中的fw-20221208，这个fw和mt7986-7.6.7.0-20221209-b9c02f-obj提取的fw-20221208相同  
mt7986-fw-jdc：使用JDCOS-JDC04-4.2.0.r4080固件提取的fw-20230308  
mt7986-fw-20230421：使用mtk-openwrt-feeds(20230421)的fw-20230421  
mt7986-fw-20230808：使用TP XDR6088的fw-20230808  
mt7986-fw-20231024：使用mtk-openwrt-feeds(20231024)的fw-20231024  

.mtwifi-cfg.config配置文件中已设置使用新的无线firmware：  
CONFIG_MTK_MT7986_NEW_FW=y  
CONFIG_WARP_NEW_FW=y  

- #### 3. Use GSW switch driver (non-DSA)
该选项默认关闭，即按源码DTS中MT7531交换机的设置使用DSA交换机驱动，需要使用GSW交换机驱动请打钩。  
GSW：Gigabit Switch swconfig 模式，有交换机配置插件，不过京东云百里AX6000的WAN是单独接CPU的2.5G PHY RTL8221B，不接在MT7531交换机上，所以WAN不支持在交换机配置插件中设置VLAN。  
DSA：Distributed Switch Architecture 分布式交换架构模式，DSA去除了交换机配置插件，但在“网口”-“接口”-“设备”选项卡中的br-lan设备中的网桥VLAN过滤中可以查看网口状态设置VLAN。  
原厂固件和hanwckf大佬源码中京东云百里AX6000都是使用DSA的，建议使用DSA。  
两者具体区别可以参考OpenWrt社区资料：[converting-to-dsa](https://openwrt.org/docs/guide-user/network/dsa/converting-to-dsa) [dsa-mini-tutorial](https://openwrt.org/docs/guide-user/network/dsa/dsa-mini-tutorial)  

- #### 4. Use luci-app-mtk wifi config
该选项默认关闭，即按.mtwifi-cfg.config配置文件，使用mtwifi-cfg配置工具，需要使用旧的luci-app-mtk无线配置工具请打钩。  
mtwifi-cfg：为mtwifi设计的无线配置工具，兼容openwrt原生luci和netifd，可调整无线驱动的参数较少，配置界面美观友好，由于是新开发的工具，可能存在一些问题。  
luci-app-mtk：源自mtk-sdk提供的配置工具，需要配合wifi-profile脚本使用，可调整无线驱动的几乎所有参数，配置界面较为简陋。  
区别详见大佬的博客[mtwifi无线配置工具说明](https://cmi.hanwckf.top/p/immortalwrt-mt798x/#mtwifi%E6%97%A0%E7%BA%BF%E9%85%8D%E7%BD%AE%E5%B7%A5%E5%85%B7%E8%AF%B4%E6%98%8E)  
.mtwifi-cfg.config配置文件中已设置使用mtwifi-cfg配置工具：  
CONFIG_PACKAGE_luci-app-mtwifi-cfg=y  
CONFIG_PACKAGE_luci-i18n-mtwifi-cfg-zh-cn=y  
CONFIG_PACKAGE_mtwifi-cfg=y  
CONFIG_PACKAGE_lua-cjson=y  

- #### 5. Not build luci-app-dockerman
该选项默认关闭，即按.mtwifi-cfg.config配置文件编译dockerman，不需要编译dockerman请打钩。  
.mtwifi-cfg.config配置文件中已设置编译dockerman：  
CONFIG_PACKAGE_luci-app-dockerman=y  

---
### 感谢P3TERX的Actions-OpenWrt
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


 
 
 由于时间仓促，修改可能不到位，后续慢慢补充！

  
