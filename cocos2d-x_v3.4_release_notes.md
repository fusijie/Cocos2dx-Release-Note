# cocos2d-x v3.4 发布说明 #

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**目录**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [概况](#%E6%A6%82%E5%86%B5)
- [需求](#%E9%9C%80%E6%B1%82)
  - [环境需求](#%E7%8E%AF%E5%A2%83%E9%9C%80%E6%B1%82)
  - [编译需求](#%E7%BC%96%E8%AF%91%E9%9C%80%E6%B1%82)
  - [如何运行 TestCpp](#%E5%A6%82%E4%BD%95%E8%BF%90%E8%A1%8C-testcpp)
    - [Mac OSX & iOS](#mac-osx-&-ios)
    - [Android](#android)
    - [Windows](#windows)
    - [Linux](#linux)
  - [如何开始一个新游戏](#%E5%A6%82%E4%BD%95%E5%BC%80%E5%A7%8B%E4%B8%80%E4%B8%AA%E6%96%B0%E6%B8%B8%E6%88%8F)
- [v3.4](#v34)
  - [v3.4 bug修复](#v34-bug%E4%BF%AE%E5%A4%8D)
- [v3.4rc1](#v34rc1)
  - [v3.4rc1亮点](#v34rc1%E4%BA%AE%E7%82%B9)
  - [细节](#%E7%BB%86%E8%8A%82)
    - [3D渲染支持2D物体](#3d%E6%B8%B2%E6%9F%93%E6%94%AF%E6%8C%812d%E7%89%A9%E4%BD%93)
    - [通过CC_USE_CULLING宏控制是否进行剔除](#%E9%80%9A%E8%BF%87cc_use_culling%E5%AE%8F%E6%8E%A7%E5%88%B6%E6%98%AF%E5%90%A6%E8%BF%9B%E8%A1%8C%E5%89%94%E9%99%A4)
  - [v3.4rc1 bug修复](#v34rc1-bug%E4%BF%AE%E5%A4%8D)
- [v3.4rc0](#v34rc0)
  - [v3.4rc0 bug修复](#v34rc0-bug%E4%BF%AE%E5%A4%8D)
- [v3.4beta0](#v34beta0)
  - [v3.4beta0亮点](#v34beta0%E4%BA%AE%E7%82%B9)
  - [细节](#%E7%BB%86%E8%8A%82-1)
    - [异步创建Sprite3D](#%E5%BC%82%E6%AD%A5%E5%88%9B%E5%BB%BAsprite3d)
    - [视锥体裁剪](#%E8%A7%86%E9%94%A5%E4%BD%93%E8%A3%81%E5%89%AA)
    - [使用较少的资源来创建ui::CheckBox和ui::Slider](#%E4%BD%BF%E7%94%A8%E8%BE%83%E5%B0%91%E7%9A%84%E8%B5%84%E6%BA%90%E6%9D%A5%E5%88%9B%E5%BB%BAuicheckbox%E5%92%8Cuislider)
    - [自定义内存分配器](#%E8%87%AA%E5%AE%9A%E4%B9%89%E5%86%85%E5%AD%98%E5%88%86%E9%85%8D%E5%99%A8)
      - [Default Allocator](#default-allocator)
      - [General Allocator](#general-allocator)
      - [Fixed Block Allocator](#fixed-block-allocator)
      - [Pool Allocator](#pool-allocator)
    - [为对象实现自定义的分配器](#%E4%B8%BA%E5%AF%B9%E8%B1%A1%E5%AE%9E%E7%8E%B0%E8%87%AA%E5%AE%9A%E4%B9%89%E7%9A%84%E5%88%86%E9%85%8D%E5%99%A8)
    - [控制台（分配器指令，标签，数量等等）](#%E6%8E%A7%E5%88%B6%E5%8F%B0%EF%BC%88%E5%88%86%E9%85%8D%E5%99%A8%E6%8C%87%E4%BB%A4%EF%BC%8C%E6%A0%87%E7%AD%BE%EF%BC%8C%E6%95%B0%E9%87%8F%E7%AD%89%E7%AD%89%EF%BC%89)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 概况

* [完整更新日记](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.4/CHANGELOG)
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

请参考: [ReadMe](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.4/README.md)

# v3.4
##v3.4 bug修复
* C++: 在不支持NEON指令集的armeavbi-v7a架构设备上崩溃
* GLProgram: 在不超过8个属性支持的低端设备上崩溃
* New audio: 在安卓上播放太多次导致游戏卡死
* Node: 在旋转时锚点无效
* 其他bug修复

# v3.4rc1

##v3.4rc1亮点
* C++: 添加CC_USE_CULLING宏用于控制是否开启自动剔除功能
* 当找不到文件时，FileUtils::fullPathForFilename将返回一个空字符串
* VertexBuffer&IndexBuffer: 在create方法中允许设置使用（L_STATIC_DRAW 或 GL_DYNAMIC_DRAW）
* Renderer: 3D渲染支持2D物体

##细节
###3D渲染支持2D物体
这个特性允许将Sprite，Label，Particle作为Sprite3D或者Billboard的子节点在3D空间中进行渲染。你可以实现一些类似Blob阴影，3D粒子，以及战斗伤害文字的效果。
```c++
auto billboard = Billboard::create();
auto label = Label::create();
label->setString("+100");
billboard->addChild(label);
```
###通过CC_USE_CULLING宏控制是否进行剔除
在Cocos2d-x v3.x中，剔除是一项非常重要的功能，但是一些开发者可能不希望使用这样的功能，比如当所有的场景显示在一个屏幕内的时候。现在`CCConfig.h`中有一个`CC_USE_CULLING`的宏可以用来开启/关闭剔除功能。

##v3.4rc1 bug修复
* DrawNode: 修复opengl缓存初始化错误导致的随机崩溃
* DrawNode: drawPoints()不能设置点大小
* EventDispatcher: 在事件回调函数中添加/移除事件监听器和分发事件导致的崩溃
* GLProgramState: 在安卓设备启动时可能引起GL_INVALID_VALUE错误
* LUA: 在一些设备上0x80000000可能不会被lua_tonumber正确转换
* PhysicsBody: 在将PhysicsBody添加到PhysicsWorld的那一帧无法获得正确的位置
* UI: 修复当navigation controller为null时的崩溃

# v3.4rc0
##v3.4rc0 bug修复
* FileUtils::GetData()在windows平台不能获取数据
* FileUtils::GetData()在windows平台上当文件大小为0导致的内存泄漏
* windows平台上当GLProgram记录编译或者链接错误信息时崩溃
* 安卓平台上当应用回到前台时GLProgramState的uniforms和attributes过期导致的断言错误
* 安卓平台上当应用回到前台时VAO和VBO没有重置导致GL_INVALID_OPERATION错误
* 升级Luajit到v2.0.3，这个版本修复了windows上一些崩溃问题
* 升级libcurl到v7.39.0
* 其他bug修复

# v3.4beta0

## v3.4beta0亮点
## 细节

### 异步创建Sprite3D

允许在另一个线程加载Sprite3D，这样你就可以在主线程中处理更多的逻辑，当创建完成后它将会以一个自定义回调的方式通知你。

`modelPath` 是待加载文件路径, `AsyncLoadSprite3DTest::asyncLoad_Callback` 是用户的回调函数, `userParam` 是回调函数需要的参数.

```c++
Sprite3D::createAsync(modelPath, CC_CALLBACK_2(AsyncLoadSprite3DTest::asyncLoad_Callback, this), (void*)userParam);
```

在加载完Sprite3D后，这个回调函数会被调用，这个回调函数可以做一些类似下面的事

```c++
void AsyncLoadSprite3DTest::asyncLoad_Callback(Sprite3D* sprite, void* param)
{
    //sprite is the loaded sprite
    sprite->setPosition(point);
    addChild(sprite);
}
```

### 视锥体裁剪

视锥体裁剪意味着只有视锥体内的对象才会被发送至图形硬件参与渲染，更多信息，请访问[维基百科](http://en.wikipedia.org/wiki/Frustum)。同时，在3D世界中，也只有可见物体的顶点等渲染数据被保存在显存中，所以，它可以潜在地提高应用程序的性能。

视锥体裁剪是camera的一个属性，默认是开启的，你也可以使用如下代码来开启/关闭视锥体裁剪功能。

```c++
//第一个参数是控制是否进行视锥体裁剪，第二个参数是控制是否使用远近平面
camera->enableFrustumCulling(true, true);
```

需要注意的是你必须要能够确保所有的对象都在视锥体的内部才能关闭视锥体裁剪功能。

更多信息请参考 cpptests/CameraTest

### 使用较少的资源来创建ui::CheckBox和ui::Slider

现在我们可以使用较少的资源来创建ui::CheckBox和ui::Slider。

如果要创建一个ui::CheckBox，我们可以简单地传递normal状态和press状态的纹理。

```cpp
CheckBox* checkBox2 = CheckBox::create("cocosui/check_box_normal.png",
                                              "cocosui/check_box_active.png");
```

如果要创建一个ui::Slider，我们可以简单地传递slider bar的纹理和normal ball的纹理。

```cpp
Slider* sliderScale9 = Slider::create("cocosui/slidbar.png", "cocosui/sliderballnormal.png");
```

如果select状态的纹理不存在的话，当用户按下控件时，normal状态的纹理将会放大。

如果disable状态的纹理不存在的话，当控件处在disable状态时，我们会使用gray shader来将normal状态下的纹理变灰。

原有的ui::Button同样支持gray shader扩展。

### 自定义内存分配器

你可以用如下代码在cc.Config.h中控制自定义内存分配系统

```c++
#define CC_ENABLE_ALLOCATOR 1
#define CC_ENABLE_ALLOCATOR_DIAGNOSTICS CC_ENABLE_ALLOCATOR
#define CC_ENABLE_ALLOCATOR_GLOBAL_NEW_DELETE 0

#define CC_ALLOCATOR_GLOBAL cocos2d::allocator::AllocatorStrategyDefault
#define CC_ALLOCATOR_GLOBAL_NEW_DELETE cocos2d::allocator::AllocatorStrategyGlobalSmallBlock
```

__CC_ENABLE_ALLOCATOR__ 可以控制所有自定义分配器的开启和关闭。如果设置为0，所有东西仍然会被创建，但所有的自定义分配器的代码将被禁用或移除。这主要是通过宏来处理，但如果要实现新的分配器策略，你应该注意并尊重这种预处理指令。

__CC_ENABLE_ALLOCATOR_DIAGNOSTICS__ 和 __CC_ENABLE_ALLOCATOR__ 有相同的默认值，可以通过控制面板将它设置为0来禁用分配器诊断。诊断会有明显的开销，所以在产品发布之前请一定要禁用它们。

__CC_ENABLE_ALLOCATOR_GLOBAL_NEW_DELETE__ 开启全局的的 __new__ 和 __delete__ 操作符重写，通过设置 __CC_ALLOCATOR_GLOBAL_NEW_DELETE__ 的定义可以选择这个分配器策略。

__CC_ALLOCATOR_GLOBAL__ 定义了用于全局分配的分配器策略，其他分配器需要的所有内存将会使用这个全局分配器， __CC_MALLOC__ ， __CC_FREE__ 这些宏也是。

第三方库使用malloc/free仍然会使用原来的malloc/free，所以它们的内存使用不会被跟踪到。

从共享库中调用new/delete是可以正常工作的。确定提供的库被加载后，分配器已经初始化，除非你从一个静态变量的初始化加载共享库。

#### Default Allocator

Default Allocator封装了malloc和free，提供了一个分配器接口，任何人都可以使用它来分配一块内存。目前没有进行追踪，将来可能会被添加进去。

#### General Allocator

General allocator提供了一些列指定大小分配器，从4个字节到一个指定阈值，目前是8K字节。任何比这个阈值大的将会回退到默认分配器，详细见固定分配器。

#### Fixed Block Allocator

Fixed block allocators提供了固定尺寸的内存池。它们非常快因为不需要做搜索。它们可以从一个队列的开头中弹出一块内存然后返回。同样的，释放内存也很快，因为它们只是把内存块压入到队列的前面。实际上内存没有释放，它不停地在空闲队列中分配和跟踪。它将有可能通过从队列中释放存储器的未使用页，以减少所分配的存储器。

#### Pool Allocator

如果要为一个指定类型实现一个自定义固定块分配器，你只需重写类或者结构体类型本地的new/delete，使用 __CC_USE_ALLOCATOR_POOL(pool)__ 。此外，这些分配器都在初始化大小方面进行配置。

### 为对象实现自定义的分配器

很简单，给你的类添加一个池分配器的静态实例，然后使用宏 __CC_USE_ALLOCATOR_POOL__ 来实现__new__ 和 __delete__ 操作符。

```c++
    class SomeClass
    {
    public:

        cocos2d::allocator::AllocatorStrategyPool<SomeClass> _allocator;
        CC_USE_ALLOCATOR_POOL(SomeClass, _allocator);
    };
```

### 控制台（分配器指令，标签，数量等等）

你可以通过控制台连接运行中的程序。比如 __telnet localhost 5678__ 和 __allocator__ 命令可以输出所有的分配器诊断信息。其中一个很有用的信息就是池分配器的最高数量，你可以将这个值设置为预分配对象数量的大小，这样就可以显著提高启动速度。