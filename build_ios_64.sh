cd ~/workspace/openssl-3.0.12

export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS.sdk
export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

./Configure ios64-cross no-shared no-dso no-hw no-engine --prefix="/Users/tattoo/workspace/openssl-3.0.12/openssl-ios64"

make
make install
make clean
