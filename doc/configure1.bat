set QT5_SRC=..\qt5-src-git
pushd %QT5_SRC%
SET _ROOT=%CD%
popd
@rem adapt path according your system; there should be perl, python available
@rem make sure clang-cl IS NOT IN THE PATH!!!
@rem qt configure script using it if found in PATH instead of toolchain specified in "platform" and QMAKESPEC
SET PATH=%WINDIR%\system32;%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;C:\Perl64\bin;C:\Anaconda3;C:\Qt5\Tools\mingw530_32\bin
SET QMAKESPEC=win32-g++
SET DXSDK_DIR=C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\

%QT5_SRC%\configure.bat -static -debug-and-release -platform win32-g++ -opensource -prefix C:\Qt5\5.7\mingw53_32-static-opengl-dyn2 ^
-confirm-license -qt-zlib -qt-pcre -qt-libpng -qt-libjpeg -qt-freetype -opengl dynamic -qt-sql-sqlite ^
-nomake examples -nomake tests -make tools -make libs -no-openssl^

rem DO NOT FORGET TO PATCH QMAKESPECS with
rem QMAKE_LFLAGS += -static -static-libgcc
rem QMAKE_CFLAGS_RELEASE -= -O2
rem QMAKE_CFLAGS_RELEASE += -Os -momit-leaf-frame-pointer
rem DEFINES += QT_STATIC_BUILD
:end


