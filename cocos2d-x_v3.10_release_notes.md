# Cocos2d-x 3.10 发布说明 #

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [概况](#%E6%A6%82%E5%86%B5)
- [需求](#%E9%9C%80%E6%B1%82)
  - [环境需求](#%E7%8E%AF%E5%A2%83%E9%9C%80%E6%B1%82)
  - [编译需求](#%E7%BC%96%E8%AF%91%E9%9C%80%E6%B1%82)
  - [如何运行测试例](#%E5%A6%82%E4%BD%95%E8%BF%90%E8%A1%8C%E6%B5%8B%E8%AF%95%E4%BE%8B)
    - [Cocos Console](#cocos-console)
    - [Mac OSX & iOS](#mac-osx--ios)
    - [Android](#android)
    - [Windows](#windows)
    - [Linux](#linux)
  - [如何开始一个新游戏](#%E5%A6%82%E4%BD%95%E5%BC%80%E5%A7%8B%E4%B8%80%E4%B8%AA%E6%96%B0%E6%B8%B8%E6%88%8F)
- [v3.10](#v310)
  - [新特性，优化点，API 变更](#%E6%96%B0%E7%89%B9%E6%80%A7%E4%BC%98%E5%8C%96%E7%82%B9api-%E5%8F%98%E6%9B%B4)
  - [主要特性的详细介绍](#%E4%B8%BB%E8%A6%81%E7%89%B9%E6%80%A7%E7%9A%84%E8%AF%A6%E7%BB%86%E4%BB%8B%E7%BB%8D)
    - [UI 系统](#ui-%E7%B3%BB%E7%BB%9F)
  - [其他更新](#%E5%85%B6%E4%BB%96%E6%9B%B4%E6%96%B0)
  - [新的 API](#%E6%96%B0%E7%9A%84-api)

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

# v3.10

## 新特性，优化点，API 变更

很高兴宣布 Cocos2d-x v3.10 正式版发布，以下是新特性，优化点以及 API 变更。

1. 提供了一个统一的 Cocos2d-x 和 Cocos 的 setup 程序，方便用于更新最新的 Cocos2d-x 正式版，这同时包含了预编译库和源码，[GitHub](https://github.com/cocos2d/cocos2d-x) 源码同样有效，但是源码中不再有 `.zip` 文件了。
2. 新的 __Cocos Launcher__ 工具！ __Cocos Launcher__ 可以:
  * 使用引擎一步创建新项目，可以使用源码或者预编译库。
  * 更方便集成 SDKBOX，以便使用 Facebook， IAP 和其他第三方服务。
  * 开发者可以提供反馈，并获取支持，这个功能被内置于 __Cocos Launcher__ ，方便和引擎组取得联系，获取帮助。
3. UI 系统
  * 重新实现了 `Scale9Sprite ` ，既提高了性能，又降低了内存消耗。
  * 修改 `PageView ` 继承至 `ListView `，`PageView ` 可以作为一个控件被添加。
  * 为 `Label` 添加新的类型，**CLAMP**，**SHRINK**, **RESIZE_HEIGHT**。
  * 修复了 `ClippingNode ` 作为子节点时表现异常。
4. 优化了 **JavaScript Bindings****，依据 [SpiderMonkey GC best practices](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/GC_Rooting_Guide) 使之更健壮。

## 主要特性的详细介绍

### UI 系统

1. 重新实现了 `Scale9Sprite ` ，既提高了性能，又降低了内存消耗。

    重新实现了 ui::Scale9Sprite，现在 slice sprite 使用 16 个顶点和 54 个索引，而不是 9 个 sprite，内存消耗比之前的实现更低了，性能也更高了。
    
    在 SIMPLE 模式下， 4 条变都是 0，整个sprite会被水平/垂直缩放，在这种模式下，只渲染了一个四边形，比如：

        auto blocks = ui::Scale9Sprite::createWithSpriteFrameName("blocks9c.png");
        //When setting to SIMPLE, only 4 vertexes is used to rendering.
        blocks->setRenderingType(Scale9Sprite::RenderingType::SIMPLE);

    在 SLICE 模式下，它将使用 18 个 三角形来渲染 slice 9 sprite，如果 4 条边都是 0， 仍然有 18 个三角形需要计算。所以请慎重选择你的渲染类型，比如：

		auto sprite = ui::Scale9Sprite::createWithSpriteFrameName("blocks9c.png");
        //When setting to SLICE, 16 vertexes will be used to rendering.
        sprite->setRenderingType(Scale9Sprite::RenderingType::SLICE);
    
2. 修改 `PageView ` 继承至 `ListView `，`PageView ` 可以作为一个控件被添加。

    PageView 之前从 Layout 继承，主要实现了滚动和排列。但是这些特性在 ListView 中已经被实现了。所以移除了 PageView 这些重复的实现，并让它继承至 ListView。

    随之而来的，是 PageView 变的更简单，更易用，更好维护，因为考虑了页实现。比如：

        // Create the page view
        Size size(240, 130);
        PageView* pageView = PageView::create();
        pageView->setDirection(PageView::Direction::HORIZONTAL);
        pageView->setContentSize(size);
        Size backgroundSize = background->getContentSize();
        //"removeAllPages" is changed to "removeAllItems"
        pageView->removeAllItems();
        pageView->setIndicatorEnabled(true);

        int pageCount = 4;
        for (int i = 0; i < pageCount; ++i)
        {
            Layout* layout = Layout::create();
            layout->setContentSize(size);
            
            ImageView* imageView = ImageView::create("cocosui/scrollviewbg.png");
            imageView->setScale9Enabled(true);
            imageView->setContentSize(size);
            imageView->setPosition(Vec2(layout->getContentSize().width / 2.0f, layout->getContentSize().height / 2.0f));
            layout->addChild(imageView);
            
            Text* label = Text::create(StringUtils::format("page %d",(i+1)), "fonts/Marker Felt.ttf", 30);
            label->setColor(Color3B(192, 192, 192));
            label->setPosition(Vec2(layout->getContentSize().width / 2.0f, layout->getContentSize().height / 2.0f));
            layout->addChild(label);
            //"insertPage" is changed to "insertCustomItem"
            pageView->insertCustomItem(layout, i);
        }
        //"removePageAtIndex" is changed to "removeItem"
        pageView->removeItem(0);
        //"scrollToPage" is changed to "scrollToItem"
        pageView->scrollToItem(pageCount - 2);

     更多细节请参考：tests/cpp-tests/Classes/UITest/CocoStudioGUITest/UIPageViewTest/UIPageViewTest.cpp。
    
   
3. 为 `Label` 添加新的类型，**CLAMP**，**SHRINK**, **RESIZE_HEIGHT**。
  
     Overflow 类型用以控制文本显示结果，在 SHRINK 模式下， 字体大小会被动态调整以适应 content 尺寸。在 CLAMP 模式下，文本内容超出显示框，会被截断。在 RESIZE_HEIGHT 模式下，你只能修改文本的宽，而高会被自动适应。比如：
       
        //Change the label's Overflow type
        label->setOverflow(Label::Overflow::RESIZE_HEIGHT);

    更多使用细节请参考：tests/cpp-tests/Classes/LabelTest/LabelTestNew.cpp。

    局限：

     目前只有 TTF 和 BMFONT 支持所有的类型，CharMap 支持所有的类型，除了 SHRINK。因为我们不能计算字体尺寸。系统字体只支持 Overflow::Normal 和 Overflow::RESIZE_HEIGHT。

## 其他更新
[NEW]           RichText supported new line element.

[NEW]           UIText::clone supports clone the text effect.

[NEW]           UI: Added methods to query label effect state.
    
[REFINE]        IOS: Added virtual keyword for some render related function.

[REFINE]        UI: Fixed boring deprecated warning in HttpRequest.

[REFINE]        Network: Fixed Downloader bug on iOS & Android platform.

[REFINE]        Studio: Fixed deprecation warning in SkeletonRenderer.

[REFINE]        JS: Added js test case for fix, improve template.

[REFINE]        Network: Permit http access to cocos2d-x.org in test projects on iOS.

[REFINE]        Network: Crash when removing a remotely downloaded image from texture 
cache in js-binding.

[REFINE]        Win10: WinRT project update version to v3.10.

[REFINE]        Console: Added quiet option for Cocos Toolkit.

[REFINE]        JS: New GC model for js-binding.

[REFINE]        Doc: Fixed typos in documentation and comments.

[REFINE]        UI: Updated controlButton size calculate with new Scale9Sprite logic.

[REFINE]        Win10: Added missing _USRJSSTATIC preprocessor define for ARM builds.

[REFINE]        JS: Added ccvector_to / ccmap_to converted to new js-binding API.

[REFINE]        UI: Slider misprint fix.

[FIX]           Core: Fixed premultiplyAlpha for mipmaps and compressed textures.

[FIX]           UI: Fixed Scale9sprite rendering error when content size smaller than the sum of leftInset and rightInset.

[FIX]           Win32: Fixed EditBox crash when removing an EditBox in a scheduler.

[FIX]           Android: Fixed cannot add view to mFrameLayout when extends Cocos2dxActivity.

[FIX]           2D: Fixed actionNode set at wrong position bug.

[FIX]           3D: Fixed the movement of PUParticle lags one frame.

[FIX]           UI: Fixed the wront argument of setPlaceholderFontName in EditBox.

[FIX]           UI: Fixed EditBox editBoxEditingDidEnd may use the original text after change the text of EditBox in user script.

[FIX]           Audio: Fixed `FinishCallback` never be called in Windows.

[FIX]           UI: Fixed Layout stencil clipping nested with Clipping Node rendering issue.

[FIX]           UI: Keyboard doesn't hide when click the screen outside of EditBox on iOS platform.

[FIX]           UI: Fixed a fatal bug in EditBox implement on Windows platform.

[FIX]           UI: Fixed edit box setPlaceholderFontName and scale font size issue.

[FIX]           Core: Fixed memory leak when initWithImage() failed.

[FIX]           Network: CCDownloader on iOS is broken in v3.9 js-binding.

[FIX]           JS: Bindings fixes for Menu, Sprite and Label.

[FIX]           Studio: Removed weak reference in ActionNode.

[FIX]           UI: shouldStartLoading method should return value to js in js-binding.

[FIX]           UI: Fixed scrollview render error.

[FIX]           JS: Fixed win32 js project crash issue.

[FIX]           UI: Button touch doesn't work with scale9 enabled.

[FIX]           JS: Fixed evalString doesn't return result issue.

[FIX]           JS: Fixed ComponentJS proxy management issue in JSB.

[FIX]           Android: Fixed include in cocos network module.

[FIX]           Network: Fixed web socket crash.

[FIX]           UI: Fixed TextField missing default password style text setting.

[TEST]          S9SpriteTest: Scale9Sprite fade actions with cascade opacity.

[TEST]          Web: Removed default focus block from UIFocusTestVertical.

[TEST]          Lua: Fixed pageViewTest Horizontal scroll won't work in Lua-test.

更完整的改动列表可以阅读 [完整的修改日志](https://github.com/cocos2d/cocos2d-x/blob/v3/CHANGELOG).

## 新的 API

1. RichText

    添加了 RichElementNewLine 以创建新的富文本元素。

    更新信息: [https://github.com/cocos2d/cocos2d-x/pull/14033](https://github.com/cocos2d/cocos2d-x/pull/14033 "https://github.com/cocos2d/cocos2d-x/pull/14033")

2. PageViewIndicator

    添加 PageViewIndicator 以创建 PageViewIndicator.

    更新信息: [https://github.com/cocos2d/cocos2d-x/blob/v3/cocos/ui/UIPageViewIndicator.h](https://github.com/cocos2d/cocos2d-x/blob/v3/cocos/ui/UIPageViewIndicator.h "https://github.com/cocos2d/cocos2d-x/blob/v3/cocos/ui/UIPageViewIndicator.h")

3. PageView 

    修改 PageView 使之继承自 ListView.
    
    更新信息: [https://github.com/cocos2d/cocos2d-x/pull/14252](https://github.com/cocos2d/cocos2d-x/pull/14252 "https://github.com/cocos2d/cocos2d-x/pull/14252")

4. ApplicationProtocol

    添加 API getVersion.

5. PolygonInfo

    添加 API setTriangles.

6. Scale9Sprite

    添加 setRenderingType, getRenderingType.

9. FontFNT

 	添加 setFontSize, getOriginalFontSize.

10. Label

    添加 setBMFontSize, getBMFontSize, enableWrap, isWrapEnabled, setOverflow, getOverflow, initWithTTF, isShadowEnabled, getShadowOffset, getShadowBlurRadius, getShadowColor, getOutlineSize, getLabelEffectType, getEffectColor.

11. AudioEngineImpl

    添加 AudioEngineImpl 以实现 FMOD.

12. Lua Module

    添加 luaval_to_node, node_to_luaval.

13. JS Module

    添加 js_cocos2dx_ComponentJS_create

14. ui::Text

    添加 isShadowEnabled, getShadowOffset, getShadowBlurRadius, getShadowColor,  getOutlineSize, getLabelEffectType, getEffectColor.

15. UITextTest_Clone 

    添加 UITextTest_Clone 类。
    