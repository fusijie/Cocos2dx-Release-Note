# cocos2d-x v3.0 发布说明 #

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**目录**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [cocos2d-x v3.0 发布说明](#cocos2d-x-v30-%E5%8F%91%E5%B8%83%E8%AF%B4%E6%98%8E)
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
- [v3.0 亮点](#v30-%E4%BA%AE%E7%82%B9)
- [细节](#%E7%BB%86%E8%8A%82)
  - [C++11 特性](#c11-%E7%89%B9%E6%80%A7)
    - [std::function](#stdfunction)
    - [强类型枚举](#%E5%BC%BA%E7%B1%BB%E5%9E%8B%E6%9E%9A%E4%B8%BE)
    - [覆盖](#%E8%A6%86%E7%9B%96)
  - [去OC化](#%E5%8E%BBoc%E5%8C%96)
    - [移除C++类的“cc”前缀以及free functions](#%E7%A7%BB%E9%99%A4c%E7%B1%BB%E7%9A%84%E2%80%9Ccc%E2%80%9D%E5%89%8D%E7%BC%80%E4%BB%A5%E5%8F%8Afree-functions)
    - [使用 clone 替代 copy](#%E4%BD%BF%E7%94%A8-clone-%E6%9B%BF%E4%BB%A3-copy)
    - [单例类采用了 getInstance 和 destroyInstance](#%E5%8D%95%E4%BE%8B%E7%B1%BB%E9%87%87%E7%94%A8%E4%BA%86-getinstance-%E5%92%8C-destroyinstance)
    - [使用了 Ref 代替了 Object](#%E4%BD%BF%E7%94%A8%E4%BA%86-ref-%E4%BB%A3%E6%9B%BF%E4%BA%86-object)
    - [getters](#getters)
    - [POD 类型](#pod-%E7%B1%BB%E5%9E%8B)
  - [新的渲染器](#%E6%96%B0%E7%9A%84%E6%B8%B2%E6%9F%93%E5%99%A8)
    - [渲染器特性](#%E6%B8%B2%E6%9F%93%E5%99%A8%E7%89%B9%E6%80%A7)
      - [自动批处理](#%E8%87%AA%E5%8A%A8%E6%89%B9%E5%A4%84%E7%90%86)
      - [自动剔除](#%E8%87%AA%E5%8A%A8%E5%89%94%E9%99%A4)
      - [全局 Z 值](#%E5%85%A8%E5%B1%80-z-%E5%80%BC)
    - [Sprite 和 SpriteBatchNode](#sprite-%E5%92%8C-spritebatchnode)
  - [优化 LabelTTF / LabelBMFont / LabelAtlas](#%E4%BC%98%E5%8C%96-labelttf--labelbmfont--labelatlas)
  - [新的事件分发机制](#%E6%96%B0%E7%9A%84%E4%BA%8B%E4%BB%B6%E5%88%86%E5%8F%91%E6%9C%BA%E5%88%B6)
  - [物理引擎集成](#%E7%89%A9%E7%90%86%E5%BC%95%E6%93%8E%E9%9B%86%E6%88%90)
- [其他 API 变更](#%E5%85%B6%E4%BB%96-api-%E5%8F%98%E6%9B%B4)
  - [`ccTypes.h`](#cctypesh)
  - [弃用的函数和全局变量](#%E5%BC%83%E7%94%A8%E7%9A%84%E5%87%BD%E6%95%B0%E5%92%8C%E5%85%A8%E5%B1%80%E5%8F%98%E9%87%8F)
- [Lua 绑定的修改](#lua-%E7%BB%91%E5%AE%9A%E7%9A%84%E4%BF%AE%E6%94%B9)
  - [使用 Lua 绑定生成工具](#%E4%BD%BF%E7%94%A8-lua-%E7%BB%91%E5%AE%9A%E7%94%9F%E6%88%90%E5%B7%A5%E5%85%B7)
    - [绑定带命名空间的类到 Lua](#%E7%BB%91%E5%AE%9A%E5%B8%A6%E5%91%BD%E5%90%8D%E7%A9%BA%E9%97%B4%E7%9A%84%E7%B1%BB%E5%88%B0-lua)
    - [使用 ScriptHandlerMgr 来管理注册和注销 Lua 函数](#%E4%BD%BF%E7%94%A8-scripthandlermgr-%E6%9D%A5%E7%AE%A1%E7%90%86%E6%B3%A8%E5%86%8C%E5%92%8C%E6%B3%A8%E9%94%80-lua-%E5%87%BD%E6%95%B0)
  - [其它 API 变更](#%E5%85%B6%E5%AE%83-api-%E5%8F%98%E6%9B%B4)
    - [使用 `cc`、`ccs`、`ccui` `gl` 和 `sp` 作为模块名](#%E4%BD%BF%E7%94%A8-cc%E3%80%81ccs%E3%80%81ccui-gl-%E5%92%8C-sp-%E4%BD%9C%E4%B8%BA%E6%A8%A1%E5%9D%97%E5%90%8D)
    - [函数名修改](#%E5%87%BD%E6%95%B0%E5%90%8D%E4%BF%AE%E6%94%B9)
    - [添加一些模块](#%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%BA%9B%E6%A8%A1%E5%9D%97)
    - [增加更多的 Lua 绑定](#%E5%A2%9E%E5%8A%A0%E6%9B%B4%E5%A4%9A%E7%9A%84-lua-%E7%BB%91%E5%AE%9A)
    - [将一些 Lua 绑定的类或结构体替换成表](#%E5%B0%86%E4%B8%80%E4%BA%9B-lua-%E7%BB%91%E5%AE%9A%E7%9A%84%E7%B1%BB%E6%88%96%E7%BB%93%E6%9E%84%E4%BD%93%E6%9B%BF%E6%8D%A2%E6%88%90%E8%A1%A8)
    - [支持 Lua 脚本代码调用 Object-C 代码和 java 代码](#%E6%94%AF%E6%8C%81-lua-%E8%84%9A%E6%9C%AC%E4%BB%A3%E7%A0%81%E8%B0%83%E7%94%A8-object-c-%E4%BB%A3%E7%A0%81%E5%92%8C-java-%E4%BB%A3%E7%A0%81)
    - [添加一些 Lua 文件来储存不同的模块常量](#%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%BA%9B-lua-%E6%96%87%E4%BB%B6%E6%9D%A5%E5%82%A8%E5%AD%98%E4%B8%8D%E5%90%8C%E7%9A%84%E6%A8%A1%E5%9D%97%E5%B8%B8%E9%87%8F)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 概况

* 下载: http://www.cocos2d-x.org/filedown/cocos2d-x-3.0-cn
* 完整更新日记: https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0beta/CHANGELOG
* API参考手册: http://www.cocos2d-x.org/reference/native-cpp/V3.0beta/index.html

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8 及以上（初级阶段）
* Linux Ubuntu 12.04 及以上
* ~~Browsers via Emscripten~~ 暂不支持

## 编译需求

* Xcode 4.6 (for iOS or Mac)
* gcc 4.7 for Linux or Android. Android 要求 ndk-r9 及以上.
* Visual Studio 2012 (for Windows)

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

**使用 Eclipse**

    $ cd cocos2d-x
    $ ./setup.py
    $ cd build
    $ ./android-build.py cpp-empty-test -p 10
    
然后

* 把 cocos2d-x Android 项目导入 Eclipse 中，导入的路径是 `cocos/2d/platform/android`
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

请参考 [说明](https://github.com/cocos2d/cocos2d-x/blob/develop/README.md) 和 [文档](https://github.com/chukong/cocos-docs/blob/master/manual/framework/native/getting-started/v3.0/how-to-start-a-new-game/en.md) 。
    

# v3.0 亮点

* 使用 C++(C++11) 的特性取代了 Objective-C 的特性
* 优化了 Labels
* 优化了渲染器（比 v2.2 更快）
* 新的事件分发机制
* 物理引擎集成
* 新的 UI 对象
* [JavaScript 远程调试器](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/scripting/javascript/js-remote-debugger/en.md)
* 支持远程控制台
* 使用 [cocos console](https://github.com/cocos2d/cocos2d-console)创建和运行项目
* 重构 Image - 及时释放内存，统一了支持文件格式的 API
* 自动生成 Lua 绑定，添加了 LuaJavaBridge 和 LuaObjcBridge
* 模板容器
    * 使用 `cocos2d::Map<>` 替代了 `CCDictionary` , [用法](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/data-structure/v3/map/en.md)
    * 使用 `cocos2d::Vector<>` 替代了 `CCArray`, [用法](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/data-structure/v3/vector/en.md)
    * 使用 `cocos2d::Value` 替代了 `CCBool`, `CCFLoat`, `CCDouble`, [用法](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/data-structure/v3/value/en.md)

# 细节

## C++11 特性

_从 v3.0-pre-alpha0 开始，这些特性被添加_

C++11 的一部分特性已经被使用到 cocos2d-x 中了：

* `std::function`, 包含了回调中使用的 lambda 对象
* 对于大多数的 cocos2d-x 枚举和常量采用了强类型枚举
* 在线程中使用了 `std::thread`
* 对于 Override 和 final 方法，增加了 `override` 和 `final` 上下文关键字


### std::function

* `CallFunc` 可以由 `std::function<void()>` 来创建
* `CallFuncN` 可以由 `std::function<void(Node*)>` 来创建
* `CallFuncND` 和 `CallFuncO` 已经被移除了因为它们可以类似地由 `CallFuncN` 和 `CallFunc` 来创建. 可以查看示例中的 ActionsTest.cpp 文件
* `MenuItem` 支持 `std::function<void(Node*)>` 作为回调

`CallFunc` 示例:

```cpp
// v2.1 版本
CCCallFunc *action1 = CCCallFunc::create( this, callfunc_selector( MyClass::callback_0 ) );

// v3.0 版本 (短版本)
auto action1 = CallFunc::create( CC_CALLBACK_0(MyClass::callback_0,this));
auto action2 = CallFunc::create( CC_CALLBACK_0(MyClass::callback_1,this, additional_parameters));

// v3.0 版本 (长版本)
auto action1 = CallFunc::create( std::bind( &MyClass::callback_0, this));
auto action2 = CallFunc::create( std::bind( &MyClass::callback_1, this, additional_parameters));

// v3.0 中你也可以使用lambda表达式或者其他函数对象
auto action1 = CallFunc::create(
                 [&](){
                     auto s = Director::sharedDirector()->getWinSize();
                     auto label = LabelTTF::create("called:lambda callback", "Marker Felt", 16);
                     label->setPosition(ccp( s.width/4*1,s.height/2-40));
                     this->addChild(label);
                 }  );
```

`MenuItem` 示例:

```cpp
// v2.1 版本
CCMenuItemLabel *item = CCMenuItemLabel::create(label, this, menu_selector(MyClass::callback));

// v3.0 版本 (短版本)
auto item = MenuItemLabel::create(label, CC_CALLBACK_1(MyClass::callback, this));

// v3.0 版本 (长版本)
auto item = MenuItemLabel::create(label, std::bind(&MyClass::callback, this, std::placeholders::_1));

// v3.0 中你也可以使用lambda表达式或者其他函数对象
auto item = MenuItemLabel::create(label,
                 [&](Object *sender) {
                     // do something. Item "sender" clicked
                  });
```

### 强类型枚举

_从 v3.0-pre-alpha0 开始，这些特性被添加_

以 `k` 开头的常量和枚举量，通常被定义为 `int` 或者简单的 `enum` 类型，现在已经被强类型枚举（`enum class`）所替代，这样有利于避免冲突和类型错误。

新的格式是:

    | v2.1       | v3.0        |
    | kTypeValue | Type::VALUE |

示例:

	| v2.1                             | v3.0                             |
	| kCCTexture2DPixelFormat_RGBA8888 | Texture2D::PixelFormat::RGBA8888 |
	| kCCDirectorProjectionCustom      | Director::Projection::CUSTOM     |
	| ccGREEN                          | Color3B::GREEN                   |
	| CCPointZero                      | Point::ZERO                      |
	| CCSizeZero                       | Size::ZERO                       |

旧的值仍然是可以使用的，但是已经被标记为 deprecated.

### 覆盖

为了捕获覆盖方法中可能出现的错误，子类的覆盖方法添加了 `override` 的关键字。

示例:

```cpp
class Sprite : public Node {
    bool isFlipY(void) const;
    void setFlipY(bool bFlipY);

    // Overrides
    virtual void setTexture(Texture2D *texture) override;
    virtual Texture2D* getTexture() const override;
    inline void setBlendFunc(const BlendFunc &blendFunc) override;
    inline const BlendFunc& getBlendFunc() const override;
}
```

## 去OC化

_从 v3.0-pre-alpha0 开始，这些特性被添加_

### 移除C++类的“cc”前缀以及free functions

*类的变更*

因为 cocos2d-x 已经使用了 `cocos2d` 的命名空间，因此也就不需要在所有的类中添加 `CC` 的前缀。
示例:

	| v2.1       | v3.0     |
	| CCSprite   | Sprite   |
	| CCNode     | Node     |
	| CCDirector | Director |
	| etc...                |

v2.1 类名仍然有效，但是已经被标记为 deprecated。

*free functions 的变更*

对于 *drawing primitives*:
* 已经被添加到 `DrawPrimitives` 命名空间
* 移除 `cc` 前缀

对于 *gl proxy functions*:
* 已经被添加到 `GL` 命名空间
* 移除 `ccGL` 前缀

示例:

	| v2.1                | v3.0                         |
	| ccDrawPoint()       | DrawPrimitives::drawPoint()  |
	| ccDrawCircle()      | DrawPrimitives::drawCircle() |
	| ccGLBlendFunc()     | GL::blendFunc()              |
	| ccGLBindTexture2D() | GL::bindTexture2D()          |
	| etc...                       				          |

v2.1 free functions 仍然有效，但已经被标记为 deprecated。


### 使用 clone 替代 copy

`clone()` 返回了一份 autoreleased 版本的拷贝。

`copy()` 不再被支持，如果你使用它，仍然是可以编译的，但是代码会崩掉。

示例:
```cpp
// v2.1
CCMoveBy *action = (CCMoveBy*) move->copy();
action->autorelease();

// v3.0
// 不需要使用autorelease，也不需要做转换
auto action = move->clone();
```

### 单例类采用了 getInstance 和 destroyInstance

所有的单例类使用 `getInstance()` 和 `destroyInstance()` (如果可用) 来获取和摧毁实例。

Examples:

	| v2.1                          | v3.0                        |
	| CCDirector->sharedDirector()  | Director->getInstance()     |
	| CCDirector->endDirector()     | Director->destroyInstance() |
	| etc...                                                      |


v2.1 方法仍然有效，但已经被标记为 deprecated。

### 使用了 Ref 代替了 Object

因为 `Object` 容易让人混淆，所以重命名为 `Ref` ，同时移除了和引用计数无关的函数，之前所有继承于 `Object` 的类现在都改为继承于 `Ref`。

### getters

Getters 现在使用了 `get` 前缀。

示例:

	| v2.1                            | v3.0* 				 		       |
	| node->boundingBox()             | node->getBoundingBox() 			   |
	| sprite->nodeToParentTransform() | sprite->getNodeToParentTransform() |
	| etc...                                                               |

当然 getters 在声明中也被标识为 `const` 。 示例:

```cpp
// v2.1
virtual float getScale();

// v3.0
virtual float getScale() const;
```

v2.1 方法仍然有效，但已经被标记为 deprecated。

### POD 类型

接收 POD 类型作为参数的方法（比如：`TexParams`, `Point`, `Size`,等等）已经修改为传递成 `const` 型引用。

示例:
```cpp
// v2.1
void setTexParameters(ccTexParams* texParams);

// v3.0
void setTexParameters(const ccTexParams& texParams);
```


## 新的渲染器

_v3.0-beta 中，这些特性被添加， v3.0-beta2 中进行了优化_

Cocos2d-x v2.2 中渲染方式是没问题的，但是它难以进行优化，也难以添加新的功能和移植到新的平台。
所以，Cocos2d-x v3.0 有了一个更威武，更优雅，更易扩展，更灵活的新渲染器，但是它依旧很容易使用也很好理解。Cocos2d-x 的老用户们将会发现新的API是如此的熟悉，根本不需要去考虑底层做了什么改变和更新，用起来仍然是这么的舒服。

新渲染器特性:

- 它已经从 Scene Graph 中分离出来，`draw()` 方法替代了 “drawing” 发送了一个 `渲染命令` 给 `渲染器`，而 `渲染器` 负责绘制排队的 `渲染命令` 。
- `QuadCommands` (`Sprite` 和 `ParticleSystem` 对象使用) 将会自动进行批处理。
- `CustomCommand` 对象允许用户自定义 OpenGL 代码，使用的 API 类似 v2.2。
- `GroupCommand` 对象允许渲染器中拥有不同 OpenGL 值的“堆栈”。
- `Sprite` 的自动剔除功能（虽然从技术上讲，自动剔除功能是表现在 `Sprite` 代码上而不是 `Renderer` 代码上）
- 全局 Z 轴顺序 (局部 Z 轴顺序仍然有效)

更多的细节信息，可以阅读如下文档: [Renderer Specification document](https://docs.google.com/document/d/17zjC55vbP_PYTftTZEuvqXuMb9PbYNxRFu0EGTULPK8/edit)

### 渲染器特性

#### 自动批处理

自动批处理功能意味着 `渲染器`将会把 `多次绘制调用` 打包为一次 `大的绘制调用`（AKA batch）。组合 `绘制调用`当然需要满足一定的条件：

- 它仅工作在 `QuadCommand` 命令下（由 Sprite 和 ParticleSystem 对象使用）
- `QuadCommadnds` 必须共享相同的材质 ID ：相同的纹理ID，相同的 GLProgram 和相同的混合功能
- `QuadCommands` 必须是连续的 

如果这些条件都满足的话，`渲染器` 将会使用所有这些 `QuadCommand` 对象创建一个批处理（一次绘制调用）。

如果你不熟悉 OpenGL 的使用，批处理对于您游戏的能否拥有一个流畅的运行速度是很重要的，越少的批处理（绘制调用）越有利于您游戏的表现力。

#### 自动剔除

目前，自动剔除功能只在 `Sprite` 对象中实现。

当 `Sprite::draw()` 被调用的时候，它将会检查 `Sprite` 是否超出屏幕，如果是的话，它将不会发送 `QuadCommand` 命令给 `渲染器`,因此可以获得一些性能上的提升。


#### 全局 Z 值

`Node` 增加了新的函数 `setGlobalZOrder()` / `getGlobalZOrder()`,之前的旧函数 `setZOrder()` / `getZOrder()` 也被重命名为 `setLocalZOrder()` / `getLocalZOrder()`。

`globalZOrder` 是一个 `float` （不是 `int`）的参数。这个值在 `渲染器` 中用来给 `RenderCommand` 排序。较低的值拥有较高的优先级。这意味着一个 `globalZorder` 为 `-10`的节点会比一个 `globalZOrder` 为 `10` 的节点优先绘制。

`globalZOrder` 为 `0` （默认值）的节点将会根据 Scene Graph 顺序绘制。

如果 `globalZOrder` 不变的话，Cocos2d-x v3.0 和 Cocos2d-x v2.2 行为一致。

__`globalZOrder()` 和 `localZOrder()`__:

* `globalZOrder` 是用于 `渲染器` 中用来给“绘制命令”排序的
* `localZOrder` 是用于父节点的子节点数组中给 `节点` 对象排序的

__例外__:

待办事项

### Sprite 和 SpriteBatchNode

v2.2
2.2版本中推荐的优化游戏方式是将 `SpriteBatchNode` 对象设置为 `Sprite` 对象的父节点。
虽然使用 `SpriteBatchNode` 对象仍然是一个非常好的优化游戏的方式，但是它仍然有一定的限制：

- `Sprite` 对象的孩子只能是 `Sprite` （否则，Cocos2d-x 会触发断言）
    - 当 `Sprite` 的父节点是 `SpriteBactchNode` 时，不能添加 `ParticleSystem` 作为 `Sprite`的子节点。
    - 这将导致当 `Sprite` 的父节点是 `SpriteBatchNode` 时，不能使用 `ParallaxNode`
- 所有的 `Sprite` 对象必须共享相同的纹理ID (否则，Cocos2d-x 会触发断言)
- `Sprite` 对象使用 `SpriteBatchNode` 的混合函数和着色器。

虽然 v3.0 仍然支持 `SpriteBatchNode` （与之前的版本拥有相同的特效和限制），但是我们不鼓励使用它。相反，我们推荐直接使用 `Sprite`，不需要再它作为子节点添加到 `SpriteBatchNode` 中。

但是，为了能让 v3.0 有更好的表现，你必须要确保你的 `Sprite` 对象满足以下条件：

- 贡献相同的纹理ID（把它们放在一个spritesheet中，就像使用 `SpriteBatchNode` 一样）
- 确保它们使用相同的着色器和混合函数（就像使用 `SpriteBatchNode` 一样）

如果这么做， `Sprites` 将会像使用 `SpriteBatchNode` 一样的快...（在旧设备上大概慢了10%，在新设备上基本上察觉不出）

v2.2 和 v3.0 最大的区别在于：

- `Sprite` 对象可以有不同的纹理ID。
- `Sprite` 对象可以有不同种类的 `Node` 作为子节点，包括 `ParticleSystem`。
- `Sprite` 对象可以有不同的混合函数和不同的着色器。

但是如果你这么做，`渲染器` 可能无法对它所有的子节点进行批处理（性能较低）。但是游戏仍然可以正常运行，不会触发任何断言。

__总结__:

- 保持将所有的精灵放在一张大的 spritesheet 中。
- 使用相同的混合函数（使用默认）
- 使用相同的着色器（使用默认）
- 不要将精灵添加到 `SpriteBatchNode`

只有当你需要一些额外的性能上提升（虽然很小），`SpriteBatchNode` 才会是你最后的选择（你需要对它的限制条件很熟悉）。


## 优化 LabelTTF / LabelBMFont / LabelAtlas

_这些特性从 v3.0-alpha0 开始被添加_

`LabelTTF`, `LabelBMFont` 和 `LabelAtlas` 将会被新的 `Label` 代替. 新的 `Label` 带来的好处有:

* 统一了创建 `LabelTTF`, `LabelBMFont` 和 `LabelAtlas` 的 API
* 使用 `freetype` 生成 labels 的纹理，这样就能保证在不同的平台下 labels 有相同的效果。
* 缓存纹理以提高性能

## 新的事件分发机制

_这些特性从 v3.0-alpha0 开始被添加_

触摸事件，键盘事件，加速器事件和自定义事件等所有事件都由 `EventDispatcher` 分发。
`TouchDispatcher`, `KeypadDispatcher`, `KeyboardDispatcher`, `AccelerometerDispatcher` 已经被移除。

`EventDispatcher` 的特性主要有:

* 事件的分发基于渲染顺序
* 所有的事件都由 `EventDispatcher` 分发
* 可以使用 `EventDispatcher` 来分发自定义事件
* 可以注册一个 lambda 表达式作为回调函数

更多 `EventDispatcher` 细节可以参考 [这个文档](https://github.com/chukong/cocos-docs/blob/master/manual/framework/native/input/event-dispatcher/en.md)。

## 物理引擎集成

_这些特性从 v3.0-pre-alpha0 开始被添加_

在 v3.0 中，我们把基于 [Chipmunk2D](https://chipmunk-physics.net/) 的物理引擎集成到 Cocos2d-x 中，通过这些特性，你可以很容易创建基于物理效果的游戏，而不必去理解物理引擎。

更的关于物理引擎集成的细节可以参考 [这个文档](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/physics/physics-integration/en.md)。


# 其他 API 变更

## `ccTypes.h`

在 ccType.h 中删除结构命名中的 *cc* 前缀，将全局函数移至静态成员函数，将全局常量移至静态成员常量。

	| v2.1 struct names       | v3.0 struct names |
	| ccColor3B 	          | Color3B |
	| ccColor4B 		      | Color4B |
	| ccColor4F 		      | Color4F |
	| ccVertex2F 		      | Vertex2F |
	| ccVertex3F 		      | Vertex3F |
	| ccTex2F 			      | Tex2F |
	| ccPointSprite 	      | PointSprite |
	| ccQuad2 			      | Quad2 |
	| ccQuad3 			      | Quad3 |
	| ccV2F_C4B_T2F 	      | V2F_C4B_T2F |
	| ccV2F_C4F_T2F 	      | V2F_C4F_T2F |
	| ccV3F_C4B_T2F 	      | V3F_C4B_T2F |
	| ccV2F_C4B_T2F_Triangle  | V2F_C4B_T2F_Triangle |
	| ccV2F_C4B_T2F_Quad      | V2F_C4B_T2F_Quad |
	| ccV3F_C4B_T2F_Quad      | V3F_C4B_T2F_Quad |
	| ccV2F_C4F_T2F_Quad      | V2F_C4F_T2F_Quad |
	| ccBlendFunc 		      | BlendFunc |
	| ccT2F_Quad 		      | T2F_Quad |
	| ccAnimationFrameData    | AnimationFrameData |

全局函数变更示例
```c++
// in v2.1
ccColor3B color3B = ccc3(0, 0, 0);
ccc3BEqual(color3B, ccc3(1, 1, 1));
ccColor4B color4B = ccc4(0, 0, 0, 0);
ccColor4F color4F = ccc4f(0, 0, 0, 0);
color4F = ccc4FFromccc3B(color3B);
color4F = ccc4FFromccc4B(color4B);
ccc4FEqual(color4F, ccc4F(1, 1, 1, 1));
color4B = ccc4BFromccc4F(color4F);

color3B = ccWHITE;

// in v3.0
Color3B color3B = Color3B(0, 0, 0);
color3B.equals(Color3B(1, 1, 1));
Color4B color4B = Color4B(0, 0, 0, 0);
Color4F color4F = Color4F(0, 0, 0, 0);
color4F = Color4F(color3B);
color4F = Color4F(color4B);
color4F.equals(Color4F(1, 1, 1, 1));
color4B = Color4B(color4F);

color3B = Color3B::WHITE;
```

## 弃用的函数和全局变量

	| v2.1 names 	| v3.0 names |
	| ccp 			| Point |
	| ccpNeg 		| Point::- |
	| ccpAdd 		| Point::+ |
	| ccpSub 		| Point::- |
	| ccpMult 		| Point::* |
	| ccpMidpoint 	| Point::getMidpoint |
	| ccpDot 		| Point::dot |
	| ccpCrosss 	| Point::cross |
	| ccpPerp 		| Point::getPerp |
	| ccpRPerp 		| Point::getRPerp |
	| ccpProject 	| Point::project |
	| ccpRotate 	| Point::rotate |
	| ccpUnrotate 	| Point::unrotate |
	| ccpLengthSQ 	| Point::getLengthSq() |
	| ccpDistanceSQ | Point::getDistanceSq |
	| ccpLength 	| Point::getLength |
	| ccpDistance 	| Point::getDistance |
	| ccpNormalize 	| Point::normalize |
	| ccpForAngle 	| Point::forAngle |
	| ccpToAngle 	| Point::getAngle |
	| ccpClamp 		| Point::getClampPoint |
	| ccpFromSize 	| Point::Point |
	| ccpCompOp		| Point::compOp |
	| ccpLerp 		| Point::lerp |
	| ccpFuzzyEqual | Point::fuzzyEqual |
	| ccpCompMult 	| Point::Point |
	| ccpAngleSigned | Point::getAngle |
	| ccpAngle 		| Point::getAngle |
	| ccpRotateByAngle | Point::rotateByAngle |
	| ccpLineInersect | Point::isLineIntersect |
	| ccpSegmentIntersect | Point::isSegmentIntersect |
	| ccpIntersectPoint | Point::getIntersectPoint |
	| CCPointMake	| Point::Point |
	| CCSizeMake	| Size::Size |
	| CCRectMake 	| Rect::Rect |
	| PointZero 	| Point::ZERO |
	| SizeZero 		| Size::ZERO |
	| RectZero 		| Rect::ZERO |
	| TiledGrid3DAction::tile | TiledGrid3DAction::getTile |
	| TiledGrid3DAction::originalTile | TiledGrid3DAction::getOriginalTile |
	| TiledGrid3D::tile | TiledGrid3D::getTile |
	| TiledGrid3D::originalTile | TiledGrid3D::getOriginalTile |
	| Grid3DAction::vertex | Grid3DAction::getVertex |
	| Grid3DAction::originalVertex | Grid3DAction::getOriginalVertex |
	| Grid3D::vertex | Grid3D::getVertex |
	| Grid3D::originalVertex | Grid3D::getOriginalVertex |
	| Configuration::sharedConfiguration | Configuration::getInstance |
	| Configuration::purgeConfiguration | Configuration::destroyInstance() |
	| Director::sharedDirector() | Director::getInstance() |
	| FileUtils::sharedFileUtils | FileUtils::getInstance |
	| FileUtils::purgeFileUtils | FileUtils::destroyInstance |
	| GLView::sharedOpenGLView | GLView::getInstance |
	| ShaderCache::sharedShaderCache | ShaderCache::getInstance |
	| ShaderCache::purgeSharedShaderCache | ShaderCache::destroyInstance |
	| AnimationCache::sharedAnimationCache | AnimationCache::getInstance |
	| AnimationCache::purgeSharedAnimationCache | AnimationCache::destroyInstance |
	| SpriteFrameCache::sharedSpriteFrameCache | SpriteFrameCache::getInstance |
	| SpriteFrameCache:: purgeSharedSpriteFrameCache | SpriteFrameCache::destroyInstance |
	| NotificationCenter::sharedNotificationCenter | NotificationCenter::getInstance |
	| NotificationCenter:: purgeNotificationCenter | NotificationCenter::destroyInstance |
	| Profiler::sharedProfiler | Profiler::getInstance |
	| UserDefault::sharedUserDefault | UserDefault::getInstance |
	| UserDefault::purgeSharedUserDefault | UserDefault::destroyInstance |
	| Application::sharedApplication | Application::getInstance |
	| ccc3() 		| Color3B() |
	| ccc3BEqual() 	| Color3B::equals() |
	| ccc4() 		| Color4B() |
	| ccc4FFromccc3B() | Color4F() |
	| ccc4f() 		| Color4F() |
	| ccc4FFromccc4B() | Color4F() |
	| ccc4BFromccc4F() | Color4B() |
	| ccc4FEqual() 	| Color4F::equals() |
	| ccWHITE 		| Color3B::WHITE |
	| ccYELLOW 		| Color3B::YELLOW |
	| ccBLUE 		| Color3B::BLUE |
	| ccGREEN 		| Color3B::GREEN |
	| ccRED 		| Color3B::RED |
	| ccMAGENTA 	| Color3B::MAGENTA |
	| ccBLACK 		| Color3B::BLACK |
	| ccORANGE 		| Color3B::ORANGE |
	| ccGRAY 		| Color3B::GRAY |
	| kBlendFuncDisable | BlendFunc::BLEND_FUNC_DISABLE |

# Lua 绑定的修改

## 使用 Lua 绑定生成工具

只需要为模块写个 ini 文件，而不必写一堆的 .pkg 文件。

### 绑定带命名空间的类到 Lua

之前不能绑定具有相同类名、不同命名空间的类到 Lua。为了解决这个问题，现在类的元表名已被修改了。比如，`CCNode
` 将会被改为 `cc.Node` 。这样的改变将会影响如下一些API的使用。

	|           v2.x                   |                  v3.0             |
	| tolua_usertype(tolua_S,"CCNode") | tolua_usertype(tolua_S,"cc.Node") |
	| tolua_isusertable(tolua_S,1,"CCNode",0,&tolua_err 		| tolua_isusertable(tolua_S,1,"cc.Node",0,&tolua_err  |
	| tolua_isusertype(tolua_S,1,"CCNode",0,&tolua_err) 		| tolua_isusertype(tolua_S,1,"cc.Node",0,&tolua_err)  |
	| toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCNode") 		| toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"cc.Node")  |
	| tolua_pushusertype(tolua_S,(void*)tolua_ret,"CCFileUtils") 		| tolua_pushusertype(tolua_S,(void*)tolua_ret,"cc.FileUtils")  |
	| tolua.cast(pChildren[i + 1], "CCNode") 			| tolua.cast(pChildren[i + 1], "cc.Node") |

### 使用 ScriptHandlerMgr 来管理注册和注销 Lua 函数

当我们想要为类的 Lua 函数添加注册和注销功能，我们需要改变声明和定义文件，然后绑定到 Lua。
在 v3.0 中，我们使用了 `ScriptHandlerMgr`。举个例子，我们可以看下 `MenuItem` 这个类：
在 v2.x 中，我们需要在 MenuItem 的头文件中添加一个声明：
```c++
 virtual void registerScriptTapHandler(int nHandler);
 virtual void unregisterScriptTapHandler(void);
```
然后在 .cpp 文件中实现它们，在 Lua 脚本中使用它们：
```lua
menuItem:registerScriptTapHandler(luafunction)
```

在 v3.0 中，我们只需要在 `ScriptHandlerMgr` 中添加一个 `HandlerType` 的枚举类型，然后在 luascript 中实现即可：
```lua
ScriptHandlerMgr:getInstance():registerScriptHandler(menuItem, luafunction,cc.HANDLERTYPE_MENU_CLICKED)
```

## 其它 API 变更

### 使用 `cc`、`ccs`、`ccui` `gl` 和 `sp` 作为模块名

现在类已经被绑定到不同的模块而不是使用全局模块。这可以避免和其他代码产生冲突。

* `cocos2d`、`cocos2d::extension`、`CocosDenshion` 和 `cocosbuilder`  的类被绑到 `cc` 模块
* `cocos2d:ui` 的类被绑到 `ccui` 模块
* `spine` 的类被绑到 `sp` 模块
* `cocostudio` 的类被绑到 `ccs` 模块
* 全局变量被绑到相应的模块
* 所有关于 `openGl` 的函数和常量被绑到 `gl` 模块

示例:

    | v2.1                    | v3.0                    |
    | CCDirector              | cc.Director             |
    | CCArmature              | ccs.Armature            |
    | kCCTextAlignmentLeft    | cc.kCCTextAlignmentLeft |

### 函数名修改

一些全局函数被重命名：

示例:

    | v2.1                    | v3.0                    |
    | CCPoint/ccp             | cc.p                    |
    | CCRect                  | cc.rect                 |
    | CCColor3B               | cc.c3b                  |
    | CCColor4B               | cc.c4b                  |
    | CCColor4F               | cc.c4f                  |

### 添加一些模块

在 v3.0 中，更多模块被绑定到 Lua，具体如下：

* physics
* spine
* XMLHttpRequest
* OpenGL

`XMLHttpRequest` 和 `physics` 在 `cc` 模块中，`spine` 在 `sp` 模块中， `OpenGL` 在 `gl` 模块中，相关的测试例在：

* physics   ---> TestLua/PhysicsTest
* spine     ---> TestLua/SpineTest
* XMLHttpRequest ---> TestLua/XMLHttpRequestTest
* openGL    ---> TestLua/OpenGLTest

### 增加更多的 Lua 绑定
比如：新的 Label、新的事件分发机制和 AssetsManager 等等。相关的测试例在：

* New Label ---> TestLua/LabelTestNew
* New EventDispatcher --->TestLua/NewEventDispatcherTest
* AssetsManager  ---> TestLua/AssetsManagerTest

### 将一些 Lua 绑定的类或结构体替换成表
在 v3.0中，所有 Lua 绑定的结构体类型被替换成表

示例:
 
    | v2.1                    | v3.0                    |
    | CCPoint                 | lua table               |
    | CCRect                  | lua table               |
    | CCColor3B               | lua table               |
    | CCColor4B               | lua table               |
    | CCColor4F               | lua table               |
    | CCAffineTransform       | lua table               |
    | CCArray                 | lua table               |    
    | CCDictionary            | lua table               |
    | CCPointArray            | lua table               |
    
### 支持 Lua 脚本代码调用 Object-C 代码和 java 代码
`LuaObjcBridge` 和 `LuaJavaBridge` 被绑定到 Lua 以支持 Lua 脚本代码调用 Object-C 代码和 java 代码。
    
### 添加一些 Lua 文件来储存不同的模块常量

* Cocos2DConstants.lua 储存 `cc` 模块的常量
* StudioConstants.lua 储存 `ccs` 模块的常量
* GuiConstants.lua 储存 `ccui` 模块的常量
* OpenglConstants.lua 储存 `gl` 模块的常量
