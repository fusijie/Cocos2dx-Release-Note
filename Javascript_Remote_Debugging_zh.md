
通过 Firefox 远程调试 Javascript
======================================

使用 Cocos2d-x JSB 来创建一个 2D 游戏是一个非常好的方式。Cocos2d-x JSB 易用，并且比通过C++来开发游戏更节约时间。但是，在 3.0 alpha1 版本之前，你不能像 C++ 工程一样调试 JSB 工程。当项目发生问题的时候，我们又无能为力，这非常让人苦恼。现在我们有了一个方便，高效的解决方案，可以让你像调试 C++ 工程一样调试JSB工程。

### 环境要求

* Cocos2d-x 3.0 alpha1 版本
* Firefox 24 版本及以上

**调试环境** (这个解决方案同样适用于其他环境)

* Mac OS X 10.9
* Xcode 5.02

### 准备工作

1. 打开 Firefox 然后在地址栏输入 **about:config** 以修改一些默认选项。 

2. 你必须修改以下的3个默认选项：

Preference Name                  | Status   | Type    | Value 
---------------------------------|----------|---------|-------
devtools.debugger.remote-enabled | user set | boolean | true
devtools.debugger.remote-host    | user set | string  | 127.0.0.1
devtools.debugger.remote-port    | user set | string  | 5086

### 跳转到工程代码

在调试 JSB 项目之前，你必须让这个方法可用，将以下代码添加到 **AppDelegate.cpp**:

```
bool AppDelegate::applicationDidFinishLaunching()
{
    ...
    
    ScriptingCore* sc = ScriptingCore::getInstance();
    sc->addRegisterCallback(register_all_cocos2dx);
    sc->addRegisterCallback(register_all_cocos2dx_extension);
    sc->addRegisterCallback(register_cocos2dx_js_extensions);
    sc->addRegisterCallback(jsb_register_chipmunk);
    sc->addRegisterCallback(register_all_cocos2dx_extension_manual);
    sc->addRegisterCallback(register_CCBuilderReader);
    sc->addRegisterCallback(jsb_register_system);
    sc->addRegisterCallback(JSB_register_opengl);
    
    sc->start();
    
    // These codes should be added in here
#if defined(COCOS2D_DEBUG) && (COCOS2D_DEBUG > 0)
    sc->enableDebugger();   // Enable debugger here
#endif

   ...
}
```

### JSB 远程调试 

在达成目标之前有3个步骤。这个调试方法是基于 Firefox 的 Web Developer Tools，所以你必须将你的工程连接到 Firefox。

#### 运行你的项目

首先，你必须要做的就是在 Xcode 中运行你的项目。 然后你可用连接 Firefox 和你的项目。这里我们用 **WatermelonWithMe** 作为例子向你展示如何调试 JSB 工程。打开 **cocos2d-x-3.0alpha1/build/cocos2d_samples.xcodeproj** 路径下的工程，选择右侧的工程并运行，效果如下：


![selectedProject.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/selectedProject.png)

![runningProject.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/runningProject.png)

#### 连接 Firefox 和 你的工程

当你在 Xcode 中运行你的项目时，选择 **Tools->Web Developer->Connect...** 来连接 Firefox。

![selectOption.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/selectOption.png)

然后你会看到如下的画面：

![selectConnect.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/selectConnect.png)

点击 **Connect**, 然后选择 **Hello Cocos2d-X JSB** ：

![connecting.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/connecting.png)

![chooseProject.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/chooseProject.png)

现在你就可以使用调试器来调试你的工程了： 

![debugger.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/debugger.png)

### 调试你的工程

你可以使用 Set Breakpoints 和 Step Over 这两种方式来调试你的 JSB 工程。

#### Set Breakpoints

选择一个你准备调试的 js 文件， 然后像 C++ 一样设置一个断点。 按下 **F8** 开始调试, 你会看到一些变量或参数的信息:

![breakpoint.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/breakpoint.png)

#### Step Over

有时，你需要跳转到一个循环或者一个方法来寻找问题， 在这种情况下，你需要使用 **Step Over** 来调试。 幸运的是，JSB 远程调试提供了这个方法，它可以帮助你更容易地找到Bug。

![stepover.png](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/scripting/javascript/js-remote-debugger/res/stepover.png)

#### Step In

虽然我们还没有在远端调试中实现 **Step In** ，但是我们可以在循环或者方法中设置断点（set breakpoint）来达到相同的效果。
