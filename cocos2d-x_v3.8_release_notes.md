# cocos2d-x v3.8 发布说明 #
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
- [v3.8](#v38)
  - [v3.8亮点及 API 变更](#v38%E4%BA%AE%E7%82%B9%E5%8F%8A-api-%E5%8F%98%E6%9B%B4)
  - [下载](#%E4%B8%8B%E8%BD%BD)
  - [细节:](#%E7%BB%86%E8%8A%82)
    - [3D 模块](#3d-%E6%A8%A1%E5%9D%97)
    - [UI 系统](#ui-%E7%B3%BB%E7%BB%9F)
    - [声音引擎](#%E5%A3%B0%E9%9F%B3%E5%BC%95%E6%93%8E)
    - [FileUtils](#fileutils)
    - [其他](#%E5%85%B6%E4%BB%96)
  - [其他变更](#%E5%85%B6%E4%BB%96%E5%8F%98%E6%9B%B4)
  - [新的 APIs](#%E6%96%B0%E7%9A%84-apis)
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
* Visual Studio 2013 update4 及以上 (for Windows 8.1 universal Apps)
* Visual Studio 2015 RC 及以上和 Windows 10.0 (build 10074 或者更高) (for Windows 10.0 UWP Apps)

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
* 对 win 10 项目, 进入 `cocos2d-x/build` 目录, 然后打开 `cocos2d-win10.sln`
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

# v3.8

## v3.8亮点及 API 变更

如之前承诺的，Cocos2d-x v3.8 极大地提高了稳定性和 API 的友好性。一方面，我们持续地提升了3D功能，增加了 3D 物理碰撞，天空盒背景刷和 Animate3D 帧回调。另一方面，我们优化了多个内核模块，包括 UI 系统，声音引擎，文件模块，绑定生成器等等。

这里是一些优化的亮点和 API 变更：

1. 3D 模块
    - 添加 3D 物理碰撞器
    - 支持使用颜色/深度/天空盒设置照相机的背景刷
    - 添加 Animate3D 的帧回调事件
    - 支持地形的光照纹理
2. UI 系统
    - 重新实现并增强了 Android 上的 EditBox
    - 支持 ScrollView 滚动条（JSB/Lua 完成）
    - 添加 RadioButton 控件（JSB/Lua 完成）
    - 支持汉仪 fulltype 字体
3. 声音引擎
    - AudioEngine 支持声音预加载
    - 绑定 AudioEngine 到 JSB
4. FileUtils
    - 添加一系列文件写入接口：writeStringToFile, writeDataToFile, writeValueMapToFile, writeValueVectorToFile
5. 其他
    - 优化绑定生成工具
    - 合并 JSB 测试项目到 cocos2d 测试项目
    - 框架：支持生成 debug 模式下的引擎预编译库
    - console：支持从模板中创建竖屏项目

## 下载

[Cocos2d-x v3.8](http://www.cocos2d-x.org/filedown/cocos2d-x-3.8.zip) 包含 : C++, Lua & JS

## 细节:

### 3D 模块

1. 3D 物理碰撞器

    3D 物理碰撞器是一种新的物理对象。它同时为触发器和碰撞器所用。

    触发器是一块由物理形状定义的区域，当其他物理对象进入或者离开的时候会被回调。使用方法如下：
    
    ```cpp
    //create a collider using colliderDes
    Physics3DColliderDes colliderDes;
    colliderDes.shape = Physics3DShape::createSphere(10.0f);
    colliderDes.isTrigger = true;
    auto collider = Physics3DCollider::create(&colliderDes);
    auto component = Physics3DComponent::create(collider);
    auto node = Node::create();
    addChild(node);
    node->addComponent(component);

    collider->onTriggerEnter = [=](Physics3DObject *otherObject){
      //some body entering
    };
    collider->onTriggerExit = [=](Physics3DObject *otherObject){
      //some one leaving
    }; 
    ```

    碰撞器和刚体很像，它可以对和它碰撞的刚体产生力的作用。但是它是静态的，而且比起刚体有更好的性能。所以对于静态的场景或者物体可以使用碰撞器，动态的物体可以使用刚体。当你想要让它碰撞的时候可以把 colliderDes.isTrigger 设置成 false。

2. 照相机背景刷

    和之前的版本不同，在 v3.8 版本中，开发者可以选择四种类型的背景刷来擦掉照相机的背景：无，颜色，深度，天空盒。无代表什么都不用；颜色刷使用给定的颜色和深度擦除背景；深度刷使用给定深度擦除背景；天空盒使用给定 6 个面的纹理天空盒擦除背景。默认的背景刷是深度背景刷。使用方式如下：

    ```cpp
    // Using none brush
    _camera->setBackgroundBrush(CameraBackgroundBrush::createNoneBrush());
    // Using depth brush, clear depth with 1.0
    _camera->setBackgroundBrush(CameraBackgroundBrush::createDepthBrush(1.f));
    // Using color brush, clear color is (1,0,0,1), depth is 1
    _camera->setBackgroundBrush(CameraBackgroundBrush::createColorBrush(Color4F(1.f, 0.f, 0.f, 1.f), 1.f));
    // SkyBox brush
    _camera->setBackgroundBrush(CameraBackgroundBrush::createSkyboxBrush("Sprite3DTest/skybox/left.jpg", "Sprite3DTest/skybox/right.jpg","Sprite3DTest/skybox/top.jpg", "Sprite3DTest/skybox/bottom.jpg","Sprite3DTest/skybox/front.jpg", "Sprite3DTest/skybox/back.jpg"));
    ```

3. Animate3D 帧回调事件

    和 2d 帧动画回调类似，现在 Animate3D 也支持帧回调了。它允许开发者在某一帧设置回调事件，当播放到那一帧的时候事件被调用。使用如下：

    ```cpp
    auto animation = Animation3D::create(“XX.c3b”);
    auto animate = Animate3D::create(animation);
    ValueMap valuemap0;//you can add some user data here, it can be used in the frame event callback
    //add a callback when frame 275 is played
    animate->setKeyFrameUserInfo(275, valuemap0);
            
    auto listener = EventListenerCustom::create(Animate3DDisplayedNotification, [&](EventCustom* event)
    {
        auto info = (Animate3D::Animate3DDisplayedEventInfo*)event->getUserData();
        
        //frame 275 is played, you can add some code here
        cocos2d::log(“frame %d”, info->frame);
    });
    Director::getInstance()->getEventDispatcher()->addEventListenerWithFixedPriority(listener, -1);
    ```

4. 地形支持光照纹理

    v3.8 版本开始支持地形光照纹理。也就是说你可以从其他工具中导出烘焙光照纹理添加到地形上。光照纹理包含光照信息，地形可以有多个光照。使用方式如下：

    ```cpp
    //create a normal terrain as before
    Terrain::DetailMap r(“TerrainTest/dirt.jpg”),g(“TerrainTest/Grass2.jpg”),b(“TerrainTest/road.jpg”),a(“TerrainTest/GreenSkin.jpg”);
    Terrain::TerrainData data(“TerrainTest/heightmap16.jpg”,”TerrainTest/alphamap.png”,r,g,b,a);
    _terrain = Terrain::create(data,Terrain::CrackFixedType::SKIRT);
    _terrain->setLODDistance(3.2f,6.4f,9.6f);
    _terrain->setMaxDetailMapAmount(4);
    _terrain->setDrawWire(false);
    //set light map for the terrain
    _terrain->setLightMap(“TerrainTest/Lightmap.png”);
    ```

### UI 系统

1. EditBox 重新实现

    EditBox 的使用方式和之前一样，但是 Android 平台的 EditBox 已经被重新实现过。使用体验大大提高了。主要的优化如下：

    - 支持光标
    - 支持拷贝，剪切，黏贴，选择操作
    - 支持多行输入，可以通过设置输入模式 `ANY` 开启多行输入功能
    - 不再被键盘 UI 修饰

2. ScrollView 滚动条
    
    在之前的版本中，ScrollView 没有任何当前位置的可视标记。在 v3.8 版本中，我们给scrollView 添加了滚动条，你可以修改透明度，颜色，宽度和自动隐藏的时间。特别感谢 @neokim。

    使用:

    ```cpp
    ui::ScrollView* scrollView = ui::ScrollView::create();
    scrollView->setScrollBarWidth(4);
    scrollView->setScrollBarPositionFromCorner(Vec2(2, 2));
    scrollView->setScrollBarColor(Color3B::WHITE);
    this->addChild(scrollView);
    ```

3. RadioButton 控件

    RadioButton 是一种特殊类型的二态按钮，和 CheckBox 很像。

    另外，它可以和 RadioButtonGroup 共用，可以和其他 radio 按钮很方便地交互。

    在一个 RadioButtonGroup 中，同一时间只能有一个 RadioButton 处于选中状态，特别感谢 @ neokim 提供了这个新控件的实现。
    
    使用: 

    ```cpp
    //create a RadioButtonGroup
    auto radioButtonGroup = RadioButtonGroup::create();
    this->addChild(radioButtonGroup);

    //create a RadioButton
    RadioButton* radioButton1 = RadioButton::create("radio_button_off.png", "radio_button_on.png");
    radioButton1->setPosition(Vec2(100,100);
    this->addChild(radioButton1);

    //create another RadioButton
    RadioButton* radioButton2 = RadioButton::create("radio_button_off.png", "radio_button_on.png");
    radioButton2->setPosition(Vec2(100,100);
    this->addChild(radioButton2);

    //add the RadioButtons into RadioButtonGroup
    radioButtonGroup->addRadioButton(radioButton1);
    radioButtonGroup->addRadioButton(radioButton2);
    ```

### 声音引擎

1. 声音预加载
    
    AudioEngine 先支持播放之前的声音文件预加载。对于一些较大的声音文件，这个特性将会提高用户的游戏体验。使用方式：

    ```cpp
    //Use it with callback
    AudioEngine::preload("audio1.mp3",[](bool isSuccess){
        //...
    });
    //Use it without callback
    AudioEngine::preload("audio2.mp3");
    ```

2. 新声音引擎的 JSB 绑定

    在 JSB 中，默认的声音引擎是 SimpleAudioEngine（已改名为 cc.audioEngine）。这是一个从 v2 版本就开始提供的老声音引擎，在一些情况下使用不方便，比如延时，比如事件支持等等。所以我们觉得提供 JSB 上的 AudioEngine，API 仍然和 C++ API 一致，使用方法可以在这里找到：[测试例](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/js-tests/src/NativeTest/AudioEngineTest.js)。

### FileUtils

1. 新的文件写入 API

    在 v3.8 版本中，我们在 FileUtils 提供了一系列的文件写入 API。现在你可以使用很简答的 API 往用户文件系统的文件里写入字符串，二进制数据，键值表，数组。以下的每一个 API 的使用示例：

    ```cpp
    std::string writablePath = FileUtils::getInstance()->getWritablePath();

    // FileUtils::writeStringToFile
    std::string writeDataStr = "the string data will be write into a file";
    std::string fullPath = writablePath + "writeStringTest.txt";
    FileUtils::getInstance()->writeStringToFile(writeDataStr, fullPath.c_str());

    // FileUtils::writeDataToFile
    std::string writeDataStr = "the binary data will be write into a file";
    Data writeData;
    writeData.copy((unsigned char *)writeDataStr.c_str(), writeDataStr.size());
    std::string fullPath = writablePath + "writeDataTest.txt";
    FileUtils::getInstance()->writeDataToFile(writeData, fullPath.c_str()));

    // FileUtils::writeValueMapToFile
    std::string fullPath = writablePath + "testWriteValueMap.plist";
    FileUtils::getInstance()->writeValueMapToFile(valueMap, fullPath.c_str());

    // FileUtils::writeValueVectorToFile
    std::string fullPath = writablePath + "testWriteValueVector.plist";
    FileUtils::getInstance()->writeValueVectorToFile(valueVector, fullPath.c_str());
    ```

    除此之外，你可以通过 `FileUtils::getFileExtension` 获取文件扩展名（小写）。

### 其他

1. 绑定生成工具

    在 v3.8 我们优化了绑定生成工具，现在更给力了。而且基本上可以绑定所有的 C++ 接口到脚本上。以下是一些优化细节。

    - 支持生成自动绑定公有成员变量
    - 避免使用 JS 对象管理非引用类型的 C++ 对象内存泄露
    - 支持 classes_need_extend 列表中配置 JSB 类的自动扩展
    - 优化 JSB 对 Lambda 函数的自动绑定

2. JSB 测试例

    在 v3.8 中， JSB 测试例被合入到 C++ 测试例中，也就是说 cocos2d_js_tests.xcodeproj，cocos2d-js-win32.sln，cocos2d-js-win8.1-universal.sln 被移除了。你可以在 cocos2d_test.xcodeproj，cocos2d-win32.sln 和 cocos2d-win8.1-universal.sln 中找到 jsb 测试例的 target。

3. 编译 debug 模式的自定义引擎预编译库

    从 v3.7 开始，你可以从 cocos2d-x 中生成自定义的 Cocos Framework。在 v3.8 中我们优化了这个功能，现在你可以生成 debug 模式下的 framework。以下是使用文档：

    - [Framework 编译文档](http://www.cocos2d-x.org/wiki/Cocos_gen-libs).
    - [如何自定义 Cocos Framework](http://www.cocos2d-x.org/docs/manual/studio/v4/chapter3/HowToCode/CustomizeFramework-v3.8/en)
    - [如何生成 Cocos Simulator](http://www.cocos2d-x.org/wiki/Cocos_gen-simulator)

4. 支持竖屏项目

    从 v3.8 开始， 你使用 Cocos Console 生成竖屏项目：

    ```
    cocos new -l cpp|lua|js --portrait MyPortraitGame
    ```

    更多细节可以参考 [Cocos new command](http://www.cocos2d-x.org/wiki/Cocos_new) 和 [Cocos Console general documentation](http://www.cocos2d-x.org/wiki/Cocos2d-console)。

## 其他变更

- [NEW]           UI: Enhanced ScrollView with easing out scrolling
- [NEW]           UI: Added PageView vertical scroll support
- [NEW]           UI: Added PageView::JumpToPage API
- [NEW]           UI: Added a setter for line width in DrawNode
- [NEW]           Action: Permitted setting bitwise flags to action
- [NEW]           Animate: Added Animate's getCurrentFrameIndex function
- [NEW]           FileUtils: Added FileUtils::getFileExtension for getting file's extension name
- [NEW]           Device: Added vibrate support to enable vibration for a duration
- [NEW]           UserDefault: Supported removing key pairs from UserDefault
- [NEW]           spine: Supported Spine runtime 2.3 (Both native and web engine)
- [NEW]           console: Moved the framework-compile tools into cocos2d-console
- [NEW]           network: Upgrade SocketIO support to v1.x

- [REFINE]        3D: Supported composite 2D/3D scene by moving UI and camera far away
- [REFINE]        3D: Improved Particle3D performance
- [REFINE]        Label: Supported adding child nodes in Label
- [REFINE]        UI: Improved Slider's precision
- [REFINE]        UI: Refined scroll event dispatching for ScrollView
- [REFINE]        UI: Improved event handling in TextField
- [REFINE]        Label: Supported auto batch with bitmap font or char map
- [REFINE]        studio: Added BlendFrame support to Skeleton Animation
- [REFINE]        studio: Enabled blendfunc cascade to the skin of BoneNode
- [REFINE]        utils: Made utils::captureScreen saving file in another thread to improve the performance
- [REFINE]        3rd party: Update Nibiru SDK to 2.6
- [REFINE]        JS: Supported new construction for 3d classes in JS
- [REFINE]        JS: Refine performance for Cocos Studio JSON parser for 2.x
- [REFINE]        web: Avoid re-bake the content when the parent node's position get changed
- [REFINE]        web: Solved repeat loading same resource issue when parsing cocos studio project
- [REFINE]        web: Optimized resources automatic loading in JSON parser
- [REFINE]        web: Avoid cc.loader resource loading being terminated while encounter errors
- [REFINE]        web: Suspended the video player when the browser is minimized

你也可以参考 [完整修改日志](https://github.com/cocos2d/cocos2d-x/blob/v3/CHANGELOG)。

## 新的 APIs

以上的变更中，有一些新的 API 在 v3.8 中被引入，如下：

1. PageView 垂直滚动支持

    ```
    PageView* pageView = PageView::create();
    pageView->setContentSize(Size(240.0f, 130.0f));
    pageView->setDirection(ui::PageView::Direction::VERTICAL);
    ```

2. DrawNode 线宽设置

    ```
    DrawNode* drawNode = DrawNode::create();
    drawNode->setLineWidth(5.0f);
    ```

3. action 位标识

    ```
    enum Flags {
        FRAME = 1,
        COLOR = 2,
        OPACITY = 4,
        POSITION = 8,
        SCALE = 16,
        ROTATION = 32,
        SKEW = 64
    };

    auto action = RepeatForever::create(Sequence::create(FadeTo::create( 0.1f, 155), TintTo::create(0.1f, 255,0,0), nullptr));
    // Since opacity and color will be modified in this action, it can be flagged as opacity and color action
    action->setFlags(Flags::OPACITY|Flags::COLOR);

    auto action2 = RepeatForever::create(Sequence::create(MoveBy::create(0.3f, Vec2(5, 0)), nullptr));
    // Since position will be modified in this action, it can be flagged as position action
    action->setFlags(Flags::POSITION);
    ```

4. 获取动画当前帧索引

    ```
    auto action = RepeatForever::create( Animate::create(animation);
    sprite->runAction(action);
    sprite->scheduleOnce([=](float){
        int index = action->getCurrentFrameIndex();
        // ...
    }, 1.0f, "get-current-frame");
    
    ```

5. 文件扩展名获取

    ```
    std::string extension = FileUtils::getInstance()->getFileExtension("grossini.png");
    ```

6. 震动支持

    ```
    // Virate the device for 0.5 second
    Device::vibrate(0.5f);
    ```

7. 从 UserDefault 移除键值对

    ```
    // Remove value referenced by "some key"
    UserDefault::getInstance()->deleteValueForKey("some key");
    ```

# 下一步计划

在 v3.9 中，我们会持续优化引擎框架，目前有如下几项重要任务：

1. 我们考虑提供一套基于脚本的组件系统
2. 优化 native 和 web 引擎的 ScrollView，ListView 性能。
3. 优化 2D 粒子系统的性能。
4. 优化 web 引擎的渲染逻辑和性能。
5. 支持 JSB 的 Action 继承机制。
6. 移除 Android 和 iOS 对 libcurl 的依赖。

[v3.9 里程碑](https://github.com/cocos2d/cocos2d-x/milestones/v3.9)（一直在审查和更新之中）