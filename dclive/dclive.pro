
QT       += core gui network multimedia multimediawidgets webenginewidgets webchannel
win32 {
    QT += axcontainer
}
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dclive
TEMPLATE = app


OUTPUT_DIR=$$PWD/../output
win32 {
    PLATFORM_NAME = win
}
mac {
    PLATFORM_NAME = mac
    QT += macextras
    ICON = $${TARGET}.icns
#    QMAKE_INFO_PLIST = $${TARGET}.plist
}
CONFIG(debug, debug|release){
    DESTDIR  = $$PWD/../debug/$$PLATFORM_NAME/32bit
    OBJECTS_DIR = $$OUTPUT_DIR/$$TARGET/debug/obj
    MOC_DIR = $$OUTPUT_DIR/$$TARGET/debug/moc
    UI_DIR = $$OUTPUT_DIR/$$TARGET/debug/ui
    RCC_DIR = $$OUTPUT_DIR/$$TARGET/debug/rcc
}
CONFIG(release, debug|release){
    DESTDIR  = $$PWD/../release/$$PLATFORM_NAME/32bit
    OBJECTS_DIR = $$OUTPUT_DIR/$$TARGET/release/obj
    MOC_DIR = $$OUTPUT_DIR/$$TARGET/release/moc
    UI_DIR = $$OUTPUT_DIR/$$TARGET/release/ui
    RCC_DIR = $$OUTPUT_DIR/$$TARGET/release/rcc
}

INCLUDEPATH += $$PWD/adapter
DEFINES *= DC_OBS
DEFINES *= QT_ADAPTER
include(../obs/obs.pri)

HEADERS += \
    adapter/dcadapter.h

SOURCES += \
    adapter/dcadapter.cpp
