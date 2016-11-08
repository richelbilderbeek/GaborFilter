QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

include(../../Classes/CppAbout/CppAbout.pri)
include(../../Classes/CppGaborFilter/CppGaborFilter.pri)
include(../../Classes/CppGaborFilterWidget/CppGaborFilterWidget.pri)
include(../../Classes/CppHelp/CppHelp.pri)
include(../../Classes/CppMenuDialog/CppMenuDialog.pri)
include(../../Classes/CppRectangle/CppRectangle.pri)
include(../../Classes/CppRichelBilderbeekProgram/CppRichelBilderbeekProgram.pri)

include(../../Classes/CppQtAboutDialog/CppQtAboutDialog.pri)
include(../../Classes/CppQtGaborFilterWidget/CppQtGaborFilterWidget.pri)
include(../../Classes/CppQtHideAndShowDialog/CppQtHideAndShowDialog.pri)
include(../../Classes/CppQtSurfacePlotWidget/CppQtSurfacePlotWidget.pri)

include(../../Classes/CppTrace/CppTrace.pri)
include(../../Classes/CppWidget/CppWidget.pri)
include(../../Tools/ToolGaborFilter/ToolGaborFilterDesktop.pri)

SOURCES += qtmain.cpp


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
