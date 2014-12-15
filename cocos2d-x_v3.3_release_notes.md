# cocos2d-x v3.3 发布 #

**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [cocos2d-x v3.3 Release Notes](#)
- [Misc Information](#)
- [Requirements](#)
	- [Runtime Requirements](#)
	- [Compiler Requirements](#)
	- [How to run tests](#)
		- [Mac OSX & iOS](#)
		- [Android](#)
		- [Windows](#)
		- [Linux](#)
	- [How to start a new game](#)
- [v3.3](#)
- [v3.3rc2](#)
	- [Highlights of v3.3rc2](#)
	- [Notes of v3.3rc1](#)
- [v3.3rc1](#)
	- [Highlights of v3.3rc1](#)
	- [Notes of v3.3rc0](#)
- [v3.3rc0](#)
	- [Highlights of v3.3rc0](#)
	- [Features in detail](#)
		- [Light](#)
		- [Spine runtime](#)
		- [AssetsManagerEx](#)
		- [Application::openURL](#)
		- [ClippingRectangleNode](#)
		- [Facebook platform support](#)
- [v3.3beta0](#)
	- [Highlights of v3.3beta0](#)
	- [Features in detail](#)
		- [BillBoard](#)
		- [Triangles command](#)
		- [WebView](#)
		- [New audio](#)
- [v3.3alpha0](#)
	- [Highlights of v3.3alpha0](#)
	- [Features in detail](#)
		- [Camera](#)
		- [Reskin](#)
		- [Attachment](#)
		- [Better support for FBX](#)
		- [New fbx-conv](#)
		- [AABB, OBB and Ray](#)
		- [ui::Scale9Sprite](#)
		- [c++11 random support](#)
		- [RenderTexture save function](#)
		- [Primitive](#)
		- [Consistent way to set GL context attributes](#)
		- [Only two libraries left](#)

# 概括

* 完整更新日记: https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.3/CHANGELOG
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

请参考: [ReadMe](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.2/README.md)

# v3.3

从v3.3rc2开始只是修复了一些bug。

# v3.3rc2

## v3.3rc2亮点

* 支持android arm64位架构，所有的测试例在Nexus 9正常运行
* Cocos Studio Reader: 使用 [FlatBuffer](https://github.com/google/flatbuffers) 替代 [Protobuffer](https://github.com/google/protobuf) 

## v3.3rc1说明

**android**

需要使用Android NDK-r10c编译，具体细节请参考此链接：

http://discuss.cocos2d-x.org/t/build-android-base-on-ndk-r10c/18543.

# v3.3rc1

## v3.3rc1亮点

* WP8: 添加 Win8.1 universal app 支持
* 修复了一些bug.

## v3.3rc0说明

**wp8**

对于WP8，你需要使用`VS2013 with update 3`来使用`Cocos2dShaderCompiler`编译预编译shader。

**lua**

当创建一个新的lua项目的时候，所有的内部lua文件会被拷贝到`src/cocos`目录。我们添加了`cocos/init.lua`文件来加载所有这些内部lua文件。你不必自己手动加载这些lua文件，因为`cocos/init.lua`是默认加载的。所以，你需要在你的代码中移除所有的这些代码：

* require "Cocos2d"
* require "Cocos2dConstants" 
* require "bitExtend"
* require "DrawPrimitives" 
* require "extern"
* require "json"
* require "Opengl"
* require "OpenglConstants" 
* require "CCBReaderLoad" 
* require "AudioEngine"
* require “CocoStudio”
* require “StudioConstants”
* require “ControllerConstants” 
* require “ExtensionConstants”
* require “NetworkConstants”
* require “GuiConstants”
* require “experimentalUIConstants” 

`luaj`和`luaoc`比较特殊，他们不能在`cocos/init.lua`中被加载，因为他们会返回一个对象用于代码中，所以你需要像下面这样替换一下代码：

* require "luaj" -> require "cocos.cocos2d.luaj"
* require "luaoc" -> require "cocos.cocos2d.luaoc"

所有弃用API的lua文件默认不被加载，如果你需要使用这些弃用的API，你应该去掉`src/main.lua`中注释的这一行：

```
-- 去掉这行注释，用于使用弃用的API
-- CC_USE_DEPRECATED_API = true 
require "cocos.init"

```

`cc.EditBox` 和 `cc.Scale9Sprite` 已经被弃用了, 你应该使用 `ccui.EditBox` 和 `ccui.Scale9Sprite`。

`ccs.NodeReader` 被移除了因为native类 `cocostudio::timeline::NodeReader` 已经被移除了。在v3.3rc0中，你可以使用 `cc.CSLoader` 替代。

`sp.Skeleton` 被移除了，因为升级完spine runtime后native类 `spine::Skeleton` 已经被移除了。

`sp.SkeletonAnimation` 的 `registerSpineEventHandler` 变更了：

* registerSpineEventHandler(fucntion)  -> registerSpineEventHandler(funtion, eventType)


# v3.3rc0

## v3.3rc0亮点

* 3d：添加光源支持：包含directional light, point light, spot light 和 ambient light
* New audio: 更多平台支持(Mac OS X and Windows)
* Spine runtime: 升级到 v2.0.18
* Application: 添加 openURL()
* 添加 `AssetsManagerEx`，这是一个 `AssetsManager`的增强版本
* TileMap: 支持交叉的 tile map
* 添加 `ClippingRectangleNode`，这是一个更高效的矩形裁剪
* Node: schedule/unschedule lambda 函数
* iOS和Android的Facebook平台支持，全特性添加，但是API需要Facebook的伙伴打磨。

## 细节

### 光源

为了使3d对象看起来更加真实，我们在这个版本中添加了光源。cocos2d-x支持4种类型的光源：directional light, point light, spot light 和 ambient light。

`DirectionLight`代表着一个非常遥远的光源（比如太阳或者月亮）。光线从天空中的每一个点定向平行地投射下来，通常用于模拟太阳光。

以下代码用于添加一个directional light到场景中，

```c++
auto directionalLight = DirectionLight::create(Vec3(-1.0f, -1.0f, 0.0f), Color3B(200, 200, 200));
addChild(directionalLight);
```

光是默认打开的。也可以用如下代码关闭，

```c++
directionalLight->setEnabled(false);
```

你也可以给光设置一个标识。

```c++
directionalLight->setLightFlag(LightFlag::LIGHT0);
```

如果某个3d精灵的光掩码和光的标识进行与操作后不等于0，那么这个3d精灵就会受光影响。

`PointLight`代表着从一个3D空间向外投射光线的单一无限小的点。通常用于模拟全向光源。

`SpotLight`代表着一个空间中可以发射出一个锥形光场的点。它可以用来模拟台灯，天花板上锥形灯光等等。注意`SpotLight`会更消耗GPU时间。

`AmbientLight`在每一个方向上投下柔和的灯光。

需要注意的是我们使用了前向渲染方法，光源的数量会影响性能。你可以在配置文件中设置着色器支持的最大光源数。

```c++
<key>cocos2d.x.3d.max_dir_light_in_shader</key>
<integer>1</integer>
<key>cocos2d.x.3d.max_point_light_in_shader</key>
<integer>1</integer>
<key>cocos2d.x.3d.max_spot_light_in_shader</key>
<integer>1</integer>
```

### Spine runtime

Spine runtime升级到最新版本`v2.0.18`。这个版本支持`Free-Form-Deformation(FFD)`，它允许meshes可以拉伸，挤压，混合，弹跳，这是使用矩形图片所不允许的。

`Spine runtime 已经升级了它的授权许可，只允许引擎使用未修改的版本，即使有bug也一样。所以童鞋们就不要发spine runtime的pull request了，我们不能合并。`

请参考`tests/cpp-tests/Classes/SpineTest/SpineTest.cpp`使用。

### AssetsManagerEx

`AssetsMangerEx` 是 `AssetsManager`的增强版本。 相比于 `AssetsManager`，使用 `AssetsManagerEx` 有一些优点：

* 支持使用清单文件进行包的复杂更新
* 支持多线程下载
* 支持断点续传

更多细节请参考[这个文档](http://cocos2d-x.org/wiki/Assets_manager)。

### Application::openURL

因为iOS上`UIApplication`有一个函数名叫`openURL`，所以我们也往Application中添加了这个函数，你可以使用这个函数来打开一个url。

```c++
Application::getInstance()->openURL("http://www.cocos2d-x.org/");
```

### ClippingRectangleNode

`ClippingRectangleNode`是一个`ClippingNode`的轻量版本。 相比于 `ClippingNode`, 有一些优点和缺点:

* 优点

    * 它不依赖于stencil buffer，这意味着它可以在更多的安卓设备上运行
    * 性能更好
    
* 缺点
    * 只能用于裁剪矩形区域
    
```c++
auto clipper = ClippingRectangleNode::create();
clipper->setClippingRegion(0, 0, 200, 200);
this->addChild(clipper);

auto content = Sprite::create("MyPicture.png");
...
clipper->addChild(content);
```

### Facebook 平台支持

所有的特性都添加了，但是API需要Facebook的伙伴打磨。`plugin`中有一个测试例。

运行测试例的步骤：

* 打开 `plugin/pluing-x_ios.xcworkspace`
* 选择 `HelloPlugins` 运行
* 有两项： `Test Facebook User` 和 `Test Facebook Share`。

更多细节你可以参考 [这个文档](http://www.cocos2d-x.org/wiki/Integrate_the_Facebook_SDK_for_Cocos2d-x)。

# v3.3beta0

## v3.3beta0亮点

* 3d: `BillBoard`
* audio: iOS和Android添加了新的声音引擎
* DrawNode: 添加了和`DrawPrimitive`一样的功能，同时`DrawPrimitive`标识为弃用
* Renderer: 添加了`triangle command`
* UI: iOS和Android添加了`WebView`
* 添加了一些小的特性，修复了部分bug

## 细节

### BillBoard

`BillBoard`是一个一直朝向摄像机的矩形。这在3D世界中是很有用的。比如一般会使用它来创建赛车游戏中的树。它看起来会比较真实，但相对于3D的树来说，它消耗的性能比较少。

`BillBoard`从Sprite中继承下来，因为它也支持动画。这是一个创建Billboard的示例。

```c++
//通过.png创建一个billboard
auto billboard = BillBoard::create("Images/Icon.png");
addChild(billboard);

//创建一个摄像机来对准这个billboard。否则，它会被默认的摄像机看见
auto camera = Camera::createPerspective(60, (GLfloat)s.width/s.height, 1, 1000);
camera->setCameraFlag(CameraFlag::CAMERA_USER1);
addChild(camera); //add this camera

//这个billboard只被设置了CameraFlag::CAMERA_USER1标识的摄像机看见
billboard->setCameraMask((unsigned short)CameraFlag::CAMERA_USER1);
```

### Triangles command

通过引入`TrianglesCommand`增强了自动批处理特性，`Triangles`的渲染可以被自动批处理。现在如果我们有任意可以由`Triangles`渲染的东西，我们可以使用`TrianglesCommand`或者它的子类来利用自动批处理特性，从而获得性能上的提升。`QuadCommand`用来渲染`Quad`，这就是一个从`TrianglesCommand`继承下来的很好的例子。

使用Triangle Command是非常简单的：

```
	Triangles trs{verts, indices, vertCount, indexCount};
	command->init(globalZOrder,textureID, glProgramState,blend,trs,matrix);
	renderer->addCommand(command);
```

为了提高性能，`Triangles`会维护一个待渲染的定点和索引数据的弱引用，就像是`QuadCommand`那样。在`Renderer`执行`Command`之前，开发者不能释放任何的渲染数据。

### WebView

WebView是一个允许你在Cocos2d-x内部显示web内容的控件。目前我们只提供了iOS和Android的实现，将来会有更多的平台会被添加。

这个类在`cocos2d::ui::experimental`命名空间下。

正如我们之前声明的`experimental`命名空间那样，`experimental`命名空间并不意味着这个控件是不完整的，只是因为缺少了全平台的支持而已。所以，尽管在你的游戏中使用吧。

如果想要在WebView中显示谷歌网站，我们可以简单地这么写：

```cpp
    _webView = cocos2d::experimental::ui::WebView::create();
    _webView->setPosition(winSize/2);
    _webView->setContentSize(winSize * 0.5);
    _webView->loadUrl("http://www.google.com");
    _webView->setScalesPageToFit(true);
```

`setscalesPageToFit`方法将会让WebView的内容自适应它的大小。

我们也可以给WebView设置一些回调：

```cpp
    //我们可以校验URL来决定是否继续
    _webView->shouldStartLoading = CC_CALLBACK_2(WebViewTest::onWebViewShouldStartLoading, this);
    //网页完成加载后回调
    _webView->didFinishLoading = CC_CALLBACK_2(WebViewTest::onWebViewDidFinishLoading, this);
    //网页加载失败后回调
    _webView->didFailLoading = CC_CALLBACK_2(WebViewTest::onWebViewDidFailLoading, this);
```

更完整的测试例，请参考[WebViewTest](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/cpp-tests/Classes/UITest/CocoStudioGUITest/UIWebViewTest/UIWebViewTest.cpp)


### 新的声音引擎

相比于旧的声音引擎，新的声音引擎更加强大，同时它和旧的也不兼容。当新的声音引擎全平台实现的时候我们将会弃用旧的。现在仅支持iOS和Android平台，我们计划在v3.4的时候完成它。

哪些东西在新的声音引擎中增强了：

* 可以播放超过一个背景音乐
* 当一个声音（音乐或者音效）结束的时候可以有一个回调
* 可以获取一个声音的持续时间
* 可以获取/设置一个音乐的播放位置
* 播放的时候可以修改循环状态

和旧的声音引擎相比有什么不同：

* 所有的函数都是静态的，因此你可以更容易地调用它的函数，比如：`Audio::play2d()`
* 不管是音乐还是音效，只有一个调用方法`play2d()`
* 应该使用`Audio::getState()`来确定一个声音是在播放还是暂停
* 在C++中它的类名是`cocos2d::experimental::AudioEngine`，在lua-binding中它的模块名是`ccexp.AudioEngine`
* 没有预加载功能，你可以马上播放一个声音

更完整的测试例，请参考 `tests/cpp-tests/Classes/NewAudioEngineTest/NewAudioEngineTest.cpp`.

# v3.3alpha0

## Highlights of v3.3alpha0

* 3d: `Camera`, `Reskin`, `Attachment`, `Better support for FBX`, `New fbx-conv`, `AABB`, `OBB` and `Ray`
* ui: added `Scale9Sprite`
* FileUitls: added `isDirectoryExist()`, `createDirectory()`, `removeDirectory()`, `removeFile()`, `renameFile()` and `getFileSize()`
* Device: added `setKeepScreenOn()` on iOS and Android 
* Added c++11 random support
* RenderTexture: added a call back function for `saveToFile()`
* Primitive: Support Points, Lines and Triangles for rendering
* SpriteFrameCache: support loading from plist file content data
* Added a consistent way to set GL context attributes for all platforms
* Only two libraries in cocos2d-x, one for c++ codes, another one for lua-binding codes
* Many other small features added and many bugs fixed

## Features in detail

### Camera

This version of camera is powerful than previous one. And you can add it as a child anywhere. If you want to let a Node to be visited by a camera, Node's camera mask should include Camera's flag:

```c++
// let sprite to be visited by a camera
auto sprite = Sprite::create("myFile.png");
sprite->setCameraMask(CameraFlag::USER1);
auto camera = Camera::createPerspective(60, winSize.width/winSize.height, 1, 1000);
camera->setCameraFlag(CameraFlag::USER1);
scene->addChild(camera);
```

If you have many Nodes that want to be visited by a camera, there is a convenient way:

```c++
auto layer = Layer::create();
auto sprite1 = Sprite::create();
auto sprite2 = Sprite::create();
layer->addChild(sprite1);
layer->addChild(sprite2);
// it will set camera mask for all its children
layer->setCameraMask(CameraFlg::USER1); 

auto camera = Camera::createPerspective();
camera->setCameraFlag(CameraFlag::USER1);
scene->addChild(camera);
```

Full test case please  refer to `tests/cpp-tests/res/Camera3DTest/Camera3DTest.cpp`.

### Reskin

It is a powerful feature, all the user change the appearance of character.

For example, there a model named girl.c3b, which has two coats, coat0 and coat1. 
The character's coat can be changed like this,

```c++
//load the girl from file
auto sprite3d = Sprite3D::create("girl.c3b");
//get the mesh named coat0
auto mesh0 = sprite3d->getMeshByName("coat0");
//you can change texture of this mesh if you like
mesh0->setTexture("cloth.png");
//you can change visibility for this mesh, too
mesh0->setVisible(true);
//hide coat1
auto mesh1 = sprite3d->getMeshByName("coat1");
mesh1->setVisible(false);
```

Full test case please refer to 'tests/cpp-tests/Classes/Spret3DTest/Sprite3DTest.cpp'

### Attachment

Allows to attach a node to a bone

Usage,

```c++
auto sprite = Sprite3D::create("girl.c3b");
auto weapon = Sprite::create("weapon.c3b");
auto attachNode = sprite->getAttachNode("left_hand");
attachNode->addChild(weapon);
```

Full test case please refer to 'tests/cpp-tests/Classes/Spret3DTest/Sprite3DTest.cpp'

### Better support for FBX

support multiple mesh
support multiple material
bones bind to each mesh limited to 40. But the FBX model can contain more meshes. So the model can contain much more bones.

### New fbx-conv

It can export more complex model, which contains multiple meshes and multiple materials.

### AABB, OBB and Ray

AABB means Axis Aligned Bounding Box
OBB means Oriented Bounding Box
Ray has a origin position and direction

Each Sprite3D or Mesh has its own AABB.
AABB and OBB can be picked by Ray.

Usage,

```c++
//get ray from camera
Vec3 nearP(location.x, location.y, -1.0f), farP(location.x, location.y, 1.0f); 
auto size = Director::getInstance()->getWinSize();
camera->unproject(size, &nearP, &nearP);
camera->unproject(size, &farP, &farP);
ray._origin = nearP;
ray._direction = farP - nearP;
ray.intersects(sprite3d->getAABB( ) );
```

Full test case please refer to 'tests/cpp-tests/Classes/Spret3DTest/Sprite3DTest.cpp'

### ui::Scale9Sprite

Now we have implemented a new Scale9Sprite class under ui module. Its internal implementation is concise than the previous one plus more features.
The main reason of reimplementing this class is that the Scale9Sprite is heavily used in ui module. Now the ui module is not dependent from extension module.
By applying the new ui::Scale9Sprite, the code inside many widget classes are more cleaner and elegant.

We could manually toggle "slice 9" feature by one function call:

```c++
//ui::Scale9Sprite is slice 9 enabled on default
auto sprite = ui::Scale9Sprite::create("foo.png");
sprite->setScale9Enabled(false);
```

It also supports Flipping now.

```c++
auto sprite = ui::Scale9Sprite::create("bar.png");
sprite->setFlippedX(true);
sprite->setFlippedY(false);
```

Since the ui::Scale9Sprite is a Node rather than a Sprite, so you can't add it to a batch node. If you do want to do some actions on the internal sprite, 
you could call `sprite->getSprite()` to access it. 

Full test case please refer to `tests/cpp-tests/Classes/UITests/CocostudioGUITest/UIScale9SpriteTest.cpp`.

### c++11 random support

Since `rand()` is not good(refer to [this document](http://c-faq.com/lib/randrange.html)), we use c++11 random library to do generate random number, and provide a function to easily using:

```c++
int randInt = cocos2d::random(1, 10);
float randFloat = cocos2d::random(1.f, 10.f);
```

### RenderTexture save function

`RenderTexture::saveToFile()` will not save rendertexture when the function returns, because it just send render command to renderer. The file will be saved after render command is executed. It is not convenient if you want to use the saved file to do some work. So we added a parameter in `RenderTexture::saveToFile()` to set a call back function when the file is saved.

```c++
renderTexture->begin();
...
renderTexture->end();

renderTexture->saveToFile("myFile.png", true, callback);

```

### Primitive

`Primitive` is added to support `Points`,`Lines`,`Triangles` rendering. Previously, if we want to draw a custom geometry(sphere, line), we can only do this by using `CustomCommand`. Now, what is need is to create a Primitive, set datas, and use the corresponding `PrimitiveCommand` to draw the Primitive. 

Here is a simple example of rendering a quad in `Sprite`.

1. create verexBuffer

	```c++
	auto vertexBuffer = VerexBuffer::create(sizeof(V3F_C4B_T2F), 4);
	vertexBuffer->updateVertices(&_quad, 4, 0);
	```

2. create vertexData

	```c++
	auto vertexData = VertexData::create();
	vertexData->addStream(vertexBuffer, VertexStreamAttribute(0, VERTEX_ATTRIB_POSITION, GL_FLOAT, 3, fasle));
	vertexData->addStream(vertexBuffer, VertexStreamAttribute(12, VERTEX_ATTRIB_COLOR, GL_UNSIGNED_BTYE, 4, true));
	vertexData->addStream(vertexBuffer, VertexStreamAttribute(16, VERTEX_ATTRIB_TEX_COORD, GL_FLOAT, 2, fasle));
	```
3. create IndexBuffer
	
	```c++
	auto indexBuffer = IndexBuffer::create(IndexType::INDEX_TYPE_SHORT_16, 6);
	short indices[6] = {0,1,2,3,2,1};
	indexBuffer->updateIndices(indices,6, 0);
	```
4. create primitive
	
	```c++
	auto primitve = Primitive::create(vertexData, indexBuffer, GL_TRIANGLES);
	primitive->setStart(0);
	primitive->setCount(6);
	```
5. add command to renderer
	
	```c++
	_command->init(globalZorder,textureID, glprogramState, blend, primitve, modelViewMatrix);
	renderer->addCommand(&_command);
	```

Primitive supports three typs of primitives (POINTS, LINES, TRIANGLES), vertex and index sharing, multiple streams. It has some constrains:

1. The size of vertex and index Buffer is fixed, which means data must be pre allocated.
2. Batching is not supported.

### Consistent way to set GL context attributes

Now you can set GL context attributes by override `Application::initGLContextAttrs()`, then set GL context attributes there.

```c++
void AppDelegate::initGLContextAttrs()
{
    // r:8 g:8 a:8 depth:24 stencil:8
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};
    GLView::setGLContextAttrs(glContextAttrs);
}
```

Now can only support setting bits of `r`, `g`, `b`, `a`, `depth buffer` and `stencil buffer`. We will support other attributes if needed.

### Only two libraries left

Now there are two libraries left: one for all c++ codes and another one for lua-bindings codes. 

If you are developing with c++, you only have to link to `libcocos2d`. `libcocos2d` includes all c++ codes:

* cocos2d(including 2d and 3d)
* network
* cocosstudio
* ui
* cocosbuilder
* spine
* chipmunk
* box2d
* ...

Not used codes will be stripped by linker.

If you are developing with lua, you should link to `libcocos2d` and `libluacocos2d`. You can comment codes in `lua_module_register.h` if you don't want to some module.

```c++
int lua_module_register(lua_State* L)
{
    register_cocosdenshion_module(L); // comment this line to remove cocosdenshion
    register_network_module(L);       // comment this line to remove network
    register_cocosbuilder_module(L);  // comment this line to remove cocosbuilder
    register_cocostudio_module(L);    // comment this line to remove cocostudio
    register_extension_module(L);     // comment this line to remove extension
    register_ui_moudle(L);            // comment this line to remove ui
    register_spine_module(L);         // comment this line to remove spine
    register_cocos3d_module(L);       // comment this line to remove 3d
    return 1;
}
```

