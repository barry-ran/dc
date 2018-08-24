#ifndef DCADAPTER_H
#define DCADAPTER_H

#include <QTimer>
#include <QDebug>
#include <QFile>
#include <memory>
#include <QPointer>

#include "obs-data.h"
#include "obs.hpp"
#include "obs.h"
#include "obs-frontend-api.h"
#ifdef DC_OBS
#define LJ_VIRTUAL virtual
#else
#define LJ_VIRTUAL
#endif

#ifdef QT_ADAPTER
#ifndef DL_OPENGL
#ifdef Q_OS_WIN
    #define DL_OPENGL "libobs-opengl.dll"
#else
    #define DL_OPENGL "libobs-opengl"
#endif
#endif

#ifndef DL_D3D11
#define DL_D3D11 "libobs-d3d11.dll"
#endif

#endif




class DCAdapter
{
public:
    DCAdapter();

#ifdef __APPLE__
    static bool LJGetDataFilePath(const char *data, std::string &output);
#endif
    static void updateCurrentPath();
};

#endif // DCADAPTER_H
