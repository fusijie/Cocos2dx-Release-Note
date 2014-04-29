#cocos2d::Vector< T >

- 版本：v3.0 beta
- 语言：C++

定义在 “COCOS2DX_ROOT/cocos/base” 路径下的 "[CCVector.h](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCVector.h)" 的头文件中。

---

```cpp
template<class T>class CC_DLL Vector;
```

---

`cocos2d::Vector<T>` 是一个封装了动态大小的数组的顺序型容器。

它的元素是连续存储的，`cocos2d::Vector<T>` 的存储是自动处理的。其内部的数据结构实现实际上是STL标准的顺序型容器 [std::vector<T>](http://en.cppreference.com/w/cpp/container/vector)。

在 Cocos2d-x v3.0 beta 之前，存在另一个顺序性容器 [cocos2d::CCArray](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCArray.h)，这将会被弃用。

我们很细致地设计了 `cocos2d::Vector<T>` 容器作为 `cocos2d::CCArray` 的替代品，所以请使用 `cocos2d::Vector<T>` 代替 `cocos2d::CCArray`。

`cocos2d::Vector<T>` 常用操作的复杂度（效率）如下：

- 随机访问 - 常量 0(1)

- 在末尾插入或者移除元素 - 分摊常量 0(1) 

- 插入或移除元素 - `cocos2d::Vector<T>` 长度线性相关 O(n)


##模版参数

**T** - 元素类型.

-T 必须是一个指向 [cocos2d::Object](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCObject.h) 子类对象的指针。不能是其他数据类型或者原生类型，因为我们已经将 Cocos2d-x 的内存管理模型集成到 `cocos2d::Vector<T>` 中（从 v3.0 beta 开始）。

##内存管理
`cocos2d::Vector<T>` 类包含了唯一一个数据成员：

```cpp
std::vector<T> _data;
```

`_data` 的内存管理是由编译器自动处理的。如果你在栈上声明了一个 `cocos2d::Vector<T>` 对象，那就不需要关心内存释放问题。

如果你调用了 `new` 操作符来分配一块 `cocos2d::Vector<T>` 的动态内存，那就需要在使用完后调用 `delete` 操作符来释放内存。这同样适用于 `new[]` 和 `delete[]`。

**注意**：在新 C++ 中，它倾向于本地存储对象而不是堆存储对象。所以，请不要调用 `new` 操作符来分配 `cocos2d::Vector<T>` 的堆对象，而是使用栈对象来代替它。

如果你有足够的理由在堆上动态分配 `cocos2d::Vector<T>` 的话，请使用智能指针替换原始指针，比如 `Shared_ptr`，`unique_ptr`。

**警告**：
`cocos2d::Vector<T>` 不是 `cocos2d::Object` 的子类，因此不再像其他的 cocos2d 类一样使用 retain/release 和内存计数管理。换句话说，你不能对 `cocos2d::Vector<T>` 本身调用 retain，release等等操作。


##基本用法
我们用一个统一的接口外加 Cocos2d-x 的内存管理规则来封装了 `std::vector<T>` 基本上所有常用的操作。

所以 `pushBack()` 方法现在将会 retain 该函参的所有权，`popBack()` 方法将会 release 容器最后一个元素的所有权。

当你使用这些操作时，你应该加倍注意底层的内存管理，这东西对于许多的 Cocos2d-x 开发新手是常见陷阱。

**警告**：`cocos2d::Vector<T>` 没有重载 `operator[]`，所以你不能使用像 `vec[i]` 这样的操作来试图从 `cocos2d::Vector<T>` 获取元素。

`cocos2d::Vector<T>` 容器提供了许多不同种类的迭代器。我们受益于 C++ 标准库的标准基础设施；例如，大量专用的标准通用算法和 for_each 循环。

除了 `std::vector<T>` 容器操作，我们还添加了很多标准算法到 `cocos2d::Vector<T>`，比如 `std::find`，`std::reverse` 和 `std::swap`，这样简化了很多有用的、常用的操作。

更多 API 的使用，请参考引擎源码和 Cocos2d-x 3.0 beta 已实现的测试例。

这里提供一个简单的示例：

```cpp
//使用默认大小创建一个 Vector<Sprite*>，然后往其中加入一个精灵
auto sp0 = Sprite::create();
sp0->setTag(0);
//这里我们 demo 使用了 shared_ptr，在你的代码中，请使用栈对象替代 
std::shared_ptr<Vector<Sprite*>>  vec0 = std::make_shared<Vector<Sprite*>>();  //默认构造函数
vec0->pushBack(sp0);

//使用capacity为5来创建一个 Vector<Object*>，然后往其中加入一个精灵
auto sp1 = Sprite::create();
sp1->setTag(1);

//用一个容量初始化一个 vector
Vector<Sprite*>  vec1(5);
//在一个确定的位置插入一个确定的对象
vec1.insert(0, sp1);

//我们也可以加入一整个 vector
vec1.pushBack(*vec0);

for(auto sp : vec1)
{
    log("sprite tag = %d", sp->getTag());
}

Vector<Sprite*> vec2(*vec0);
if (vec0->equals(vec2)) { //如果两个 vector 相同的话返回真
    log("pVec0 is equal to pVec2");
}
if (!vec1.empty()) {  //判断 vector 是否为空
    //获取 vector 的 capacity 和 size，要注意的是 capacity 并不一定等于 size
    if (vec1.capacity() == vec1.size()) {
        log("pVec1->capacity()==pVec1->size()");
    }else{
        vec1.shrinkToFit();   //收缩 vector 以便内存对应上元素的数量
        log("pVec1->capacity()==%zd; pVec1->size()==%zd",vec1.capacity(),vec1.size());
    }
    //pVec1->swap(0, 1);  //通过索引交换 vector 中的两个元素
    vec1.swap(vec1.front(), vec1.back());  //通过值交换 vector 中的两个元素 
        if (vec2.contains(sp0)) {  //返回一个布尔值，用于指示该对象是否存在于 vector 中
        log("The index of sp0 in pVec2 is %zd",vec2.getIndex(sp0));
    }
    //从 vector 中移除元素
    vec1.erase(vec1.find(sp0));
    //pVec1->erase(1);
    //pVec1->eraseObject(sp0,true);
    //pVec1->popBack();
    
    vec1.clear(); //移除所有元素
    log("The size of pVec1 is %zd",vec1.size());
}
 ```

输出:

```cpp
Cocos2d: sprite tag = 1
Cocos2d: sprite tag = 0
Cocos2d: pVec0 is equal to pVec2
Cocos2d: pVec1->capacity()==2; pVec1->size()==2
Cocos2d: The index of sp0 in pVec2 is 0
Cocos2d: The size of pVec1 is 0
```

##最佳实践

- 偏向于使用基于栈构建的 `cocos2d::Vector<T>` 而不使用基于堆构建的 `cocos2d::Vector<T>`。
- 当将 `cocos2d::Vector<T>` 作为参数进行传递的时候，将它声明为一个常引用，如 `const cocos2d::Vector<T>&`。
- 当从一个函数中返回一个 `cocos2d::Vector<T>` 时，简单地返回值对象。编译器将使用移动语义优化这种情况。
- 不要试图在 `cocos2d::Vector<T>` 中保存除 `cocos2d::Object` 子类对象指针以外的其他任意数据类型对象。
