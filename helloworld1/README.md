## Reference
https://techbase.kde.org/Development/Tutorials/Plasma5/QML2/GettingStarted

## Architecture
```
├── CMakeLists.txt
├── package
│   ├── contents
│   │   └── ui
│   │       └── main.qml
│   └── metadata.desktop
└── README.md
```

## CMakeLists
It is very simple, just install the package with Plasma Framework plasma_install_package macro.

## package/metadata.desktop
Important keys: X-Plasma-MainScript, X-KDE-PluginInfo-Name, X-KDE-ServiceTypes 
and X-KDE-PluginInfo-Category, other keys just like traditional desktop file.

## package/contents/ui/main.qml
Please read [QMLBook] (http://qmlbook.github.io/) to be familiar with it.

## screenshot

![ScreenShot](https://raw.github.com/xiangzhai/plasma-helloworld/master/res/plasma-helloworld-screenshot1.png)

![ScreenShot](https://raw.github.com/xiangzhai/plasma-helloworld/master/res/plasma-helloworld-screenshot2.png)

![ScreenShot](https://raw.github.com/xiangzhai/plasma-helloworld/master/res/plasma-helloworld-screenshot3.png)
