[![rm1](https://img.shields.io/badge/rM1-supported-green)](https://remarkable.com/store/remarkable) [![rm2](https://img.shields.io/badge/rM2-supported-green)](https://remarkable.com/store/remarkable-2) [![Discord](https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/ATqQGfu)
reMarkable Template Qt Application
==================================

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
This will create

Build toltec package
====================

https://remarkable.guide/devel/package.html

```bash
tar -czvf src.tar.gz src
toltecmk
```
