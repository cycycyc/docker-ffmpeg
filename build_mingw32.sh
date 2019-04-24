#!/bin/bash

# build x265
pushd x265/build/linux
git clean -df
cp ../msys/toolchain-x86_64-w64-mingw32.cmake ../msys/toolchain-i686-w64-mingw32.cmake
sed -i 's/x86_64/i686/g' ../msys/toolchain-i686-w64-mingw32.cmake
cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=../msys/toolchain-i686-w64-mingw32.cmake -DENABLE_SHARED=OFF ../../source
make -j4 install
popd

# build ffmpeg
pushd ffmpeg
make distclean
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
./configure --cross-prefix=i686-w64-mingw32- --arch=x86 --target-os=mingw32 --enable-gpl --enable-libx265 --pkg-config-flags=--static --extra-ldflags=-pthread --pkg-config=pkg-config
make -j4 install
cp /usr/i686-w64-mingw32/sys-root/mingw/bin/*.dll .
popd
