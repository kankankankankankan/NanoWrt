cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
cp -r lean/* ./
rm -rf lean

# openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
sed -i 's/444/808080/g' luci-app-openclash/files/usr/lib/lua/luci/view/openclash/myip.htm

# darkmatter主题
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git
cd luci-theme-darkmatter
git checkout fd88e48ad0932dd1de47ff1f4274d5202c59f4f0

cd ../../
