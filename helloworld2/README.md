## Reference
https://techbase.kde.org/Development/Tutorials/Plasma2/QML2/API
[plasma-desktop kickoff applet](https://projects.kde.org/projects/kde/workspace/plasma-desktop/repository/revisions/master/show/applets/kickoff)

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
Please read [QMLBook](http://qmlbook.github.io/) to be familiar with the basic QML usage.
And I am also learning [Plasma Framework](https://projects.kde.org/projects/frameworks/plasma-framework/repository/revisions/master/show/src)

## plasmawindowed
```
plasmawindowed org.kde.plasma.helloworld2
```
