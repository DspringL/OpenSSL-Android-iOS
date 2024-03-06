current_user=`whoami`
WORK_PATH=/Users/${current_user}/Downloads/openssl-3.0.12
cd ${WORK_PATH}

# 编译 x86_64 版本
./Configure darwin64-x86_64-cc --prefix="${WORK_PATH}/openssl-darwin-x86_64" no-asm

make
make install
make clean

# 编译 arm64 版本
./Configure darwin64-arm64-cc --prefix="${WORK_PATH}/openssl-darwin-arm64" no-asm

make
make install
make clean

# 合并静态库
mkdir -p ${WORK_PATH}/openssl-darwin/

lipo -create ${WORK_PATH}/openssl-darwin-x86_64/lib/libssl.a ${WORK_PATH}/openssl-darwin-arm64/lib/libssl.a -output ${WORK_PATH}/openssl-darwin/libssl.a

lipo -create ${WORK_PATH}/openssl-darwin-x86_64/lib/libcrypto.a ${WORK_PATH}/openssl-darwin-arm64/lib/libcrypto.a -output ${WORK_PATH}/openssl-darwin/libcrypto.a
