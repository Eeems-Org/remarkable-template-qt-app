[![rm1](https://img.shields.io/badge/rM1-supported-green)](https://remarkable.com/store/remarkable) [![rm2](https://img.shields.io/badge/rM2-supported-green)](https://remarkable.com/store/remarkable-2) [![Discord](https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/ATqQGfu)

reMarkable Template Qt Application
==================================

- [src/vendor/epaper/epframebuffer.h](src/vendor/epaper/epframebuffer.h) - Methods for direct access to the reMarkable screen.
- [src/vendor/epaper/libqsgepaper.a](src/vendor/epaper/libqsgepaper.a) - Static library that contains the epaper Qt platform. This is required for Qt to be able to interact with the screen on the reMarkable.
- [src/vendor/epaper.pri](src/vendor/epaper.pri) - Include file used by [src/src.pro](src/src.pro) to allow the application to access the epaper Qt platform.
- [src/controller.h](src/controller.h) - Basic controller object that provides an interop between QML and C++.
- [src/main.cpp](src/main.cpp) - Main application code.
- [src/main.qml](src/main.qml) - Main user interface.
- [src/myapp.oxide](src/myapp.oxide) - [Oxide application registration](https://oxide.eeems.codes/documentation/03_application_registration_format.html)
- [src/qml.qrc](src/qml.qrc) - Qt resource file to embed [src/main.qml](src/main.qml) in the built application.
- [src/src.pro](src/src.pro) - Project file. This defines the build and install process.

Building
========

This will result in a `dist` folder that you can copy to your device.

```bash
# Source the correct toolchain
source /opt/codex/rm11x/3.1.15/environment-setup-cortexa7hf-neon-remarkable-linux-gnueabi
mkdir .build
cd .build
qmake ..
make
INSTALL_ROOT="$(pwd)/../dist" make install
cd ..
```

Build toltec package
====================

https://remarkable.guide/devel/package.html

```bash
tar -czvf src.tar.gz src
toltecmk
```
