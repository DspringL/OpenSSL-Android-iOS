cd ~/Downloads/openssl-3.0.12

# 编译 x86_64 版本
./Configure darwin64-x86_64-cc --prefix="~/Downloads/openssl-3.0.12/openssl-darwin-x86_64" no-asm

make
make install
make clean

# 编译 arm64 版本
./Configure darwin64-arm64-cc --prefix="~/Downloads/openssl-3.0.12/openssl-darwin-arm64" no-asm

make
make install
make clean

# 合并静态库
mkdir -p ~/Downloads/openssl-3.0.12/openssl-darwin/

lipo -create ~/Downloads/openssl-3.0.12/openssl-darwin-x86_64/lib/libssl.a ~/Downloads/openssl-3.0.12/openssl-darwin-arm64/lib/libssl.a -output ~/Downloads/openssl-3.0.12/openssl-darwin/libssl.a

lipo -create ~/Downloads/openssl-3.0.12/openssl-darwin-x86_64/lib/libcrypto.a ~/Downloads/openssl-3.0.12/openssl-darwin-arm64/lib/libcrypto.a -output ~/Downloads/openssl-3.0.12/openssl-darwin/libcrypto.a
