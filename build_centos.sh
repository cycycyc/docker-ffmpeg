#!/bin/bash

# build x265
pushd x265/build/linux
git clean -df
scl enable devtoolset-7 'cmake -G "Unix Makefiles" -DENABLE_SHARED=OFF ../../source'
scl enable devtoolset-7 'make -j4 install'
popd

# build ffmpeg
pushd ffmpeg
make distclean
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
scl enable devtoolset-7 './configure --disable-doc --enable-gpl --enable-libx265 --pkg-config-flags=--static --extra-ldflags=-pthread'
scl enable devtoolset-7 'make -j4 install'
popd
