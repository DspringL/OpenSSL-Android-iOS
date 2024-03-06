current_user=`whoami`
WORK_PATH=/Users/${current_user}/Downloads/openssl-3.0.12
cd ${WORK_PATH}

export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS.sdk
export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

./Configure ios-cross no-shared no-dso no-hw no-engine --prefix="${WORK_PATH}/openssl-iosarmv7"

make
make install
make clean
