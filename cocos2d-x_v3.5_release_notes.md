# cocos2d-x v3.5 发布说明 #
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [概况](#misc-information)
- [需求](#requirements)
  - [环境需求](#)
  - [编译需求](#)
  - [如何运行 TestCpp](#)
    - [Mac OSX & iOS](#)
    - [Android](#)
    - [Windows](#)
    - [Linux](#)
  - [如何开始一个新游戏](#)
- [v3.5](#)
- [v3.5rc0](#)
  - [v3.5rc0亮点](#)
  - [细节](#)
    - [支持更多的particle](#)
- [v3.5beta0](#)
  - [v3.5beta0亮点](#)
  - [细节](#)
    - [3D粒子](#)
      - [支持PU特性](#)
      - [3D粒子使用示例](#)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 概况

* [完整更新日记](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.5/CHANGELOG)
* v3.0 发布说明: [v3.0 Release Notes](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0/docs/RELEASE_NOTES.md)

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8 及以上
* Linux Ubuntu 14.04 及以上

## 编译需求

* Xcode 5.1 及以上 (for iOS or Mac)
* gcc 4.9 及以上 (for Linux)
* ndk-r10c (for Android)
* Visual Studio 2012 及以上 (for Windows (win32))
* Visual Studio 2012 及以上 (for Windows Phone 8)

## 如何运行 TestCpp

### Mac OSX & iOS

* 进入 `cocos2d-x/build` 文件夹, 打开 `cocos2d_test.xcodeproj`
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

* 进入 `cocos2d-x/build` 目录, 然后打开 `cocos2d-win32.vs2012.sln` 文件
* 选择 `cpp-empty-test` 作为启动项
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

请参考: [ReadMe](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.5/README.md)

# v3.5
这个版本只有一些小的改动和bug修复。

* EditBox：支持Color4B字体颜色
* 修复AutoReleasePool的内存泄露
* 修复FileUtils:getWritablePath()在Windows和Mac上返回错误的路径。

# v3.5rc0
## v3.5rc0亮点
* 支持更多的Particle(PU)
* 禁用MoveTo的反动作
* CsLoader：增加CSB文件加载的回调
* 修复透明的Billboard和Sprite3D的渲染错误
* 修复MotionStreak无法正常运行MoveTo和MoveBy的错误
* 其他bug修复

##细节
###支持更多的particle（PU）
* Observer: On Count Observer, On Emission Observer, On Expire Observer, On Position observer, On Clear Observer, On Time Observer, On Quota Observer, On Velocity Observer, On Collision Observer, On Event Flag Observer, On Random Observer.
* 

* Event Handler: Do Enable Component Event Handler, Do Expire Event Handler, Do Placement Particle Event Handler, Do Stop System Event Handler, Do Affector Event Handler, Do Freeze Event Handler, Do Scale Event Handler.

* Behavior: Slave Behavior

观察者和事件处理者允许你来监听粒子系统和监听事件。当事件发生时，事件处理者可以做一些事情。比如，粒子系统有个观察者，它监听了粒子的数量，当数量超过100个的时候，它会触发一个停止粒子系统的事件。这允许你来创建更复杂的粒子。更多细节，请参考Particle Universe用户指南。

# v3.5beta0

## v3.5beta0亮点
## 细节

### 3D粒子

#### 支持PU特性

* 渲染器：Billboard Renderer, Box Renderer, Sphere Renderer, Entity Renderer, Ribbon Trail Renderer.

* 粒子发射器： Point Emitter, Box Emitter, Sphere Surface Emitter, Line Emitter, Circle Emitter, Position Emitter, Slave Emitter.

* 影响器: Gravity Affector, Linear Force Affector, Scale Affector, Sine Force Affector, Color Affector, Randomiser, Line Affector, Align Affector, Jet Affector, Vortex Affector, Geometry Rotator, Texture Rotator, Texture Animator, Particle Follower, Sphere Collider, Plane Collider, box Collider, Path Follower, Flock Centering Affector, Velocity Matching Affector.

#### 3D粒子使用示例

它允许从Particle Universe (http://www.fxpression.com)导入。3D粒子的使用示例如下，

第一种，使用particle文件（.pu）和材质文件创建3D粒子。

```c++
auto rootps = PUParticleSystem3D::create("lineStreak.pu", "pu_mediapack_01.material");
addChild(rootps);
rootps->startParticleSystem();
```

第二种，你也可只使用particle文件（.pu）来创建3D粒子，它将会从材质路径下加载所有的材质文件。
```c++
auto rootps = PUParticleSystem3D::create("advancedLodSystem.pu");
addChild(rootps);
rootps->startParticleSystem();
```

For more information, please refer to `cpp-tests/Particle3DTest`
更多详细信息请参考 `cpp-tests/Particle3DTest`
