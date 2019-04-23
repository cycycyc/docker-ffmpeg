FROM centos:latest
WORKDIR /root

# install toolchains
RUN yum -y install centos-release-scl epel-release \
    && yum -y install gcc-c++ devtoolset-7 mingw32-gcc-c++ mingw64-gcc-c++ \
    && yum -y install git wget ncurses-devel

# install yasm, nasm, cmake
RUN wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz \
    && tar -xf yasm-1.3.0.tar.gz \
    && pushd yasm-1.3.0 && ./configure && make -j4 install \
    && popd && rm -rf yasm-1.3.0.tar.gz yasm-1.3.0 \
    && wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz \
    && tar -xf nasm-2.14.02.tar.xz \
    && pushd nasm-2.14.02 && ./configure && make -j4 install \
    && popd && rm -rf nasm-2.14.02.tar.xz nasm-2.14.02 \
    && wget https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2.tar.gz \
    && tar -xf cmake-3.14.2.tar.gz \
    && pushd cmake-3.14.2 && scl enable devtoolset-7 "./configure && make -j4 install" \
    && popd && rm -rf cmake-3.14.2.tar.gz cmake-3.14.2 \