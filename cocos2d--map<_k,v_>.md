#cocos2d::Map< K,V >

- 版本: v3.0 beta
- 语言: C++

定义在 “COCOS2DX_ROOT/cocos/base” 路径下的 "[CCMap.h](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCMap.h)" 的头文件中。

---

```cpp
template <class K, class V>
class CC_DLL Map;
```

---
`cocos2d::Map<K,V>` 是一个内部使用了 [std::unordered_map<K, V>](http://en.cppreference.com/w/cpp/container/unordered_map)的关联容器模版。

std::unordered_map<K,V> 是一个存储了由key-value键值对组合成构成的关联性容器，允许基于键对单个元素进行快速检索。

在 unordered_map 中，key value 一般用来标识唯一的一个元素，而 mapped value 是一个对象，其内容关联到对于的 key value。

在内部，unordered_map 的元素并不依赖于 key 或者 mapped 值来使用任何的特定方式排序，而是取决于它们的哈希值，以便通过他们的key值快速访问单个元素（使用平均时间复杂度）。

在 Cocos2d-x v3.0 beta 之前，存在另一个顺序性容器 [cocos2d::CCDictionary](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCDictionary.h)，这将会被弃用。

我们很细致地设计了 `cocos2d::Map<K,V>` 容器作为 `cocos2d::CCDictionary` 的替代品，所以请使用 cocos2d::Map<T> 代替 `cocos2d::CCDictionary`。

##模版参数

**K** - key value的类型.

- unordered_map 中的每一个元素都由它的 key value 唯一标识。

**V** - mapped value的类型.

- T 必须是一个指向 [cocos2d::Object](https://github.com/cocos2d/cocos2d-x/blob/develop/cocos/base/CCObject.h) 子类对象的指针。不能是其他数据类型或者原生类型，因为我们已经将 Cocos2d-x 的内存管理模型集成到 `cocos2d::Map<k,V>` 中。 

##内存管理
`cocos2d::Map<K,V>` 类包含了为一个数据成员：

```cpp
typedef std::unordered_map<K, V> RefMap;
RefMap _data;
```
`_data` 的内存管理是由编译器自动处理的。如果你在栈上声明了一个 `cocos2d::Map<K,V>` 对象，那就不需要关心内存释放问题。

如果你调用了 `new` 操作符来分配一块 `cocos2d::Map<K,V>` 的动态内存，那就需要在使用完后调用 `delete` 操作符来释放内存。这同样适用于 `new[]` 和 `delete[]`。

**Note**：在新 C++ 中，它倾向于本地存储对象而不是堆存储对象。所以，请不要调用 `new` 操作符来分配 `cocos2d::Map<K,V>` 的堆对象，而是使用栈对象来代替。

如果你有足够的理由在堆上动态分配 `cocos2d::Map<K,V>` 的话，请使用智能指针替换原始指针，比如 `Shared_ptr`，`unique_ptr`。

**WARNING**：`cocos2d::Map<K,V>` 不再像其他的 cocos2d 类一样使用 retain/release和引用计数内存管理。

##基本使用

**WARNING**： `cocos2d::Map<K,V>` 没有重载 `operator[]`，所以你不能使用像 `map[i]`这样的操作来试图从 `cocos2d::Map<K,V>` 获取元素。

更多 API 的使用，请参考引擎源码和 Cocos2d-x 3.0 beta 已实现的测试例。

这里提供一个简单的示例:

```cpp
//create Map<K, V> with default size and add a sprite into it
auto sp0 = Sprite::create();
sp0->setTag(0);
Map<std::string, Sprite*> map0;
std::string mapKey0 = "MAP_KEY_0";
map0.insert(mapKey0, sp0);
log("The size of map is %zd.",map0.size()); 
//create a Map<K, V> with capacity equals 5
Map<std::string, Sprite*> map1(map0);
std::string mapKey1 = "MAP_KEY_1";
if(!map1.empty()){
	auto spTemp = (Sprite*)map1.at(mapKey0);
	log("sprite tag = %d", spTemp->getTag());
	auto sp1 = Sprite::create();
	sp1->setTag(1);
	map1.insert(mapKey1, sp1);      
	//get all keys,stored in std::vector, that matches the object
	std::vector<std::string> mapKeyVec;
	mapKeyVec = map1.keys();
	for(auto key : mapKeyVec)
	{
		auto spTag = map1.at(key)->getTag();
		log("The Sprite tag = %d, MAP key = %s",spTag,key.c_str());
		log("Element with key %s is located in bucket %zd",key.c_str(),map1.bucket(key));
	}
	log("%zd buckets in the Map container",map1.bucketCount());
	log("%zd element in bucket 1",map1.bucketSize(1));  
	//get a random object if the map isn't empty, otherwise it returns nullptr
	log("The random object tag = %d",map1.getRandomObject()->getTag());  
	//find(const K& key) can be used to search the container for an element with 'key'
	//erase(const_iterator position) remove an element with an iterator
	log("Before remove sp0, size of map is %zd.",map1.size());
	map1.erase(map1.find(mapKey0));
	log("After remove sp0, size of map is %zd.",map1.size());
}  
//create a Map<K, V> with capacity equals 5
Map<std::string, Sprite*> map2(5);
map2.reserve(10);  //set capacity of the map
```

输出:

```cpp
cocos2d: The size of map is 1.
cocos2d: sprite tag = 0
cocos2d: The Sprite tag = 1, MAP key = MAP_KEY_1
cocos2d: Element with key MAP_KEY_1 is located in bucket 1
cocos2d: The Sprite tag = 0, MAP key = MAP_KEY_0
cocos2d: Element with key MAP_KEY_0 is located in bucket 0
cocos2d: 2 buckets in the Map container
cocos2d: 1 element in bucket 1
cocos2d: The random object tag = 0
cocos2d: Before remove sp0, size of map is 2.
cocos2d: After remove sp0, size of map is 1.
```


##最佳实践

- 当将 `cocos2d::Map<K, V>()` 作为参数进行传递的时候，将它声明为一个常引用，如 `const cocos2d::Map<K, V>()&`。
- T must be the a pointer to `cocos2d::Object` descendant object type. No other data type or primitives are allowed.
- T 必须是是一个指向 `cocos2d::Object` 子类对象的指针，不能是其他数据类型或者原生类型。