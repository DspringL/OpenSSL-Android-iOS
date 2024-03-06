current_user=`whoami`
WORK_PATH=/Users/${current_user}/Downloads/openssl-3.0.12
cd ${WORK_PATH}

# 编译 x86_64 版本
./Configure linux-x86_64 --prefix="${WORK_PATH}/openssl-linux-x86_64" no-asm

make
make install
make clean

# 编译 arm64 版本
./Configure linux-aarch64 --prefix="${WORK_PATH}/openssl-linux-arm64" no-asm

make
make install
make clean

# 合并静态库
mkdir -p ${WORK_PATH}/openssl-linux/

lipo -create ${WORK_PATH}/openssl-linux-x86_64/lib/libssl.a ${WORK_PATH}/openssl-linux-arm64/lib/libssl.a -output ${WORK_PATH}/openssl-linux/libssl.a

lipo -create ${WORK_PATH}/openssl-linux-x86_64/lib/libcrypto.a ${WORK_PATH}/openssl-linux-arm64/lib/libcrypto.a -output ${WORK_PATH}/openssl-linux/libcrypto.a
