#-------------------------------------------------
#
# Project created by QtCreator 2017-03-16T15:04:04
#
#-------------------------------------------------
#C_OBS_ROOT=$$_PRO_FILE_PWD_/../vendor/obs
C_OBS_ROOT=$$PWD/obs-studio

message(C_OBS_ROOT$${C_OBS_ROOT})

include(./LJ_ADAPTER/ljobsadapter.pri)

C_RELEASE_DEBUG=debug
INCLUDEPATH +=$${C_OBS_ROOT}/libobs

PLATFORM_NAME=win
DEBUG_RELEASE_NAME=release
DEBUG_RELEASE_SUBFIX=
mac{
    PLATFORM_NAME=mac
    QT += macextras
}

CONFIG(debug, debug|release) {
    DEBUG_RELEASE_NAME=debug
    DEBUG_RELEASE_SUBFIX=d
}
#DEFINES *= LJ_OBS

OUTPUT_DIR=$$PWD/output

C_LIB_PATH=$${C_OBS_ROOT}/../$${PLATFORM_NAME}/lib/$${DEBUG_RELEASE_NAME}
#C_LIB_PATH=$${C_OBS_ROOT}/$${PLATFORM_NAME}/lib/$${DEBUG_RELEASE_NAME}

win32{
    C_DEPENDENCIES_PATH=$${C_OBS_ROOT}/win/dependencies2013
    LIBS += -luser32  -lkernel32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
    LIBS += -L$${C_LIB_PATH} -lobs -lobs-frontend-api  -llibff  -lfile-updater  -lobsglad  -lipc-util  -lw32-pthreads
    LIBS += -L$${C_DEPENDENCIES_PATH}/win32/bin -llibcurl -lavcodec -lavfilter -lavdevice -lavutil -lswscale -lavformat -lswresample -lfreetype

    CONFIG(release, debug|release) {
        LIBS += -ljansson
    }

    CONFIG(debug, debug|release) {
        LIBS += -ljansson
    }
    INCLUDEPATH +=$${C_DEPENDENCIES_PATH}/win32/include
#    INCLUDEPATH += $$PWD/../vendor/obs/win/dependencies2013/win32/include
}
mac{
    message(C_LIB_PATH$${C_LIB_PATH})
    C_DEPENDENCIES_PATH=$${C_OBS_ROOT}/deps
    QMAKE_LFLAGS += -F /System/Library/Frameworks/CoreFoundation.framework
    LIBS += -framework AppKit

    LIBS += -L$${C_LIB_PATH} -lobs-frontend-api -lobs -lobsglad -lfile-updater -ljansson -llibff -lmedia-playback
#    LIBS += -L$${C_LIB_PATH} -lobs-frontend-api -lobs -lobsglad -lfile-updater -ljansson
    LIBS += -lcurl -lobjc -lSystem -lc++
    LIBS += -L$${C_LIB_PATH} -lavcodec -lavfilter -lavdevice -lavutil -lswscale -lavformat -lswresample -lfreetype

    INCLUDEPATH += $${PWD}/mac/ffmpeg/include
}

INCLUDEPATH +=$${C_OBS_ROOT}/deps/json11
INCLUDEPATH +=$${C_OBS_ROOT}/deps/libff
INCLUDEPATH +=$${C_OBS_ROOT}/deps/libff/libff
INCLUDEPATH +=$${C_OBS_ROOT}/UI
INCLUDEPATH +=$${C_OBS_ROOT}/UI/obs-frontend-api

HEADERS += \
$${C_OBS_ROOT}/UI/adv-audio-control.hpp \
$${C_OBS_ROOT}/UI/audio-encoders.hpp \
$${C_OBS_ROOT}/UI/crash-report.hpp \
$${C_OBS_ROOT}/UI/display-helpers.hpp \
$${C_OBS_ROOT}/UI/double-slider.hpp \
$${C_OBS_ROOT}/UI/focus-list.hpp \
$${C_OBS_ROOT}/UI/hotkey-edit.hpp \
$${C_OBS_ROOT}/UI/item-widget-helpers.hpp \
$${C_OBS_ROOT}/UI/menu-button.hpp \
$${C_OBS_ROOT}/UI/mute-checkbox.hpp \
$${C_OBS_ROOT}/UI/obs-app.hpp \
$${C_OBS_ROOT}/UI/platform.hpp \
$${C_OBS_ROOT}/UI/properties-view.hpp \
$${C_OBS_ROOT}/UI/properties-view.moc.hpp \
$${C_OBS_ROOT}/UI/qt-display.hpp \
$${C_OBS_ROOT}/UI/qt-wrappers.hpp \
$${C_OBS_ROOT}/UI/remote-text.hpp \
$${C_OBS_ROOT}/UI/slider-absoluteset-style.hpp \
$${C_OBS_ROOT}/UI/source-label.hpp \
$${C_OBS_ROOT}/UI/source-list-widget.hpp \
$${C_OBS_ROOT}/UI/vertical-scroll-area.hpp \
$${C_OBS_ROOT}/UI/visibility-checkbox.hpp \
$${C_OBS_ROOT}/UI/visibility-item-widget.hpp \
$${C_OBS_ROOT}/UI/volume-control.hpp \
$${C_OBS_ROOT}/UI/window-basic-adv-audio.hpp \
$${C_OBS_ROOT}/UI/window-basic-filters.hpp \
$${C_OBS_ROOT}/UI/window-basic-interaction.hpp \
$${C_OBS_ROOT}/UI/window-basic-main.hpp \
$${C_OBS_ROOT}/UI/window-basic-main-outputs.hpp \
$${C_OBS_ROOT}/UI/window-basic-preview.hpp \
$${C_OBS_ROOT}/UI/window-basic-properties.hpp \
$${C_OBS_ROOT}/UI/window-basic-settings.hpp \
$${C_OBS_ROOT}/UI/window-basic-source-select.hpp \
$${C_OBS_ROOT}/UI/window-basic-status-bar.hpp \
$${C_OBS_ROOT}/UI/window-basic-transform.hpp \
$${C_OBS_ROOT}/UI/window-license-agreement.hpp \
$${C_OBS_ROOT}/UI/window-log-reply.hpp \
$${C_OBS_ROOT}/UI/window-main.hpp \
$${C_OBS_ROOT}/UI/window-namedialog.hpp \
$${C_OBS_ROOT}/UI/window-projector.hpp \
$${C_OBS_ROOT}/UI/window-remux.hpp \
    $${C_OBS_ROOT}/UI/window-basic-auto-config.hpp \
    $${C_OBS_ROOT}/UI/locked-checkbox.hpp \
    $${C_OBS_ROOT}/UI/window-basic-stats.hpp \
    $$PWD/obs-studio/UI/source-tree.hpp \
    $$PWD/obs-studio/UI/horizontal-scroll-area.hpp

SOURCES += \
$${C_OBS_ROOT}/UI/adv-audio-control.cpp \
$${C_OBS_ROOT}/UI/api-interface.cpp \
$${C_OBS_ROOT}/UI/audio-encoders.cpp \
$${C_OBS_ROOT}/UI/crash-report.cpp \
$${C_OBS_ROOT}/UI/double-slider.cpp \
$${C_OBS_ROOT}/UI/focus-list.cpp \
$${C_OBS_ROOT}/UI/hotkey-edit.cpp \
$${C_OBS_ROOT}/UI/item-widget-helpers.cpp \
$${C_OBS_ROOT}/UI/menu-button.cpp \
$${C_OBS_ROOT}/UI/obs-app.cpp \
#$${C_OBS_ROOT}/UI/platform-x11.cpp \
$${C_OBS_ROOT}/UI/properties-view.cpp \
$${C_OBS_ROOT}/UI/qt-display.cpp \
$${C_OBS_ROOT}/UI/qt-wrappers.cpp \
$${C_OBS_ROOT}/UI/remote-text.cpp \
$${C_OBS_ROOT}/UI/slider-absoluteset-style.cpp \
$${C_OBS_ROOT}/UI/source-label.cpp \
$${C_OBS_ROOT}/UI/source-list-widget.cpp \
$${C_OBS_ROOT}/UI/vertical-scroll-area.cpp \
$${C_OBS_ROOT}/UI/visibility-checkbox.cpp \
$${C_OBS_ROOT}/UI/visibility-item-widget.cpp \
$${C_OBS_ROOT}/UI/volume-control.cpp \
$${C_OBS_ROOT}/UI/window-basic-adv-audio.cpp \
$${C_OBS_ROOT}/UI/window-basic-filters.cpp \
$${C_OBS_ROOT}/UI/window-basic-interaction.cpp \
$${C_OBS_ROOT}/UI/window-basic-main.cpp \
$${C_OBS_ROOT}/UI/window-basic-main-dropfiles.cpp \
$${C_OBS_ROOT}/UI/window-basic-main-outputs.cpp \
$${C_OBS_ROOT}/UI/window-basic-main-profiles.cpp \
$${C_OBS_ROOT}/UI/window-basic-main-scene-collections.cpp \
$${C_OBS_ROOT}/UI/window-basic-main-transitions.cpp \
$${C_OBS_ROOT}/UI/window-basic-preview.cpp \
$${C_OBS_ROOT}/UI/window-basic-properties.cpp \
$${C_OBS_ROOT}/UI/window-basic-settings.cpp \
$${C_OBS_ROOT}/UI/window-basic-source-select.cpp \
$${C_OBS_ROOT}/UI/window-basic-status-bar.cpp \
$${C_OBS_ROOT}/UI/window-basic-transform.cpp \
$${C_OBS_ROOT}/UI/window-license-agreement.cpp \
$${C_OBS_ROOT}/UI/window-log-reply.cpp \
$${C_OBS_ROOT}/UI/window-namedialog.cpp \
$${C_OBS_ROOT}/UI/window-projector.cpp \
$${C_OBS_ROOT}/UI/window-remux.cpp \
    $${C_OBS_ROOT}/UI/window-basic-auto-config.cpp \
    $${C_OBS_ROOT}/UI/locked-checkbox.cpp \
    $${C_OBS_ROOT}/UI/window-basic-auto-config-test.cpp \
    $${C_OBS_ROOT}/UI/window-basic-stats.cpp \
    $$PWD/obs-studio/UI/source-tree.cpp \
    $$PWD/obs-studio/UI/horizontal-scroll-area.cpp

win32{
    SOURCES += $${C_OBS_ROOT}/UI/platform-windows.cpp
}
mac{
    OBJECTIVE_SOURCES += $${C_OBS_ROOT}/UI/platform-osx.mm
}

RESOURCES += \
$${C_OBS_ROOT}/UI/forms/obs.qrc

FORMS += \
$${C_OBS_ROOT}/UI/forms/NameDialog.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasic.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasicFilters.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasicInteraction.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasicSettings.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasicSourceSelect.ui \
$${C_OBS_ROOT}/UI/forms/OBSBasicTransform.ui \
$${C_OBS_ROOT}/UI/forms/OBSLicenseAgreement.ui \
$${C_OBS_ROOT}/UI/forms/OBSLogReply.ui \
$${C_OBS_ROOT}/UI/forms/OBSRemux.ui \
    $${C_OBS_ROOT}/UI/forms/AutoConfigFinishPage.ui \
    $${C_OBS_ROOT}/UI/forms/AutoConfigStartPage.ui \
    $${C_OBS_ROOT}/UI/forms/AutoConfigStreamPage.ui \
    $${C_OBS_ROOT}/UI/forms/AutoConfigTestPage.ui \
    $${C_OBS_ROOT}/UI/forms/AutoConfigVideoPage.ui \
    $$PWD/obs-studio/UI/forms/ColorSelect.ui
