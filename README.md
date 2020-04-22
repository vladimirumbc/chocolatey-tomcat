# Chocolatey Packages

This project was created from [chocolatey/chocolatey-packages-template](https://github.com/chocolatey/chocolatey-packages-template).

[![](https://ci.appveyor.com/api/projects/status/github/tomflynn83/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/FranklinYu/chocolatey-packages)
[Update status](https://gist.github.com/FranklinYu/7d4536b29dacffbc807aaa67914180c6)

This contains Chocolatey packages, both manually and automatically maintained. You can use AU (Automatic Updater), currently supported in the Chocolatey community, for automatic packaging.

## Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au).
* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* manual - where packages that are not automatic are kept.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

## Requirements

* Chocolatey (choco.exe)
* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).
