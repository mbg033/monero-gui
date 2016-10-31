## Building static Qt libraries (mingw, x86)
#

### Working recipe

1. Obtain all build requirements
    * Get online installer from [qt.io](http://www.qt.io) - install "mingw" Qt (we only need mingw c++ compiler here)
    * Install [DirectX SDK](https://www.microsoft.com/en-us/download/details.aspx?id=6812) (TODO: use Windows 10 SDK instead)
    * Install [git](https://git-scm.com/downloads)
    * Install Perl and Python
2. Prepare directory structure for Building:
    ```
    D:\qt5-build
    ├───build-static
    └───qt5-src-git
    ```
    where `build-static` is the build directory, and qt5-src-git is the source directory
3. Obtain source code (https://wiki.qt.io/Building-Qt-5-from-Git)
4. Place configure script into `build-static` directory:
   ```
   set QT5_SRC=..\qt5-src-git
    pushd %QT5_SRC%
    SET _ROOT=%CD%
    SET PREFIX=C:\Qt5\5.7\mingw53_32-static-opengl-dyn2
    popd
    @rem adapt path according your system; there should be perl, python available
    @rem make sure clang-cl IS NOT IN THE PATH!!!
    @rem qt configure script using it if found in PATH instead of toolchain specified in "platform" and QMAKESPEC
    SET PATH=%WINDIR%\system32;%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;C:\Perl64\bin;C:\Anaconda3;C:\Qt5\Tools\mingw530_32\bin
    SET QMAKESPEC=win32-g++
    SET DXSDK_DIR=C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\

    %QT5_SRC%\configure.bat -static -debug-and-release -platform win32-g++ -opensource -prefix %PREFIX% ^
    -confirm-license -qt-zlib -qt-pcre -qt-libpng -qt-libjpeg -qt-freetype -opengl dynamic -qt-sql-sqlite ^
    -nomake examples -nomake tests -make tools -make libs ^
    ```
    and run it:
    ```
    cd build-static
    configure1.bat
    ```

5. After configure done, make sure there's no errors and start build:
   ```
   mingw32-make -j<number-of-cpu-cores-available>




 




