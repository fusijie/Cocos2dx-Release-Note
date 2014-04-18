# cocos2d-x v3.0 发布说明 #

**目录**  *由[DocToc](http://doctoc.herokuapp.com/)生成*

- [概况](#misc-information)
- [需求](#requirements)
	- [环境需求](#runtime-requirements)
	- [编译需求](#compiler-requirements)
	- [如何运行TestCpp](#how-to-run-testcpp)
		- [Mac OSX & iOS](#mac-osx--ios)
		- [Android](#android)
		- [Windows](#windows)
		- [Linux](#linux)
	- [如何开始一个新游戏](#how-to-start-a-new-game)
- [v3.0特色](#highlights-of-v30)
- [细节](#features-in-detail)
	- [C++11特性](#c11-features)
		- [std::function](#stdfunction)
		- [强类型枚举](#strongly-typed-enums)
		- [覆盖](#override)
	- [去OC化](#removed-objective-c-patterns)
		- [移除C++类的“cc”前缀以及free functions](#no-more-cc-prefix-for-c-classes-and-free-functions)
		- [使用clone()替代copy()](#clone-instead-of-copy)
		- [单例类采用了getInstance()和destroyInstance()](#singletons-use-getinstance-and-destroyinstance)
		- [使用了Ref替代了Object](#object-is-replaced-with-ref)
		- [getters](#getters)
		- [POD类型](#pod-types)
	- [新的渲染器](#new-renderer)
		- [渲染器特性](#renderer-features)
			- [自动批处理](#auto-batching)
			- [自动剔除](#auto-culling)
			- [全局Z轴](#global-z-order)
		- [Sprite和SpriteBatchNode](#sprite-vs-spritebatchnode)
	- [优化 LabelTTF / LabelBMFont / LabelAtlas](#improved-labelttf--labelbmfont--labelatlas)
	- [新的事件分发机制](#new-eventdispatcher)
	- [物理引擎集成](#physics-integration)
- [其他API变更](#misc-api-changes)
	- [ccTypes.h](#cctypesh)
	- [弃用的函数和全局变量](#deprecated-functions-and--global-variables)
- [Lua绑定的修改](#changes-in-the-lua-bindings)
	- [使用Lua绑定生成工具](#use-bindings-generator-tool-for-lua-binding)
		- [绑定带命名空间的类到lua](#bind-the-classes-with-namespace-to-lua)
		- [使用ScriptHandlerMgr来管理注册和注销lua函数](#use-scripthandlermgr-to-manage-the-register-and-unregister-of-lua-function)
	- [其余API修改](#misc-api-changes-1)
		- [使用cc、ccs、ccui、gl和sp作为模块名](#use-ccccsccui-gl-and-sp-as-module-name)
		- [修改函数](#modified-functions)
		- [增加一些模块](#add-some-modules)
		- [增加更多的lua绑定](#add-more-lua-bindings)
		- [将一些lua绑定的类或结构体替换成表](#replace-some-lua-bindings-of-class-or-struct-with-lua-table)
		- [支持lua脚本代码调用Object-C代码和java代码](#support-lua-script-codes-call-object-c-codes-and-java-codes)
		- [添加一些lua文件来储存不同的模块常量](#add-some-lua-files-to-store-the-constants-of-different-modules)

# 概况

* 下载: http://cdn.cocos2d-x.org/cocos2d-x-3.0beta.zip
* 完整更新日记: https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0beta/CHANGELOG
* API参考手册: http://www.cocos2d-x.org/reference/native-cpp/V3.0beta/index.html

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* ~~Windows Phone 8 及以上~~ 暂不支持
* Linux Ubuntu 12.04 及以上
* ~~Browsers via Emscripten~~ 暂不支持

## 编译需求

* Xcode 4.6 (for iOS or Mac)
* gcc 4.7 for Linux or Android. Android 要求 ndk-r9 及以上.
* Visual Studio 2012 (for Windows)

## 如何运行TestCpp

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

请参考 [ReadMe](../README.md)
    

# v3.0 特色

* 使用 C++(C++11) 的特性取代了 Objective-C 的特性
* 优化了 Labels
* 优化了渲染器（比 v2.2 更快）
* 新的事件分发机制
* 物理引擎集成
* 新的 UI 对象
* [JavaScript 远程调试器](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/scripting/javascript/js-remote-debugger/en.md)
* 支持远程控制台
* 重构 Image - 及时释放内存，统一了支持文件格式的 API
* 自动生成 Lua 绑定，添加了 LuaJavaBridge 和 LuaObjcBridge
* 模版容器
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


### 使用clone() 替代 copy()

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

### 单例类采用了getInstance()和destroyInstance()

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


#### 全局 Z 轴

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

更多 `EventDispatcher` 细节可以参考 [this document](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/input/event-dispatcher/en.md)。

## 物理引擎集成

_这些特性从 v3.0-pre-alpha0 开始被添加_

在 v3.0 中，我们把基于 [Chipmunk2D](https://chipmunk-physics.net/) 的物理引擎集成到 Cocos2d-x 中，通过这些特性，你可以很容易创建基于物理效果的游戏，而不必去理解物理引擎。

更的关于物理引擎集成的细节可以参考 [this document](https://github.com/cocos2d/cocos-docs/blob/master/manual/framework/native/physics/physics-integration/en.md)。


# 其他 API 变更

## `ccTypes.h`

Remove *cc* prefix for structure names in ccTypes.h, move global functions into static member functions, and move global constants into const static member variables.

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

Global functions changed example
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

## deprecated functions and  global variables

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

# Changes in the Lua bindings

## Use bindings-generator tool for lua binding

Only have to write an ini file for a module, don't have to write a lot of .pkg files

### Bind the classes with namespace to lua

In previous, the lua binding can not bind classes that have the same class name but different namespaces. In order to resolve this issue, now the metatable name of a class is changed. For example, `CCNode` will be changed to `cc.Node`. This modification will affect some APIs as follows:

	|           v2.x                   |                  v3.0             |
	| tolua_usertype(tolua_S,"CCNode") | tolua_usertype(tolua_S,"cc.Node") |
	| tolua_isusertable(tolua_S,1,"CCNode",0,&tolua_err 		| tolua_isusertable(tolua_S,1,"cc.Node",0,&tolua_err  |
	| tolua_isusertype(tolua_S,1,"CCNode",0,&tolua_err) 		| tolua_isusertype(tolua_S,1,"cc.Node",0,&tolua_err)  |
	| toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCNode") 		| toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"cc.Node")  |
	| tolua_pushusertype(tolua_S,(void*)tolua_ret,"CCFileUtils") 		| tolua_pushusertype(tolua_S,(void*)tolua_ret,"cc.FileUtils")  |
	| tolua.cast(pChildren[i + 1], "CCNode") 			| tolua.cast(pChildren[i + 1], "cc.Node") |

### Use ScriptHandlerMgr to manage the register and unregister of Lua function

When we want to add register and unregister functions of Lua function for class, we need to change the declarative and defined files and then bind to Lua.
In v3.0, we use the `ScriptHandlerMgr`. As an example, lets see the `MenuItem` class:
In the 2.x version, we needed to add a declaration in the MenuItem header file:
```c++
 virtual void registerScriptTapHandler(int nHandler);
 virtual void unregisterScriptTapHandler(void);
```
then implement them in the .cpp file. In the Lua script ,we use it as follow:
```lua
menuItem:registerScriptTapHandler(luafunction)
```

In v3.0 version, we only need to add the `HandlerType` enum in the `ScriptHandlerMgr`, and the implementation in luascript as follow:
```lua
ScriptHandlerMgr:getInstance():registerScriptHandler(menuItem, luafunction,cc.HANDLERTYPE_MENU_CLICKED)
```

## Misc API changes

### Use `cc`、`ccs`、`ccui` `gl` and `sp` as module name

Now classes are bound into different modules instead of using global module. This will avoid conflicts with other codes.

* classes in `cocos2d`、`cocos2d::extension`、`CocosDenshion` and `cocosbuilder`  were bound to `cc` module
* classes in `cocos2d::ui` were bound to `ccui` module
* classes in `spine` were bound to `sp` module
* classes in `cocostudio` were bound to `ccs` module
* global variables are bound to corresponding modules
* all funcionts and constants about `openGl` were bound to `gl` module

Examples:

    | v2.1                    | v3.0                    |
    | CCDirector              | cc.Director             |
    | CCArmature              | ccs.Armature            |
    | kCCTextAlignmentLeft    | cc.kCCTextAlignmentLeft |

### Modified functions

Some global function names are renamed:

Examples:

    | v2.1                    | v3.0                    |
    | CCPoint/ccp             | cc.p                    |
    | CCRect                  | cc.rect                 |
    | CCColor3B               | cc.c3b                  |
    | CCColor4B               | cc.c4b                  |
    | CCColor4F               | cc.c4f                  |

### Add some modules

In the version 3.0, more modules were bound to lua, specific as follows:

* physics
* spine
* XMLHttpRequest
* OpenGL
 
The `XMLHttpRequest` and `physics` are in the `cc` module, the `spine` is in the `sp` module, and the `OpenGL` is in the `gl` module. Related test cases located in:

* physics   ---> TestLua/PhysicsTest
* spine     ---> TestLua/SpineTest
* XMLHttpRequest ---> TestLua/XMLHttpRequestTest
* openGL    ---> TestLua/OpenGLTest

### Add more lua bindings
Such as: New Label、New EventDispatcher and AssetsManager,etc.Related test cases located in:

* New Label ---> TestLua/LabelTestNew
* New EventDispatcher --->TestLua/NewEventDispatcherTest
* AssetsManager  ---> TestLua/AssetsManagerTest

### Replace some lua-bindings of Class or Struct with lua table
In the version 3.0, all the lua-binding of Struct type were replaced with the lua table

Examples:
 
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
    
### Support lua script codes call Object-C codes and Java codes 
`LuaObjcBridge` and `LuaJavaBridge` bound to lua supported lua script codes calls Object-C codes and java codes.
    
### Add some lua files to store the constants of different modules

* Cocos2DConstants.lua store the constants of `cc` module
* StudioConstants.lua store the constants of  `ccs` module
* GuiConstants.lua store the constants of `ccui` module
* OpenglConstants.lua store the constants of `gl` module