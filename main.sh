# Clone Upstream
git clone https://github.com/linuxmint/mintupdate
cp -rvf ./debian ./mintsystem
cd ./mintupdate
patch -Np1 -i ../patches/pika-adapt.diff

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
