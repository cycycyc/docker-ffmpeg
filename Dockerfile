FROM centos:latest
WORKDIR /root
RUN yum -y install centos-release-scl epel-release
RUN yum -y install gcc-c++ devtoolset-7 mingw32-gcc-c++ mingw64-gcc-c++
RUN yum -y install git wget ncurses-devel

# install yasm
RUN wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && tar -xf yasm-1.3.0.tar.gz
RUN cd yasm-1.3.0 && ./configure && make -j4 install

# install nasm
RUN wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz && tar -xf nasm-2.14.02.tar.xz
RUN cd nasm-2.14.02 && ./configure && make -j4 install

# install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2.tar.gz && tar -xf cmake-3.14.2.tar.gz
RUN cd cmake-3.14.2 && scl enable devtoolset-7 "./configure && make -j4 install"
