# Change this to rename the built application
TARGET = myapp
VERSION = 1.0

QT += gui
QT += quick

CONFIG += ltcg
CONFIG += c++11
CONFIG += c++17
CONFIG += c++20
CONFIG += c++latest
CONFIG += qml_debug
CONFIG += qtquickcompiler

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x051510

SOURCES += \
        main.cpp

# This provides more context on crashes when built in debug mode
CONFIG(debug, debug|release){
    LIBS += -lunwind
    contains(DEFINES, SANITIZER){
        QMAKE_LFLAGS += -fno-omit-frame-pointer
        QMAKE_LFLAGS += -fsanitize-recover=address

        QMAKE_LFLAGS += -fsanitize=address
        QMAKE_LFLAGS += -fsanitize=leak
        # QMAKE_LFLAGS += -fsanitize=thread # Incompatible with address and leak
        QMAKE_LFLAGS += -fsanitize=undefined
        QMAKE_LFLAGS += -fsanitize=pointer-compare
        QMAKE_LFLAGS += -fsanitize=pointer-subtract
    }
}

# This makes sure that libraries installed by toltec can be loaded by the application
QMAKE_RPATHDIR += /lib /usr/lib /opt/lib /opt/usr/lib

# This allows you to use APP_VERSION in your code to output the application version
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

QMAKE_LFLAGS += -flto
QMAKE_CFLAGS += -fPIC
QMAKE_CXXFLAGS += -fPIC

# The application will be installed to /opt/bin on the device
target.path = /opt/bin
INSTALLS += target

# This installs the oxide application registration file
applications.files = $$_PRO_FILE_PWD_/myapp.oxide
applications.path = /opt/usr/share/applications/
INSTALLS += applications

# This installs the application icon
# icons.files += $$_PRO_FILE_PWD_/myapp.png
# icons.path = /opt/usr/share/icons/oxide/48x48/apps
# INSTALLS += icons

# this installs the application splashscreen
# splash.files += $$_PRO_FILE_PWD_/splash.png
# splash.path = /opt/usr/share/icons/oxide/702x702/splash
# INSTALLS += splash

HEADERS += \
    controller.h

RESOURCES += \
    qml.qrc

include(vendor/epaper.pri)
