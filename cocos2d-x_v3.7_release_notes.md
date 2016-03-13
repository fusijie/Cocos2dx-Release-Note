# cocos2d-x v3.7 发布说明 #
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [概况](#%E6%A6%82%E5%86%B5)
- [需求](#%E9%9C%80%E6%B1%82)
  - [环境需求](#%E7%8E%AF%E5%A2%83%E9%9C%80%E6%B1%82)
  - [编译需求](#%E7%BC%96%E8%AF%91%E9%9C%80%E6%B1%82)
  - [How to run tests](#how-to-run-tests)
    - [Cocos Console](#cocos-console)
    - [Mac OSX & iOS](#mac-osx-&-ios)
    - [Android](#android)
    - [Windows](#windows)
    - [Linux](#linux)
  - [如何开始一个新游戏](#%E5%A6%82%E4%BD%95%E5%BC%80%E5%A7%8B%E4%B8%80%E4%B8%AA%E6%96%B0%E6%B8%B8%E6%88%8F)
- [v3.7](#v37)
  - [v3.7亮点](#v37%E4%BA%AE%E7%82%B9)
  - [下载](#%E4%B8%8B%E8%BD%BD)
  - [主要功能:](#%E4%B8%BB%E8%A6%81%E5%8A%9F%E8%83%BD)
    - [3D物理](#3d%E7%89%A9%E7%90%86)
    - [3D导航网格](#3d%E5%AF%BC%E8%88%AA%E7%BD%91%E6%A0%BC)
    - [材质系统](#%E6%9D%90%E8%B4%A8%E7%B3%BB%E7%BB%9F)
    - [统一的 Cocos2d-x](#%E7%BB%9F%E4%B8%80%E7%9A%84-cocos2d-x)
    - [增强的Polygon Sprite](#%E5%A2%9E%E5%BC%BA%E7%9A%84polygon-sprite)
    - [JS 的 WebView 和 VideoPlayer（支持原生和 HTML5）](#js-%E7%9A%84-webview-%E5%92%8C-videoplayer%EF%BC%88%E6%94%AF%E6%8C%81%E5%8E%9F%E7%94%9F%E5%92%8C-html5%EF%BC%89)
    - [支持点九图](#%E6%94%AF%E6%8C%81%E7%82%B9%E4%B9%9D%E5%9B%BE)
    - [支持Android Studio](#%E6%94%AF%E6%8C%81android-studio)
    - [支持三星Enhanced API](#%E6%94%AF%E6%8C%81%E4%B8%89%E6%98%9Fenhanced-api)
    - [Win32 平台资源名称大小写敏感](#win32-%E5%B9%B3%E5%8F%B0%E8%B5%84%E6%BA%90%E5%90%8D%E7%A7%B0%E5%A4%A7%E5%B0%8F%E5%86%99%E6%95%8F%E6%84%9F)
    - [SDKBOX](#sdkbox)
  - [下一步计划](#%E4%B8%8B%E4%B8%80%E6%AD%A5%E8%AE%A1%E5%88%92)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 概况

* [完整更新日记](https://github.com/cocos2d/cocos2d-x/blob/v3/CHANGELOG)

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8.1
* Linux Ubuntu 14.04 及以上
* 现代浏览器和 IE 9+ （移动平台只有 iOS 和 Andorid 5.0 支持 WebGL）

## 编译需求

* Xcode 5.1 及以上 (for iOS or Mac)
* gcc 4.9 及以上 (for Linux)
* ndk-r10c (for Android)
* Visual Studio 2013 及以上 (for Windows (win32))
* Visual Studio 2013 及以上 (for Windows Phone 8)

## 如何运行测试例

### Cocos Console

在大部分平台上，你可以使用 [Cocos Console](www.cocos2d-x.org/wiki/Cocos2d-console) 命令行工具来运行测试例。

在控制台里：
```
// 进入 cpp test 文件夹
cd tests/cpp-tests
// 或者进入 js test 文件夹
cd tests/js-tests
// 或者进入 lua test 文件夹
cd tests/lua-tests

// 编译或者运行测试例
cocos compile -p ios|mac|android|win32|win8_1|metro|web -m debug|release
cocos run -p ios|mac|android|win32|win8_1|metro|web -m debug|release
```

举个例子，如果你想要在 Android 平台上以发布模式运行 cpp test，你可以使用如下命令：

```
cocos run -p android -m release
```

### Mac OSX & iOS

* 进入 `cocos2d-x/build` 文件夹, 打开 `cocos2d_test.xcodeproj` 或者 `cocos2d_js_tests.xcodeproj` (JS 测试例，我们将会在v3.8合并这两个项目)
* 在 Xcode 的 scheme toolbar 选择 `iOS` 或者 `OS X` 平台
* 点击 `run` 按钮

### Android

你可以运行一下示例...

**使用命令行：**

    $ cd cocos2d-x
    $ ./setup.py
    $ cd build
    $ ./android-build.py cpp-empty-test -p 10
    $ adb install cocos2d-x/tests/cpp-empty-test/proj.android/bin/CppEmptyTest-debug.apk
    
然后点击安卓设备上的程序运行测试例，`-p` 指定了 Android API 等级，cocos2d-x 支持 level10 以上。

**使用 Eclipse:**

    $ cd cocos2d-x
    $ ./setup.py
    $ cd build
    $ ./android-build.py cpp-empty-test -p 10
    
然后

* 把 cocos2d-x Android 项目导入 Eclipse 中，导入的路径是 `cocos/platform/android`
* 把 `cpp-empty-test` Android 项目导入 Eclipse 中，导入的路径是 `tests/cpp-empty-test/proj.android`
* 编译 `cpp-empty-test` Android 项目，然后运行即可

### Windows

* 对 win32 项目, 进入 `cocos2d-x/build` 目录, 然后打开 `cocos2d-win32.sln` 或者 `cocos2d-js-win32.sln`
* 对 win8.1 项目， 进入 `cocos2d-x/build` 目录, 然后打开 `cocos2d-win8.1-universal.sln` 或者 `cocos2d-js-win8.1-universal.sln`
* 选择运行目标
* 点击运行按钮

### Linux

    $ cd cocos2d-x/build
    $ ./install-deps-linux.sh
    $ cd ../..

然后

    $ mkdir build
    $ cd build
    $ cmake ../cocos2d-x
    $ make -j4

运行

    $ cd bin/cpp-empty-test
    $ ./cpp-empty-test

## 如何开始一个新游戏

使用 Cocos Console 来创建一个新游戏：

```
cocos new -l cpp|js|lua MyGame
```

# v3.7

## v3.7亮点

1.Cocos2d-x未来将只会发布final版本，所有的alpha，beta，rc版本只会在社区发布，包括中英文论坛，开发者QQ群等。而final版本会跟随Cocos同步发布。

2.v3.7版本中，Cocos2d-JS已经被合并到Cocos2d-x中，从现在开始，开发者不必纠结应该使用哪一款产品。在Cocos2d-x中，你同样可以使用C++/Lua/JS，然后发布在Windows/WP8.1/Android/Mac/iOS/Linux平台，如果使用JS的话，还可以发布在HTML5平台。在这个过渡期间，我们仍然会发布Cocos2d-x v3.7和Cocos2d-JS这两款产品，但实际上它们是同一个包。在将来的版本中，只会有一个包。想要了解更多内容，可以在[这个帖子](http://discuss.cocos2d-x.org/t/discuss-the-next-step-of-cocos2d-x/21182/)里讨论。

* 3d: 增加 3D 物理支持（JS/Lua 完成）
* 3d: 增加导航网格支持（JS/Lua 完成）
* core: 增加材质系统支持（JS/Lua 完成）
* sprite: 支持使用 autopolygon 生成器的 polygon sprite（JS/Lua 完成）
* Scale9Sprite: 增加安卓点九图支持 (JS/Lua ready)
* platform: 增加 Windows 10.0 Universal App(UWP) 支持
* platform: 支持三星Enhanced API
* C++: 增加 Android Studio 支持
* JS: 合并了 JSB 和 web 引擎到 Cocos2d-x 中
* JS: 为 iOS/Android/Web 增加 `ccui.VideoPlayer` 和 `ccui.WebView`
* console: 支持使用 Cocos Console 编译运行 Android Studio 项目
* SDKBOX: 非常方便地集成第三方 SDK 到 Cocos2d-x

## 下载

[Cocos2d-x v3.7](http://www.cocos2d-x.org/filedown/cocos2d-x-3.7.zip) 包含 : C++, Lua & JS

## 主要功能:

### 3D物理

这是我们提供的一个用于支持3D物理游戏的物理引擎，它可以很好地配合当前3D模块，比如3D精灵，3D地形等等。我们使用[bullet](http://bulletphysics.org/wordpress/)库来作为3D物理的基础，同时将它封装成Cocos 3D物理接口。你可以参考Physics3DTest测试例来查看它的API和用法，我们稍后将会增加相应的文档到[programmers guide](http://cocos2d-x.org/programmersguide)。

![](http://cdn.cocimg.com/bbs/attachment/Fid_41/41_300874_348f31ee628da2b.png)

### 3D导航网格

3D导航网格系统提供了一套简单易用的接口可以方便在复杂的3D世界中寻路，你可以通过添加一个三角形列表添加网格，以及添加障碍物。然后你可以通过添加一个代理来执行寻路任务，根据路径移动你的3D精灵到某个指定的地方。你可以参考NavmeshTest测试例来查看它的API和用法，我们稍后将会增加相应的文档到[programmers guide](http://cocos2d-x.org/programmersguide)。


![](http://cdn.cocimg.com/bbs/attachment/Fid_41/41_300874_6589cbf376a639b.png)

### 材质系统

材质系统是一个定义了对象的所有可视化信息（将来可能会包含音效和物理信息）的高级系统。相比于直接贴一张简单的2D贴图，你还可以做很多类似多通道渲染的高级功能。更多信息请参考[文档](https://github.com/chukong/programmers-guide/blob/v3.7/chapters/14.md#shaders-and-materials)。

![](http://cdn.cocimg.com/bbs/attachment/Fid_41/41_300874_a94a91aeeaf401d.png)

### 统一的 Cocos2d-x

在将Cocos2d-JS合并到Cocos2d-x后，对于C++/Lua开发者来说可能没什么改变，但是对于JS开发者来说引擎的结构可能看起来相当奇怪。不必担心，升级是非常简单的，因为项目的结构和之前仍然是一样的。更多信息请参考[讨论贴](http://discuss.cocos2d-x.org/t/cocos2d-js-v3-6-1-hot-fix-for-remote-debugger/21524/2)。

### 增强的Polygon Sprite

在前一个版本中Polygon Sprite不是很好用，因此我们重构了Polygon Sprite的API。现在它成了2d精灵的一个内部特性，你可以使用AutoPolygon来给一个精灵生成polygon信息，然后直接用它来创建精灵，非常简单。

```
auto pinfo = AutoPolygon::generatePolygon("filename.png");
auto spp = Sprite::create(pinfo);
```

虽然它在生成polygon信息的时候需要花费点时间，但是你可以缓存下来并进行复用，我们计划将来直接在编辑器中生成polygon信息。

![](http://cdn.cocimg.com/bbs/attachment/Fid_41/41_300874_7b5ef9b52f054f3.png)

### JS 的 WebView 和 VideoPlayer（支持原生和 HTML5）

WebView和VideoPlayer已经移植到JS中，同时支持iOS，Android和Web浏览器。你可以在测试例中参考它们的使用方法：[WebViewTest](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/js-tests/src/GUITest/UIWebViewTest/UIWebViewTest.js)，[VideoPlayerTest](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/js-tests/src/GUITest/UIVideoPlayerTest/UIVideoPlayerTest.js)。

### 支持点九图

点九图是一个可伸展的位图图片，它可以被用作Scale9Sprite的纹理。现在Cocos2d-x支持直接使用一个点九图文件来创建Scale9Sprite节点。更多信息请参考[点九图图片格式](http://developer.android.com/guide/topics/graphics/2d-graphics.html#nine-patch)和[制作工具](http://developer.android.com/tools/help/draw9patch.html)。你也可以参考我们的测试例以了解使用方法：[C++](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/cpp-tests/Classes/UITest/CocoStudioGUITest/UIScale9SpriteTest.cpp#L857)，[Lua](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/lua-tests/src/CocoStudioTest/CocoStudioGUITest/CocoStudioGUITest.lua)，[JS](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/js-tests/src/GUITest/UIS9NinePatchTest/UIS9NinePatchTest.js)。

### 支持Android Studio

Cocos console现在支持使用Andriod Studio1.2编译和打包安卓程序，使用的时候带上`--android-studio`即可。

```
cocos run/compile -p android --android-studio
```

### 支持三星Enhanced API

对于Android 5.0+系统的三星产品，三星提供了一系列Enhanced API以优化Cocos2d-x游戏。它包含了一些很酷的特性，比如：性能加速API，省电模式API，动态FPS的API等等。目前这些API可以在[这个头文件](https://github.com/cocos2d/cocos2d-x/blob/v3/cocos/platform/android/CCEnhanceAPI-android.h)中找到，我们稍后将会提供一份更详细的文档。

### Win32 平台资源名称大小写敏感

在之前的版本中，win32 平台的资源名大小写是不敏感的，但是其他平台却是敏感的。这会导致一些问题，尤其是开发者在win32平台开发，然后在其他平台（比如安卓）发布。在 win32 上，没有匹配大小写，文件名可能也会被找到，但是在其他平台上就找不到了。所以我们决定让 win32 平台的资源名大小写敏感。请确认一下您的资源中文件名是正确的。

### SDKBOX

SDKBOX是由Cocos团队打造的新工具产品，它致力于让海外SDK接入更加轻松便捷，給广大瞄准海外市场的开发者新的机遇。使用SDKBOX，开发者可以用一条命令集成第三方服务到自己的工程中：

```
sdkbox import -b iap
```

目前已经支持的第三方服务SDK包括：

* [Tune](http://cocos2d-x.org/sdkbox/tune)
* [In App Purchase](http://cocos2d-x.org/sdkbox/iap)
* [AdColony](http://cocos2d-x.org/sdkbox/adcolony)
* [Vungle](http://cocos2d-x.org/sdkbox/vungle)
* [Chartboost](http://cocos2d-x.org/sdkbox/chartboost)
* [Kochava](http://cocos2d-x.org/sdkbox/kochava)
* [Google Analytics](http://cocos2d-x.org/sdkbox/googleanalytics)
* [Flurry Analytics](http://cocos2d-x.org/sdkbox/flurryanalytics)

## 下一步计划

正如你所看到的，v3.7中，我们采用了材质系统，集成了polygon sprite以提高我们的2d渲染，更重要的是，我们的3d功能变得越来越完整，3d物理，导航网格，以及之前的相机，3d精灵，3d粒子系统，3d光照，3d地形，天空盒。现在，你可以真正地使用Cocos来做一款3d游戏了。

在v3.8中，我们不会做一些新功能，而是会放慢速度，全力优化当前的2d和3d模块。

[v3.8 里程碑任务](https://github.com/cocos2d/cocos2d-x/milestones/v3.8)