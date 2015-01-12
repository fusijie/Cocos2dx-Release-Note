# cocos2d-x v3.2 发布说明 #

**目录**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [cocos2d-x v3.2 发布说明](#)
- [概况](#)
- [需求](#)
	- [Runtime Requirements](#)
	- [环境需求](#)
	- [编译需求](#)
	- [如何运行 TestCpp](#)
		- [Mac OSX & iOS](#)
		- [Android](#)
		- [Windows](#)
		- [Linux](#)
	- [如何开始一个新游戏](#)
- [v3.2 亮点](#)
- [文档](#)
- [Toolchain 需求变更](#)
- [安卓上的 atof 问题](#)
- [细节](#)
	- [Sprite3D & Animation3D](#)
		- [fbx-conv 用法](#)
	- [Game 控制器](#)
	- [Fast tilemap](#)
	- [Node::enumerateChildren](#)
	- [utils::findChildren](#)
	- [Node::setNormalizedPosition](#)

# 概况

* 下载: http://cdn.cocos2d-x.org/cocos2d-x-3.2.zip
* 完整更新日记: https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.2/CHANGELOG
* API参考手册: http://www.cocos2d-x.org/reference/native-cpp/V3.2/index.html
* v3.0 发布说明: [v3.0 Release Notes](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0/docs/RELEASE_NOTES.md)

# 需求

## Runtime Requirements

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8 及以上
* Linux Ubuntu 14.04 及以上
* ~~Browsers via Emscripten~~ 暂不支持

## 编译需求

* Xcode 5.1 及以上 for iOS or Mac
* gcc 4.9 及以上 for Linux
* ndk-r9d 及以上 for Android
* Visual Studio 2012 及以上 for Windows (win32)
* Visual Studio 2012 及以上 for Windows Phone 8

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

请参考: [ReadMe](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.2/README.md)

# v3.2 亮点

* `Animation3D`/`Animate3D`，3d animation新节点
* `fbx-conv` 支持生成供`Sprite3D`使用的二进制文件
* 支持游戏控制器
* 支持Fast tilemap
* 添加 `utils::cpatureScreen` 支持截图
* Physics body 支持缩放和旋转
* 添加 `Node::enumerateChildren` 和 `utils::findChildren`，支持C++11正则表达式
* 添加 `Node::setNormalizedPosition`，`Node`的位置会根据父节点content size来计算

# 文档

* [Sprite3D & Animation3D](http://cocos2d-x.org/wiki/Sprite3D)
* [Game 控制器](http://www.cocos2d-x.org/wiki/Game_Controller)
* [如何在WP8上编译shader](http://cocos2d-x.org/wiki/How_to_update_wp8_shader)

# Toolchain 需求变更

`Node::enumerateChildren()` 使用了 `std::regex`，后者如果使用gcc v4.8或者更低的版本，将会导致崩溃。
因为 `OTHER_LDFLAGS` 不能在 XCode6 beta3上正常工作，所以我们在iOS上使用了胖包（包含64位库）。但是XCode5.0或者更低的版本通过这种方式会有编译的问题。

所以

* 安卓编译需要NDK r9d或者更新的版本
* linux编译需要gcc 4.9
* iOS上需要Xcode 5.1或者更新的版本

# 安卓上的 atof 问题

我们发现当在Android上用libc++的时候，`atof` 有个bug。这个bug就是，当传入一些有效的数字字符串时，`atof` 的返回值可能是 `-inf`。

举个例子

```c++
atof("90.099998474121094"); // -> 返回值是 -inf
```

我们已经把这个问题反馈给谷歌的工作人员，他们确认了这是一个bug。为了解决这个问题，我们添加了 `utils::atof()`。

对于的这个问题的PR在[这里](https://github.com/cocos2d/cocos2d-x/pull/7440)。你可以参考这个PR获取更多详细信息。

# 细节

## Sprite3D & Animation3D

使用二进制版本的示例代码
```c++
auto sprite3d = Sprite3D::create("filename.c3b");
addChild(sprite3d);

auto animation3d = Animation3D("filename.c3b");
auto animate3d = Animate3D::create(animation3d);
sprite3d->runAction(RepeatForEver::create(animate));
```

更多详细信息请参考[Sprite3D & Animation3D](http://cocos2d-x.org/wiki/Sprite3D).

### `fbx-conv` 用法

* Mac OS X

```
$ cd COCOS2DX_ROOT/tools/fbx-conv/mac
$ ./fbx-conv [-a|-b|-t] FBXFile
```

* Windows

```
cd COCOS2DX_ROOT/tools/fbx-conv/windows
fbx-conv [-a|-b|-t] FBXFile
```

Options:

* -a: 导出文本和二进制格式
* -b: 导出二进制格式
* -t: 导出文本格式

## Game 控制器

支持的游戏控制器类型：

* Android 标准控制器
* Amazon tv
* OUYA
* Moga
* Nibiru
* iOS 标准控制器

示例代码
```c++
// 注册事件监听
auto listener = EventListenerController::create();
listner->onKeyDown = ...
...
eventDispatcher->addEventListenerWithSceneGraphPriority(listener, this);

// 开始连接控制器
Controller::startDiscoveryController();

//处理按键按下/弹起事件
void GameControllerTest::onKeyDown(Controller *controller, int keyCode, Event *event)
{
    switch (keyCode)
    {
        case Controller::Key::BUTTON_A:
        ...
        break;
        
        ...
    }
}
```

更多详细信息请参考 [Game controller](http://www.cocos2d-x.org/wiki/Game_Controller).

## Fast tilemap

Fast tilemap 和 `TMXTiledMap `有着相同的API，不包括deprecated函数。

示例代码
```c++
auto tilemap = cocos2d::experimental::TMXTiledMap::create("MyFile.tmx");
addChild(tilemap);
```

完整的测试例请参考 `COCOS2DX_ROOT/tests/cpp-tests/Classes/TileMapTest/TileMapTest2.cpp`.

## Node::enumerateChildren

这个函数是用于枚举 `Node` 的子节点。它支持C++11正则表达式。

```c++
// 查找名字是'nameToFind’，同时以数字结尾的节点。
node->enumerateChildren("nameToFind[[:digit:]]+", [](Node* node) -> bool {
    ...
    return false; // return true to stop at first match
});

//递归查找名字是'nameToFind’，同时以数字结尾的节点。
node->enumerateChildren("nameToFind[[:digit:]]+", [](Node* node) -> bool {
    ...
    return false; // return true to stop at first match
});
```

完整的 `NodeNameTest` 请参照 `COCOS2DX_ROOT/tests/cpp-tests/NodeTest/NodeTest.cpp`.

因为这个函数使用了`std::regex`，`std::regex`在gcc 4.8或者更低的版本支持并不好，所以我们使用了`clang`和`stdc++`取代了安卓编译。这将导致编译要求 `NDK r9d` 或者更高的版本。Linux上也要求 `gcc 4.9`。

## utils::findChildren

这是一个辅助函数用于通过名字查找一个节点的子节点。这个函数是基于 `Node::enumerateChildren` 实现的。

```c++
auto children = utils::findChildren(node, "nameToFind");

...
```

## Node::setNormalizedPosition

可以通过这个函数使用0～1之间的值设置Node的位置（x，y），`当它有一个父节点的时候可以使用这个函数。`像素上的位置是像这样被计算的：

```c++
// pseudo code
void setNormalizedPosition(Vec2 pos)
{
    Size s = getParent()->getContentSize();
    _position = pos * s;
}
```

完整的 `NodeNormalizedPositionTest1/2` 请参考 `tests/cpp-tests/Classes/NodeTest/NodeTest.cpp`.