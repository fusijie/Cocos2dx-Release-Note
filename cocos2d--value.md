#cocos2d::Value

- 版本： v3.0 beta
- 语言： C++

定义在 “COCOS2DX_ROOT/cocos/base” 路径下的 "[CCValue.h](https://github.com/andyque/cocos2d-x/blob/develop/cocos/base/CCValue.h)" 的头文件中。

---

```cpp
class Value;
```

---

`cocos2d::Valie` 是一个包含了很多原生类型（`int`,`float`,`double`,`bool`,`unsigned char`,`char*` 和 `std::string`）外加 `std::vector<Value>`, `std::unordered_map<std::string,Value>` 和 `std::unordered_map<int,Value>` 的类。

你可以把所有上面的提及的原生类型放入 `cocos2d::Value` 对象中，然后将它们转化为对于的原生类型，反之亦然。

在内部，`cocos2d::Value` 使用了一个联合变量来保存各种原生类型，这样可以节省很多的内存空间。

在 Cocos2d-x v3.0 beta 之前，存在着一些原生类型的封装类，如 `CCBool`, `CCFloat`, `CCDouble`, `CCinteger`，这些将会被弃用。

**注意**：当你在处理原生类型和容器的时候，请使用 `cocos2d::Vector<T>`,`cocos2d::Map<K,V>` 和 `cocos2d::Value`。

##内存管理
`cocos2d::Value` 的内存是由它自己的析构函数自动处理的。所以当处理 `cocos2d::Value` 的内存时请坚持以 c++ 内存管理规则进行最佳实践。

`cocos2d::Value` 类包含了以下的数据成员：

```cpp
union
{
    unsigned char byteVal;
    int intVal;
    float floatVal;
    double doubleVal;
    bool boolVal;
}_baseData;

std::string _strData;
ValueVector* _vectorData;
ValueMap* _mapData;
ValueMapIntKey* _intKeyMapData;

Type _type;
```

从代码片段可以看到，`_baseData`，`_strData` 和 `_type` 数据成员的内存是由编译器和她们的析构函数自动处理的。`cocos2d::Value` 的析构函数负责释放所有指针成员变量的资源（`_vectorData`,`_mapData` 和 `_intKeyMapData`）。

**警告**: `cocos2d::Value` 不再像其他的 cocos2d 类一样使用 retain/release和引用计数内存管理。

##基本用法
`cocos2d::Value` 的用法是非常简单的。

这里提供一个简单的示例:

```cpp
Value val;   // call the default constructor
if (val.isNull()) {
	log("val is null");
}else{
	std::string str =val.getDescription();
	log("The description of val0:%s",str.c_str());
}
//----------------------------------------------------
Value val1(65);   // initialize with a integer
//Value val1(3.4f);   // initialize with a float value
//Value val1(3.5);   // initialize with a double value
log("The description of the integer value:%s",val1.getDescription().c_str());
log("val1.asByte() = %c",val1.asByte());
//----------------------------------------------------
std::string strV = "string";
Value val2(strV);   // initialize with string
log("The description of the string value:%s",val2.getDescription().c_str());
//----------------------------------------------------
auto sp0 = Sprite::create();
Vector<Object*>* vecV = new Vector<Object*>();
vecV->pushBack(sp0);
Value val3(vecV);   // initialize with Vector
log("The description of the Vector value:%s",val3.getDescription().c_str());
delete vecV;
//----------------------------------------------------
Map<std::string, Object*>* mapV = new Map<std::string, Object*>();
mapV->insert(strV,sp0);
Value val4(mapV);   // initialize with Map
log("The description of the Map value:%s",val4.getDescription().c_str());
delete mapV;
//----------------------------------------------------
Value val6(&val4);   // initialize with Map
log("The description of the Value-type value:%s",val6.getDescription().c_str());
//----------------------------------------------------
val2 = val1;   // assigning between 2 Value-type
log("operator-> The description of val2:%s",val2.getDescription().c_str());
val2 = 4;   //assigning directly
log("operator-> The description of val4:%s",val2.getDescription().c_str());
```

输出:

```cpp
cocos2d: val is null
cocos2d: The description of the integer value:
65

cocos2d: val1.asByte() = A
cocos2d: The description of the string value:
string

cocos2d: The description of the Vector value:
true

cocos2d: The description of the Map value:
true

cocos2d: The description of the Value-type value:
true

cocos2d: operator-> The description of val2:
65

cocos2d: operator-> The description of val4:
4
```

##最佳实践
- 偏向于使用 `cocos2d::Value` 和新模版容器（`cocos2d::Vector<T>` 和 `cocos2d::Map<K,V>`）而不是使用 `cocos2d::CCBool`，`cocos2d::CCFloat`，`cocos2d::CCDouble`，`cocos2d::CCString`，`cocos2d::CCInteger` 和旧 Objective-c 风格容器（`cocos2d::CCArray` 和 `cocos2d::CCDictionary`）。
- 当你想要处理原生类型集合的时候，用 `cocos2d::Value` 封装原生类型，然后用新的模版容器 `cocos2d::Vector<T>` 和 `cocos2d::Map<K,V>` 组合它们。