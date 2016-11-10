# Go ahead and use Qt.Core: it is about as platform-independent as
# the STL and Boost
QT += core

# Go ahead and use Qt.Gui: it is about as platform-independent as
# the STL and Boost. It is needed for QImage
QT += gui

# Don't define widgets: it would defy the purpose of this console
# application to work non-GUI
#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG   += console
CONFIG   -= app_bundle
TEMPLATE = app
SOURCES += main.cpp


include(../RibiClasses/CppAbout/CppAbout.pri)
include(../RibiClasses/CppContainer/CppContainer.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppGaborFilter/CppGaborFilter.pri)
include(../RibiClasses/CppGaborFilterWidget/CppGaborFilterWidget.pri)
include(../RibiClasses/CppGeometry/CppGeometry.pri)
include(../RibiClasses/CppHelp/CppHelp.pri)
include(../RibiClasses/CppMenuDialog/CppMenuDialog.pri)
include(../RibiClasses/CppPlane/CppPlane.pri)
include(../RibiClasses/CppRectangle/CppRectangle.pri)
include(../RibiClasses/CppRibiRegex/CppRibiRegex.pri)
include(../RibiClasses/CppWidget/CppWidget.pri)
include(../RibiLibraries/Apfloat.pri)
include(GaborFilterConsole.pri)

# Debug and release mode
CONFIG += debug_and_release
CONFIG(release, debug|release) {
  DEFINES += NDEBUG
}

# C++14
QMAKE_CXX = g++-5
QMAKE_LINK = g++-5
QMAKE_CC = gcc-5
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror -std=c++14

# Thanks to Qt
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov
