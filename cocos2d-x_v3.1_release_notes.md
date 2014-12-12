# cocos2d-x v3.1 发布说明 #

**目录**  *由[DocToc](http://doctoc.herokuapp.com/)生成*

- [cocos2d-x v3.1 发布说明](#)
- [概况](#)
- [需求](#)
	- [环境需求](#)
	- [编译需求](#)
	- [如何运行 TestCpp](#)
		- [Mac OSX & iOS](#)
		- [Android](#)
		- [Windows](#)
		- [Linux](#)
	- [如何开始一个新游戏](#)
- [v3.0 亮点](#)
- [细节](#)
	- [Sprite3D](#)
	- [提升了Shader子系统](#)
	- [新的数学库](#)
	- [新的UIVideoPlayer](#)
	- [UI导航](#)
		- [用法](#)
		- [局限](#)
	- [提升目录结构设计](#)
	- [粒子系统修复](#)
- [其他 API 变更](#)
	- [弃用函数和全局变量](#)

# 概况

* 下载: http://cdn.cocos2d-x.org/cocos2d-x-3.1rc0.zip
* 完整更新日记: https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.1rc0/CHANGELOG
* ~~API参考手册: http://www.cocos2d-x.org/reference/native-cpp/V3.0/index.html~~
* v3.0 发布说明: [v3.0 Release Notes](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0/docs/RELEASE_NOTES.md)

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8 及以上
* Linux Ubuntu 12.04 及以上
* ~~Browsers via Emscripten~~ 暂不支持

## 编译需求

* Xcode 4.6 及以上 for iOS or Mac
* gcc 4.7 及以上 for Linux
* gcc 4.7 和 ndk-r9 及以上 for Android
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

请参考: [ReadMe](../README.md)

# v3.0 亮点

* `Sprite3D`，一个用于渲染3D模型的新节点
* 提升了Shader子系统
* 新的，统一的数学库
* `ui::VideoPlayer`，一个用于播放视频的新节点


# 细节

## Sprite3D

cocos2d-x v3.0 将`Node`的变换矩阵将2x3替换为4x4。这个特性允许你在一个3d空间内转换任意的节点。

`Sprite3D`允许开发者在cocos2d中渲染一个3d模型。因为cocos2d-x拥有了4x4的变换矩阵，所以它能够实现`Sprite3D`在x，y，z轴上的移动，缩放和旋转。

它的API是非常类似于`Sprite`的:

```c++
//v3.1仅支持波前文件格式
auto sprite3d = Sprite3D::create("mymodel.obj");

//如果.obj文件中没有指定材质，你可以重写它：
auto sprite3d = Sprite3D::create("mymodel.obj", "texture.png");

//因为Sprite3D是一个常规的节点，所以你可以像其他节点一样添加到场景中
scene->addChild(sprite3d);
sprite3d->setRotation3D(Vec3(x,y,z));
```

## 提升了Shader子系统
为了支持`Sprite3D`，我们重构了shader子系统，对2D和3D的而言，shader系统将会更强大也更易于使用。

在v3.0中，`GLProgram`类即用于控制 _OpenGL program_ (shader)，同时也用于shader状态(uniforms变量，attributes变量)。

这样的设计有个很大的局限：为了增加或者移除一个attribute或者uniform，你不得不去继承`GLProgram`子类。

在3.1中，我们将shader状态从shader中分离出来，我们添加了`GLProgramState`用于控制uniforms变量和attributes变量。

API如下:

```c++
auto glprogram = GLProgram::create(...);

// 它将会自动解析所有的attributes和uniforms
// 由glprogram使用，它将会填充glprogramstate dictionary
auto glprogramstate = GLProgramState::create( glprogram );

// 怎样去为Vec2设置一个uniform（Int, Texture, Vec3, Vec4, Mat4都支持）
glprogramstate->setUniformVec2("u_my_uniform", Vec2(x,y));
// 怎样用一个回调来设置它
glprogramstate->setUniformCallback("u_my_uniform", [](Uniform*uniform){
    // do something
});

// 怎样设置一个属性
glprogramstate->setVertexAttribPointer("a_my_attrib", 4, GL_FLOAT, GL_FALSE, 0, vertex);
// 怎样用一个回调来设置它
glprogramstate->setVertexAttribCallback("a_my_attrib", [](VertexAttrib*attrib){
    // do something
 });
```

通过使用这个API就可以改变一个`Sprite3D`的效果，而不需要去子类化任何cocos2d的类

示例:

 - Outline / Shadow / Glow effects
 - Multi-texturing effects
 - Sepia, Grey 或者 other color effects
 - 等等
 
完整示例请参考 [Shader - Sprite](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.1rc0/tests/cpp-tests/Classes/ShaderTest/ShaderTest2.cpp) 和 [Shader - Basic](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.1rc0/tests/cpp-tests/Classes/ShaderTest/ShaderTest.cpp)。



## 新的数学库

cocos2d-x v1.0仅支持2D的特性，所以它使用了一个2x3的变换矩阵来进行操作。

在cocos2d-x v2.0中，我们添加了OpenGL ES 2.0支持（不再基于OpenGL矩阵操作）。所以使用了一个[Kazmath](https://github.com/Kazade/kazmath)数学库来替换openGL ES 1.0的功能。Kazmath在引擎内部使用，绝大多数的情况下，开发者并不会调用Kazmath的API。

在cocos2d-x v3.0中，我们重构了渲染器，同时也希望提供更多的Kazmath API给开发者使用。

在cocos2d-x v3.1中，由于`Sprite3D`需要我们提供更多的API给开发者，这是Kazmath库所不能提供的，而cocos2d-x内部拥有多个数学库是没有意义的。

那么问题来了:

 * 部分代码使用旧的2D数学库
 * 部分代码使用Kazmath
 * 部分代码使用专门的数学代码
 
我们的目标是在cocos2d-x只使用一个数学库，但有以下需求：

 * 易于使用，易于维护
 * 成熟的，被反复证明过的
 * 如果可能的话，使用C++语言
  
所以我们选择了[GamePlay3D](http://gameplay3d.org/)数学库，我们做了小幅的修改，添加了一些cocos2d-x数学代码。

如何使用它呢:

```c++
// vector2
Vec2 vec2(10,20);
Vec2 other2(30,40);
auto ret = vec2.cross(other2);
auto ret2 = vec2 + other2;
auto ret3 = vec3 * scalar;

node->setPosition(vec2);

// vector3
Vec3 vec3(30,40,50);
node->setPosition3D(vec3);

// vector4
Vec4 vec4 = Vec4::ZERO;

// Matrix 4x4
auto identity = Mat4::IDENTITY;
node->setNodeToParentTransform(identity);
```

好消息是旧的API任然是有效的，因为我们使用`typeof`方法将旧的类和结构体定义到新的数学库类型上。


## 新的UIVideoPlayer

v3.1有一个新的`Node`用于播放视频，API是：


```c++
//VideoPlayer在“experimental”命名空间下，因为目前它只支持iOS和Android，而且我们将会修改它的API
auto videoPlayer = cocos2d::experimental::ui::VideoPlayer::create();
videoPlayer->setContentSize(Size(x,y));
videoPlayer->setURL("http://example.com/video.mp4");  
//你也可以像下面这样播放一个本地视频：
//videoPlayer->setFileName("filepath/video.mp4");
videoPlayer->play();
```


## UI导航

3.1支持UI控件的焦点导航，这对OTT制造商是非常有用的。

###用法
支持屏幕中拥有3个水平排布的窗口，我们可以这么定义：

```c++
HBox(widget1, widget2, widget3)
```

如果你想要定位到`widget1`，那么就调用

```c++
widget1->setfocused(true)
```

如果你想要移动焦点到下一个窗口，那么就调用

```c++
widget1->findNextFocusedWidget(Widget::FocusDirection::RIGHT, _firstFocusedWidget);
```

当你的焦点在`widget3`的时候，如果你调用

```c++
widget3->findNextFocusedWidget(Widget::FocusDirection::RIGHT, _firstFocusedWidget);
```

，焦点仍然会停留，只有当你调用了`HBox->setLoopFocus()`，焦点才会重新移动到`widget1`。

**注意：**

HBox和VBox可以通过任意的方式嵌套，所有的窗口都可以被添加到HBox/VBox如果你想要它们晚一点被定位的话。

当焦点从一个窗口移动到另一个的时候，它将会触发一个*focus event*。你可以添加以下的代码来处理这些事件。

```c++
auto eventListener = EventListenerFocus::create();
eventListener->onFocusChanged = CC_CALLBACK_2(UIFocusTestBase::onFocusChanged, this);
eventDispatcher->addEventListenerWithFixedPriority(_eventListener, 1);
``` 

onFocusChanged回调函数中，当窗口失去焦点的时候，我们把它的颜色改成白色的，当窗口得到焦点的时候，我们把它的颜色改成红的。当焦点切换的时候，你可以添加更复杂的动画。

```c++
void UIFocusTestBase::onFocusChanged(cocos2d::ui::Widget *widgetLostFocus, cocos2d::ui::Widget *widgetGetFocus)
{
    Layout *getLayout = dynamic_cast<Layout*>(widgetGetFocus);
    if (!getLayout && widgetGetFocus && widgetGetFocus->isFocusEnabled()) {
        widgetGetFocus->setColor(Color3B::RED);
    }
    Layout *loseLayout = dynamic_cast<Layout*>(widgetLostFocus);
    if (!loseLayout && widgetLostFocus && widgetLostFocus->isFocusEnabled()) {
        widgetLostFocus->setColor(Color3B::WHITE);
    }
}
```

更多使用信息请参考[这个文件](https://github.com/cocos2d/cocos2d-x/blob/v3/tests/cpp-tests/Classes/UITest/CocoStudioGUITest/UIFocusTest/UIFocusTest.cpp)。


###局限

只支持两种类型的布局，`HORIZONTAL`和`VERTICAL`，这意味着我们不能使用Scrollview和PageView作为一个基础布局。

如下布局：

```c++
HBox(VBox, ScrollView(HBox(VBox, VBox, VBox)))
VBox(HBox, PageView(VBox(HBox,HBox))))
```
目前暂不支持，我们将会在cocos2d-x v3.2中实现它。
 
如果你想要实现在scrollview中焦点的移动，你可以使用一个普通的VBox或者HBox布局元素，然后调用`setFocusEnabled(true/false)`手动来跳过不想要的窗口。
 
## 提升目录结构设计

在v3.0中我们重新组织了cocos2d-x的目录结构。可惜我们没有时间及时完成它。

在v3.1中我们完成了目录结构的重新组织，现在它是这样子的：

    cocos/: 包含cocos2d.cpp和其他编译文件
    cocos/2d/: 包含基本的nodes，2d nodes和Node，Scene，Sprite之类的对象.
    cocos/3d/: 包含3d nodes和Sprite3D之类的对象
    cocos/audio/: 声音和音乐相关对象
    cocos/math/: 数学库相关对象
    cocos/platform/: 指定平台对象
    cocos/renderer/: Renderer, Texture2D, Render Commands等GPU相关对象.
    cocos/physcis/: 物理相关对象
    cocos/network/: 网络相关对象
    cocos/editor-support/: 第三方编辑器文件格式

## 粒子系统修复

cocos2d-x v3.0及更早的版本中，`ParticleSystem`有一个bug，Y-flipped参数计算错误。

我们在v3.1中修复了这个bug。但是问题是修复这个bug会破坏向后兼容性。

为了可以更简单地过渡到v3.1，我们创建了一个工具用来修复破坏的粒子系统文件。怎样使用它呢：

    # 修复破坏的.plist文件
    # 会生成一个被转换文件的备份
    $ cocos/tools/particle/convert_YCoordFlipped.py *.plist


# 其他 API 变更

## 弃用函数和全局变量

TODO: 旧的数学API