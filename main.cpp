#include <QtGui/QGuiApplication>
#include "viewer/qtquick2applicationviewer.h"

#include <QtQml/QQmlListProperty>
#include <QtQml/QQmlEngine>
#include <QtQml/QtQml>
#include <QtQml/QQmlContext>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Kalk/main.qml"));
    viewer.showExpanded();

    return app.exec();
}


