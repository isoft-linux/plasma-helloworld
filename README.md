# plasma-helloworld
plasma-framework helloworld applet example.

## Plasma4
During KDE4 dynasty, it is easy to inherit Plasma::PopupApplet class object to 
write your own plasma applet, and there are setPopupIcon, showPopup, hidePopup 
and setStatus to control applet icon, visibility and popup behavior.

## Plasma Framework
But in Plasma Next century, KF5 world, it is often directly use [QML] (http://doc.qt.io/qt-5/qtqml-index.html) 
to write ui, and import your own [QML Extension Plugin] (http://doc.qt.io/qt-5/qqmlextensionplugin.html) 
to control the ui or deal with data model.

## Build && Install
```
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr    \
    -DLIB_INSTALL_DIR=lib   \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
make
sudo make install
```

## Examples
* helloworld1 - pure QML plasma applet example
