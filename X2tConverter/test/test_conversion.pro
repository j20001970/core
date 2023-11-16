QT       -= core
QT       -= gui

TARGET = test
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

CONFIG += core_static_link_libstd

CORE_ROOT_DIR = $$PWD/../../../core
CORE_3DPARTY_DIR = $$CORE_ROOT_DIR/Common/3dParty
PWD_ROOT_DIR = $$PWD


include($$CORE_ROOT_DIR/Common/base.pri)
include($$CORE_3DPARTY_DIR/googletest/googletest.pri)
include($$CORE_3DPARTY_DIR/boost/boost.pri)
include($$CORE_ROOT_DIR/Common/3dParty/icu/icu.pri)

SUBDIRS = \
    XlsbFormatLib \
    PPTXFormatLib 

XlsbFormatLib.file =	../../../OOXML/Projects/Linux/XlsbFormatLib/XlsbFormatLib.pro
PPTXFormatLib.file =	../../../OOXML/Projects/Linux/PPTXFormatLib/PPTXFormatLib.pro

DESTDIR = $$PWD/build

LIBS += -L$$CORE_BUILDS_LIBRARIES_PATH -lCryptoPPLib
LIBS += -L$$CORE_BOOST_LIBS

ADD_DEPENDENCY(kernel)
ADD_DEPENDENCY(kernel_network)
ADD_DEPENDENCY(graphics)

ADD_DEPENDENCY(DocxFormatLib)
ADD_DEPENDENCY(OdfFormatLib)
ADD_DEPENDENCY(PPTXFormatLib)
ADD_DEPENDENCY(BinDocument)
ADD_DEPENDENCY(DocxFormatLib)
ADD_DEPENDENCY(XlsbFormatLib)
ADD_DEPENDENCY(RtfFormatLib)
ADD_DEPENDENCY(CompoundFileLib)
ADD_DEPENDENCY(XlsbFormatLib)

ADD_DEPENDENCY(DocFormatLib XlsFormatLib PPTFormatLib VbaFormatLib)
ADD_DEPENDENCY(HtmlFile2)
ADD_DEPENDENCY(UnicodeConverter)



core_linux {
    LIBS += -Wl,-unresolved-symbols=ignore-in-shared-libs
    LIBS += -ldl
}

HEADERS += \
    xlsb2xlsx/common.h\
    

SOURCES += \
    xlsb2xlsx/common.cpp\
    xlsb2xlsx/conversion.cpp\
    conversionTests.cpp\
    $$CORE_ROOT_DIR/Common/OfficeFileFormatChecker2.cpp

SOURCES -= $$CORE_GTEST_PATH/src/gtest_main.cc
