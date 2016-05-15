# Cocos2d-x 3.11 发布说明 #

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [概况](#%E6%A6%82%E5%86%B5)
- [需求](#%E9%9C%80%E6%B1%82)
  - [环境需求](#%E7%8E%AF%E5%A2%83%E9%9C%80%E6%B1%82)
  - [编译需求](#%E7%BC%96%E8%AF%91%E9%9C%80%E6%B1%82)
  - [如何运行测试例](#%E5%A6%82%E4%BD%95%E8%BF%90%E8%A1%8C%E6%B5%8B%E8%AF%95%E4%BE%8B)
    - [Cocos Console](#cocos-console)
    - [Mac OSX & iOS](#mac-osx-&-ios)
    - [Android](#android)
    - [Windows](#windows)
    - [Linux](#linux)
  - [如何开始一个新游戏](#%E5%A6%82%E4%BD%95%E5%BC%80%E5%A7%8B%E4%B8%80%E4%B8%AA%E6%96%B0%E6%B8%B8%E6%88%8F)
- [v3.11](#v311)
  - [新特性](#%E6%96%B0%E7%89%B9%E6%80%A7)
  - [主要特性的详细介绍](#%E4%B8%BB%E8%A6%81%E7%89%B9%E6%80%A7%E7%9A%84%E8%AF%A6%E7%BB%86%E4%BB%8B%E7%BB%8D)
    - [JSB的新内存模型](#jsb%E7%9A%84%E6%96%B0%E5%86%85%E5%AD%98%E6%A8%A1%E5%9E%8B)
    - [OpenSSL](#openssl)
- [](#)
    - [Cocos2d-x JSB程序调试](#cocos2d-x-jsb%E7%A8%8B%E5%BA%8F%E8%B0%83%E8%AF%95)
    - [全面升级 WebGL 渲染器](#%E5%85%A8%E9%9D%A2%E5%8D%87%E7%BA%A7-webgl-%E6%B8%B2%E6%9F%93%E5%99%A8)
  - [其他改动](#%E5%85%B6%E4%BB%96%E6%94%B9%E5%8A%A8)

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
* Windows 10 UWP
* Linux Ubuntu 14.04 及以上
* 现代浏览器和 IE 9+ （移动平台只有 iOS 和 Andorid 5.0 支持 WebGL）

## 编译需求

* Xcode 5.1 及以上 (for iOS or Mac)
* gcc 4.9 及以上 (for Linux)
* ndk-r10c (for Android)
* Visual Studio 2013 及以上 (for Windows (win32))
* Visual Studio 2013 update4 及以（for Windows 8.1 universal Apps）
* Visual Studio 2015 及以上和 Windows 10.0 (build 10074 及以上)（ for Windows 10.0 UWP Apps）

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

# v3.11

## 新特性

* Chipmunk升级到v7.0.1
* JSB使用新的内存模型，在JS脚本不需要关心对象的生命周期，该特性默认关闭
* CURL升级到v7.48
* OpenSSL升级到v1.0.2g
* 可以使用VSCode或者新版本的Firefox调试JSB程序
* 全面升级 WebGL 渲染器

## 主要特性的详细介绍

### JSB的新内存模型

使用新的内存模型后，开发者不需要关心对象的声明周期。这就意味着不需要在JS代码里手动调用`retain/release`函数。

不过该内存模型默认是关闭的。虽然我们已经做了很多的测试，目前没有发现任何问题，但是保险起见，你需要手动开启该功能，开启的方法是在`base/ccConfig.h`里把`CC_ENABLE_GC_FOR_NATIVE`的值改为1：

```c++
#ifdef CC_ENABLE_SCRIPT_BINDING
  #ifndef CC_ENABLE_GC_FOR_NATIVE_OBJECTS
  #define CC_ENABLE_GC_FOR_NATIVE_OBJECTS 1 // change to 1
  #endif
#endif
```

### OpenSSL
Cocos2d-x已经把__OpenSSL__升级到__1.0.2.g__。

从__2016年7月11__日开始，Google Play将不再接受使用低版本的__OpenSSL__的新应用程序或者应用程序更新。更新程序中使用的__OpenSSL__版本变得十分重要。更详细的信息可以参考[这个帖子](http://discuss.cocos2d-x.org/t/openssl-problem-again/28270)。

如果你使用的是v2.x或者低版本的v3.x引擎，那么你可以只更新__CURL__和__OpenSSL__，具体步骤如下：

* 修改__Cocos2d-x root/external/config.json__文件中的`version`字段。如果是v3.x的话，那么`version`字段的值改为`v3-dpes-92`，如果是v2.x的话，那么值是`v2-deps-5`
* 在Cocos2d-x根目录下执行__download-deps.py__脚本

```sh
(jtsm @ 15 ~) $ cd cocos2d-x

(jtsm @ 15 ~/cocos2d-x) $ ./download-deps.py

=======================================================
==> Prepare to download external libraries!
==> Ready to download 'v3-deps-92.zip' from 'https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin/archive/v3-deps-92.zip'
==> WARNING: Couldnt grab the file size from remote, use 'zip_file_size' section in '/Users/jtsm/Chukong-Inc/cocos2d-x/external/config.json'
==> Start to download, please wait ...
==> Downloading finished!
==> Extracting files, please wait ...
==> Extraction done! ==> Copying files...
==> Cleaning...
```
有任何问题可以在引擎的[中文论坛](http://forum.cocos.com/)上发帖反馈。

### Cocos2d-x JSB程序调试

v3.11版本之前，不能使用Firefox 30+版本来调试cocos2d-x JSB程序。这个版本修复了该问题，同时支持了web console功能。如果你不了解如何使用Firefox调试cocos2d-x JSB程序，可以参考[这篇文档](http://www.cocos2d-x.org/wiki/Javascript_Remote_Debugging)。

当然你也可以使用[VSCode](https://code.visualstudio.com/)来调试，具体的使用方法参考[这篇文档](http://discuss.cocos2d-x.org/t/use-vscode-to-debug-cocos2d-x-jsb-programs/27588)。

### 全面升级 WebGL 渲染器

在v3.11中，为了提升性能，我们重构了WebGL渲染器，下面是几项重要的改进：

1. 在 Android 浏览器上默认开启 WebGL（支持的话）
2. WebGL 模式下自动批处理 Sprite
3. Sprite 共享全局的渲染数据缓存，并减少 GL 函数调用

在这些优化后，与旧版本相比，合并贴图后的游戏中draw call数量将得到显著的降低。不仅如此，v3.11中的CPU使用率和内存使用也都得到了降低。在我们的bunnymark测试中，v3.11相比之前的版本有4倍以上的渲染性能提升。当然，这是我们对WebGL渲染器做的第一步升级，在后续版本中，WebGL渲染器还将得到持续优化。

## 其他改动
更完整的改动列表可以阅读[完整修改日志](https://github.com/cocos2d/cocos2d-x/blob/v3/CHANGELOG)。