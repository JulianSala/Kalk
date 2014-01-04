
qml_folder.source = qml/Kalk
qml_folder.target = qml
DEPLOYMENTFOLDERS = qml_folder

QML_IMPORT_PATH =

include(viewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

SOURCES += \
    main.cpp \

HEADERS += \
