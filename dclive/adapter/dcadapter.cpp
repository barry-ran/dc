#include "dcadapter.h"
#include <QDir>
#include <QApplication>
#include <QFont>
#include <QFileInfo>

DCAdapter::DCAdapter()
{

}

#ifdef __APPLE__
bool DCAdapter::LJGetDataFilePath(const char *data, std::__1::string &output)
{
    QString path = QCoreApplication::applicationDirPath();
    QDir dir(path);
    dir.cd("../");
    QString dataPath = QString(dir.absolutePath()+QString("/data/obs-studio/")+data);
    qDebug()<<QString("dataPath=%1").arg(dataPath);
    output = dataPath.toStdString();
    return QFileInfo::exists(dataPath);
}

void DCAdapter::updateCurrentPath()
{
    QDir::setCurrent(QCoreApplication::applicationDirPath());
}
#endif
