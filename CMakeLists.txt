project(PlasmaHelloworld)
set(PROJECT_VERSION "5.4.90")

cmake_minimum_required(VERSION 2.8.12)

find_package(ECM 1.6.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

find_package(Qt5 REQUIRED COMPONENTS QuickWidgets Test)
find_package(KF5 REQUIRED COMPONENTS Plasma I18n)

include(KDEInstallDirs)
include(KDECompilerSettings)
include(KDECMakeSettings)
include(ECMInstallIcons)
include(ECMMarkAsTest)
include(FeatureSummary)

add_subdirectory(helloworld1)
add_subdirectory(helloworld2)
add_subdirectory(po)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
