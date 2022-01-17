# Base Image to build V8
[![CircleCI](https://circleci.com/gh/gengjiawen/v8-build.svg?style=svg)](https://circleci.com/gh/gengjiawen/v8-build)
[![Docker Pulls](https://img.shields.io/docker/pulls/gengjiawen/v8-build)](https://hub.docker.com/r/gengjiawen/v8-build)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/gengjiawen/v8-build/latest)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/gengjiawen/v8-build/android?label=android)


# Command
For V8 on desktop
```bash
docker run --rm -it --name play-v8 -v $PWD:/pwd gengjiawen/v8-build
```
For V8 on android
```bash
docker run --rm -it --name play-v8-andorid -v $PWD:/pwd gengjiawen/v8-build:android
```

# Refs
## V8 on android
* https://v8.dev/docs/cross-compile-arm
* https://github.com/Kudo/react-native-v8
* https://github.com/microsoft/v8-docker-buildscript

## V8 on desktop
* https://github.com/bnoordhuis/v8-cmake

## V8 github action
https://github.com/gengjiawen/v8-dev-public
