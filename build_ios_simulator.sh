cd ~/Downloads/openssl-3.0.12

export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer
export CROSS_SDK=iPhoneSimulator.sdk
export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

./Configure iossimulator-xcrun no-shared no-dso no-hw no-engine --prefix="~/Downloads/openssl-3.0.12/openssl-iossimulator"

make
make install
make clean