
# cocos2d-x v3.6 发布说明 #
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
- [v3.6](#v36)
  - [v3.6亮点](#v36%E4%BA%AE%E7%82%B9)
  - [细节](#%E7%BB%86%E8%8A%82)
    - [3D立方纹理](#3d%E7%AB%8B%E6%96%B9%E7%BA%B9%E7%90%86)
    - [3D天空盒](#3d%E5%A4%A9%E7%A9%BA%E7%9B%92)
    - [3D地形](#3d%E5%9C%B0%E5%BD%A2)
    - [3D骨骼动画质量控制](#3d%E9%AA%A8%E9%AA%BC%E5%8A%A8%E7%94%BB%E8%B4%A8%E9%87%8F%E6%8E%A7%E5%88%B6)
    - [使用SpritePolygon，让填充率不再成为你的瓶颈](#%E4%BD%BF%E7%94%A8spritepolygon%EF%BC%8C%E8%AE%A9%E5%A1%AB%E5%85%85%E7%8E%87%E4%B8%8D%E5%86%8D%E6%88%90%E4%B8%BA%E4%BD%A0%E7%9A%84%E7%93%B6%E9%A2%88)
    - [luajit arm64](#luajit-arm64)
    - [Button内存使用优化](#button%E5%86%85%E5%AD%98%E4%BD%BF%E7%94%A8%E4%BC%98%E5%8C%96)
      - [iOS平台](#ios%E5%B9%B3%E5%8F%B0)
      - [Mac平台](#mac%E5%B9%B3%E5%8F%B0)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 概况

* [完整更新日记](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.6/CHANGELOG)
* v3.0 发布说明: [v3.0 Release Notes](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.0/docs/RELEASE_NOTES.md)

# 需求

## 环境需求

* Android 2.3 及以上
* iOS 5.0 及以上
* OS X 10.7 及以上
* Windows 7 及以上
* Windows Phone 8.1
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

请参考: [ReadMe](https://github.com/cocos2d/cocos2d-x/blob/cocos2d-x-3.6/README.md)

# v3.6

## v3.6亮点

* 3D: 添加天空盒支持
* 3D: 添加地形支持
* 添加`SpritePolygon`以解决绘制填充率的问题
* iOS 64位架构使用luajit v2.1-20150331版本
* 移除WP8支持
* 优化`ui::Button`内存使用
* 第三方库: Spine运行时库更新到v2.1.25版本
* 第三方库: libcurl更新到v7.4版本（支持全平台，除了WP8.1平台）
* 第三方库: chipmunk更新到v6.2.2版本
* 第三方库: openssl更新到v1.0.11版本
* 第三方库: freetype更新到v2.5.5版本
* 第三方库: png更新到v1.6.16版本

因为Angle不再支持WP8，而且全世界范围内WP8的市场份额大概在20%左右，所以在微软OPEN TECH的建议下，从3.6版本开始，我们移除了对WP8的支持。


## 细节

### 3D立方纹理

立方纹理对天空盒和环境贴图非常有用，它使用6张纹理分别投影到立方体的6个面上，进行纹理采用。

**立方纹理的用法**

```c++
auto texturecube = TextureCube::create("left.jpg", "right.jpg", "top.jpg", "bottom.jpg","front.jpg", "back.jpg");
//设置纹理参数
Texture2D::TexParams tRepeatParams;
tRepeatParams.magFilter = GL_NEAREST;
tRepeatParams.minFilter = GL_NEAREST;
tRepeatParams.wrapS = GL_MIRRORED_REPEAT;
tRepeatParams.wrapT = GL_MIRRORED_REPEAT;
texturecube->setTexParameters(tRepeatParams);

//使用自定义着色器创建一个GLProgramState
auto shader = GLProgram::createWithFilenames("cube_map.vert", "cube_map.frag");
auto state = GLProgramState::create(shader);
//传递纹理采样器到我们自定义的着色器中，state是一个指向GLProgramState的指针，u_cubeTex是shader中的一个uniform变量
state->setUniformTexture("u_cubeTex", texturecube);
```

cube_map.frag着色器如下，

```c++
varying vec3        v_reflect; //reflect direction
uniform samplerCube u_cubeTex;

void main(void)
{
    gl_FragColor = textureCube(u_cubeTex, v_reflect); //sample the color of reflection direction
}
```

更多详细信息请参考 `cpp-tests/Sprite3DTest/Sprite3DCubeMapTest`。

### 3D天空盒

天空盒是3D游戏的一个常用组件。它基于立方纹理实现。

**天空盒的用法**

```c++
// 创建一个立方纹理
auto textureCube = TextureCube::create("left.jpg", "right.jpg","top.jpg", "bottom.jpg","front.jpg", "back.jpg");
// 创建一个天空盒
auto skyBox = Skybox::create();
skyBox->retain();
// 将立方纹理设置给天空盒
skyBox->setTexture(textureCube);
addChild(_skyBox);
```

更多详细信息请参考 `cpp-tests/Sprite3DTest/Sprite3DCubeMapTest`。

![tecturecube-and-skybox](https://raw.githubusercontent.com/minggo/Pictures/master/texturecube-skybox.gif)

### 3D地形

地形是3D游戏的一个常用组件。使用一张纹理来代表地形的高度，最多可以使用4张纹理混合模拟地表的细节，比如草地，道路等等。

地形的用法

```c++
//混合层
Terrain::DetailMap dirt("TerrainTest/dirt.jpg"), grass("TerrainTest/Grass2.jpg"), road("TerrainTest/road.jpg"), green("TerrainTest/GreenSkin.jpg");

//高度地图，透明度地图（混合权重）和混合层
Terrain::TerrainData data("TerrainTest/heightmap16.jpg", "TerrainTest/alphamap.png", dirt, grass, road, green);

//创建地形
_terrain = Terrain::create(data,Terrain::CrackFixedType::SKIRT);
//set lod distance
_terrain->setLODDistance(3.2,6.4,9.6);
//必须小于5
_terrain->setMaxDetailMapAmount(4);
addChild(_terrain);
```

更多详细信息请参考 `cpp-tests/Sprite3DTest/TerrainTest`。

![terrian](https://raw.githubusercontent.com/minggo/Pictures/master/terrian.png)

### 3D骨骼动画质量控制

为了让3D骨骼动画运行地更流畅，你可以使用低质量的动画。这里有3种动画质量：

* Animate3DQuality::QUALITY_NONE
* Animate3DQuality::QUALITY_LOW
* Animate3DQuality::QUALITY_HIGH

`Animate3DQuality::QUALITY_NONE` 意思是动画将不会更新. 如果你可以确定3D精灵不可见，那么你可以使用这种类型。`Animate3DQuality::QUALITY_LOW` 会直接使用最近的帧。 `Animate3DQuality::QUALITY_HIGH` 则会使用临近的两帧进行插值运算出当前帧。

```c++
std::string fileName = "Sprite3DTest/orc.c3b";
auto sprite = Sprite3D::create(fileName);
addChild(sprite);
    
auto animation = Animation3D::create(fileName);
if (animation)
{
   auto animate = Animate3D::create(animation);
   //use low quality animation
   animate->setQuality(Animate3DQuality::QUALITY_LOW);
   sprite->runAction(RepeatForever::create(animate));
}
```

也可以通过修改config.plist来配置默认的动画质量，对应的值是`cocos2d.x.3d.animate_high_quality`。如果这个值存在的话，所有的3D骨骼动画都会受到这个值的影响。当然你也可以通过上面的代码来修改。

### 使用SpritePolygon，让填充率不再成为你的瓶颈

SpritePolygon是一个2d节点，和Sprite一样，它显示了一个2d图像。但区别在于，Sprite使用了2个三角形来组成四边形，而SpritePolygon则是由N个三角形组成的。`该特性目前还是一个实验特性。`

![sprite-polygon](https://raw.githubusercontent.com/minggo/Pictures/master/sprite-polygon.jpg)

对于绘制相同的图像，SpritePolygon会让GPU节省大量的像素填充。

因为通常2d游戏的顶点数量比3d游戏少得多，而且几乎所有2d图片都不是四边形，这就导致了显卡浪费大量的带宽来绘制完全透明的区域，所以像素填充率往往是2d游戏的性能瓶颈。SpritePolygon是解决像素填充率瓶颈的有效手段。

下图是性能测试对比图，对应的测试例在`tests/cpp-tests/Classes/SpritePolygonTest`：

![spritepolygon-performance](http://discuss.cocos2d-x.org/uploads/default/_optimized/336/215/1423528cff_690x149.png)

更多详细信息请参考 [这个帖子](http://discuss.cocos2d-x.org/t/new-feature-meshsprite-polygonsprite/21153)

### luajit arm64 

Luajit的版本是[v2.1-20150331](https://github.com/openresty/luajit2/releases)。
我们咨询过luajit的作者，他告知这个版本已经非常稳定了，等v2.1最终版发布时我们将会进行更新。

使用luajit arm64是因为它可以提高性能。在之前的Cocos2d-x版本中，iOS 64位设备使用的是lua。

luajit和luajit arm64的字节码是不兼容的，这意味着你不能在iOS32位和64位设备上使用同一份字节码。

因为Android商店没有强制要求必须上传64位应用程序，所以我们没有在Android上使用luajit arm64版本，因为它的字节码和luajit arm32是不兼容的。

### Button内存使用优化
现在Button上的title文本控件是按需创建的，如果没有title将不会创建一个额外的空文本控件。

我们也移除了Button头文件里的一些无用字符串变量。

我们使用Cpp-Empty-Test来验证优化效果。

以下是代码：

```
auto visibleSize = Director::getInstance()->getVisibleSize();
auto origin = Director::getInstance()->getVisibleOrigin();

int num = 100;
for (int i=0; i < num; ++i)
{
auto button = ui::Button::create("ClosedNormal.png",
"ClosedSelected.png");
button->setPosition(origin + visibleSize/2);
this->addChild(button);
}
```

以下是结果：

#### iOS平台

|button数量|100 | 200 | 500| 1000|
|-----|-----|-----|-----|-----|
|优化前| 61M | 61.9M | 67.1M | 72.2M|
|优化后|60.7M| 61.1M | 66M | 67.9M|

#### Mac平台

|button数量|100 | 200 | 500| 1000|
|-----|-----|-----|-----|-----|
|优化前|26.8M | 27.1M| 33.2M| 35.4M|
|优化后|25.1M|25.9M|28M|32.4M|