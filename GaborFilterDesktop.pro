QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

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

include(../RibiClasses/CppQtAboutDialog/CppQtAboutDialog.pri)
include(../RibiClasses/CppQtGaborFilterWidget/CppQtGaborFilterWidget.pri)
include(../RibiClasses/CppQtHideAndShowDialog/CppQtHideAndShowDialog.pri)
include(../SurfacePlotter/QtSurfacePlotWidget.pri)
include(../RibiLibraries/Apfloat.pri)

include(../RibiClasses/CppWidget/CppWidget.pri)
include(GaborFilterDesktop.pri)

SOURCES += qtmain.cpp


# Debug and release mode
CONFIG += debug_and_release
CONFIG(release, debug|release) {
  DEFINES += NDEBUG
}

# C++14
CONFIG += c++14
QMAKE_CXX = g++-5
QMAKE_LINK = g++-5
QMAKE_CC = gcc-5
# Qt does not go well with -Weffc++
QMAKE_CXXFLAGS += -Wall -Wextra -Werror -std=c++14

# Thanks to Qt
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov

