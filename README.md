# docker-ffmpeg

Use docker to build ffmpeg with libx265 and etc. on various platforms.

## Install Docker Desktop

Please first install Docker Desktop from https://www.docker.com/products/docker-desktop.

## Build with prebuilt docker image

You can directly use the prebuilt docker image for build environment from my DockerHub repo https://hub.docker.com/r/cycycyc/centos-build.

`docker run --rm -v ${PWD}:/mnt -w /mnt cycycyc/centos-build /bin/bash <script.sh>`

To build linux amd64 release binary:

`docker run --rm -v ${PWD}:/mnt -w /mnt cycycyc/centos-build /bin/bash build_centos.sh`

To build windows x64 release binary:

`docker run --rm -v ${PWD}:/mnt -w /mnt cycycyc/centos-build /bin/bash build_mingw64.sh`

If you are using Docker Desktop on **Windows**, you cannot use `${PWD}` to get the current directory for mounting, instead you should fill a full MinGW path of current directory like:

`docker run --rm -v /c/path/to/docker-ffmpeg:/mnt -w /mnt cycycyc/centos-build /bin/bash <script.sh>`

After a successful build, binary can be collected in ffmpeg/ffmpeg or ffmpeg/ffmpeg.exe (with other .dll files).

## Configure your own docker image

You can use `Dockerfile` in this repo to build the docker image cycycyc/centos-build or modify it to build your own one.

`docker build --rm -f "Dockerfile" -t your-image:latest .`
