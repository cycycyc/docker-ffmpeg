FROM centos:latest
WORKDIR /root

# install toolchains
RUN yum -y install centos-release-scl epel-release \
    && yum -y install make cmake3 devtoolset-7-gcc-c++ mingw32-gcc-c++ mingw64-gcc-c++ git wget \
    && yum clean all && rm -rf /var/cache/yum && ln -s /bin/cmake3 /bin/cmake

# install yasm, nasm, cmake
RUN wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz \
    && tar -xf yasm-1.3.0.tar.gz \
    && pushd yasm-1.3.0 && scl enable devtoolset-7 "./configure && make -j4 install" \
    && popd && rm -rf yasm-1.3.0.tar.gz yasm-1.3.0 \
    && wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz \
    && tar -xf nasm-2.14.02.tar.xz \
    && pushd nasm-2.14.02 && scl enable devtoolset-7 "./configure && make -j4 install" \
    && popd && rm -rf nasm-2.14.02.tar.xz nasm-2.14.02 \