# 事件分发机制

* 版本：自从Cocos2d-x v3.0 alpha0之后

## 前言

Cocos2d-X 3.0 引入了一个新的机制来响应用户事件。这篇文档将解释新的机制是如何工作的。

基础概念：

- **Event listeners** 包含了你的事件处理代码
- **Event dispatcher** 用于通知用户事件监听器
- **Event objects** 包含事件的信息

为了响应事件, 你必须创建一个 **EventListener** 。一共有5种不同的 EventListener :

* `EventListenerTouch` 响应触摸事件
* `EventListenerKeyboard` 响应键盘事件
* `EventListenerAcceleration` 响应加速计事件
* `EventListenMouse` 响应鼠标事件
* `EventListenerCustom` 响应自定义的事件

然后, 把你的事件处理代码添加到 Event listeners 中的合适的回调函数中 (例如, `onTouchBegan` 对应 `EventListenerTouch` 监听器, `onKeyPressed` 对应 键盘事件监听器。

下一步，用 **EventDispatcher** 注册你的 EventListener 。

当事件发生时 (例如用户触摸了屏幕，按下了键盘的某个键)， `EventDispatcher` 将分发 **Event objects** (例如 `EventTouch`, `EventKeyboard`) 给合适的 EventListeners 然后调用你的回调函数。 每一个事件对象都包含事件的相关信息 (例如事件发生的坐标)。

## 例子

在下面的例子中， 我们将在Scene中添加3个部分重叠的按钮。 每一个按钮都响应触摸按钮。

### 使用图片创建3个Sprite作为按钮

```c++
   auto sprite1 = Sprite::create("Images/CyanSquare.png");
   sprite1->setPosition(origin+Point(size.width/2, size.height/2) + Point(-80, 80));
   addChild(sprite1, 10);
                
   auto sprite2 = Sprite::create("Images/MagentaSquare.png");
   sprite2->setPosition(origin+Point(size.width/2, size.height/2));
   addChild(sprite2, 20);
                                
   auto sprite3 = Sprite::create("Images/YellowSquare.png");
   sprite3->setPosition(Point(0, 0));
   sprite2->addChild(sprite3, 1);
                                                
```
                                                
![touchable_sprite](https://github.com/chukong/cocos-docs/raw/master/manual/framework/native/input/event-dispatcher/res/touchable_sprite.png)

### 创建一个单点触摸事件监听器并且添加回调代码

(需要注意的是，在下面的例子中, 我们使用 _C++11 lambda 表达式_ 实现回调。可以看到，在下面的键盘事件例子中，使用了不同的方式来书写，使用了 `CC_CALLBACK_N` 宏。

```c++
    //创建一个单点（one by one）触摸事件监听器（一次处理一个触摸）
    auto listener1 = EventListenerTouchOneByOne::create();
    // 当吞噬触摸（swallow touches）被设置为 true ，然后如果在 onTouchBegan 方法中返回 true ，那么触摸事件将会被吞噬，防止其他的监听器使用。
    listener1->setSwallowTouches(true);

    // 通过 lambda 表达式实现 onTouchBegan 回调方法的例子
    listener1->onTouchBegan = [](Touch* touch, Event* event){
        // event->getCurrentTarget() 返回监听器的 sceneGraphPriority node 。
        auto target = static_cast<Sprite*>(event->getCurrentTarget());

        //得到现在的点相对于按钮的位置。
        Point locationInNode = target->convertToNodeSpace(touch->getLocation());
        Size s = target->getContentSize();
        Rect rect = Rect(0, 0, s.width, s.height);

        //检查点击区域
        if (rect.containsPoint(locationInNode))
        {
            log("sprite began... x = %f, y = %f", locationInNode.x, locationInNode.y);
            target->setOpacity(180);
            return true;
        }
        return false;
    };

    //触摸移动的触发器
    listener1->onTouchMoved = [](Touch* touch, Event* event){
        auto target = static_cast<Sprite*>(event->getCurrentTarget());
        //Move the position of current button sprite
        //Move the position of current button sprite
        target->setPosition(target->getPosition() + touch->getDelta());
    };

    //处理触摸结束事件
    listener1->onTouchEnded = [=](Touch* touch, Event* event){
        auto target = static_cast<Sprite*>(event->getCurrentTarget());
        log("sprite onTouchesEnded.. ");
        target->setOpacity(255);
        //重新设置zOrder，将改变现实顺序
        if (target == sprite2)
        {
            sprite1->setZOrder(100);
        }
        else if(target == sprite1)
        {
            sprite1->setZOrder(0);
        }
    };

```

### 将事件监听器添加到事件分发器中

```c++
    //添加事件监听器
    _eventDispatcher->addEventListenerWithSceneGraphPriority(listener1, sprite1);
    _eventDispatcher->addEventListenerWithSceneGraphPriority(listener1->clone(), sprite2);
    _eventDispatcher->addEventListenerWithSceneGraphPriority(listener1->clone(), sprite3);

```

**_eventDispatcher** 是一个 **Node** 的属性. 你可以使用它管理当前节点（Node）的所有事件的分发（这些节点可以是 Scene,Layer,Sprite 等）。

*注意:* 在上面的例子中, 我们在第二和第三个调用 `addEventListenerWithSceneGraphPriority` 使用 `clone()` 方法。这是因为每一个事件监听器只能被添加一次。`addEventListenerWithSceneGraphPriority` 和 `addEventListenerWithFixedPriority` 方法在事件监听器中设置了一个注册标志，如果注册标志已经被设置了，就不能再次添加了。

还有一点是需要记住的: 如果你给一个节点添加 _fixed priority_ 监听器, 当这个节点被移除了之后，你需要手动移除这个。然而，这种情况对于 _scene graph priority_ 监听器来说，它是和节点捆绑的，当一个节点的析构函数被调用的时候，监听器会自动移除。

### 新的触摸机制

上面的过程和2.x版本的事件机制相比似乎看起来更加的复杂。在老版本中， 你需要继承一个委托（ delegate ）类，它定义了 `onTouchBegan()` 方法等。你的事件处理代码将会进入到这些委托方法。

新的事件机制从 delegate 中移除了事件处理逻辑，将这些逻辑移到了监听器中。但是，上面的逻辑实现了下方的方法：
1. 通过使用一个事件监听器, sprite 可以通过 *SceneGraphPriority* 被添加到事件分发器。当点击一个 sprite 按钮，相同绘制等级的回调函数将会被调用（换句话说，最表面的 sprite 将最先得到触摸事件）。
2. 处理事件逻辑的时候，当被触摸时根据每种情况采取相应的处理逻辑来显示点击效果（例如识别点击区域，为被点击的元素设置不同的透明度）。
3. 当 `listener1->setSwallowTouches(true)` 被设置的时候，将根据 onTouchBegan 的返回值, 决定触摸事件的显示顺序是否应该被向后传递。

### FixedPriority vs SceneGraphPriority

- **FixedPriority** 是一个 int 值. 带有更小的 `Priority` 值事件监听器将先处理事件，更大的 `Priority` 值的将后处理。
- **SceneGraphPriority** 是一个指向 `Node` 的指针. 拥有更高的 Z order 值的节点的监听器将比低 Z order 值的先接收到事件。（话句话说，Z order 越大就是被绘制在越表面）。这保证了触摸事件可以从前向后传递。

##其他事件分发处理模块

除了触摸事件响应，下面的模块也使用了相同事件处理方法。

###按键事件(Keyboard events)

除了键盘，它也可以是每一个有菜单的设备，他们可以使用相同的监听器来处理事件。

在上方的触摸事件中，我们使用了 lamdba 表达式设置回调函数。你也可以通过 `CC_CALLBACK_N` 宏来绑定已经存在的回调函数。如下：

```c++
    //初始化并绑定 
    auto listener = EventListenerKeyboard::create();
    listener->onKeyPressed = CC_CALLBACK_2(KeyboardTest::onKeyPressed, this);
    listener->onKeyReleased = CC_CALLBACK_2(KeyboardTest::onKeyReleased, this);
    
    _eventDispatcher->addEventListenerWithSceneGraphPriority(listener, this);

    // 按键事件回调方法的实现原型
    void KeyboardTest::onKeyPressed(EventKeyboard::KeyCode keyCode, Event* event)
    {
        log("Key with keycode %d pressed", keyCode);
    }
    
    void KeyboardTest::onKeyReleased(EventKeyboard::KeyCode keyCode, Event* event)
    {
        log("Key with keycode %d released", keyCode);
    }   

```  

### 加速计事件（Accelerometer events）

在使用加速计事件之前，你必须先在设备上将他们开启：

`Device::setAccelerometerEnabled(true);`
 
然后创建相应的监听器。

```c++
    auto listener = EventListenerAcceleration::create(CC_CALLBACK_2(AccelerometerTest::onAcceleration, this));
    _eventDispatcher->addEventListenerWithSceneGraphPriority(listener, this);

    // 加速计事件回调方法的实现原型
    void AccelerometerTest::onAcceleration(Acceleration* acc, Event* event)
    {
        //  逻辑处理代码 
    }
```
### 鼠标事件（Mouse events）

鼠标点击事件的分发已经被添加到3.0版本了。它可以跨平台，并且丰富了游戏的用户体验。

如同所有的事件类型，首先我们需要创建事件监听器：

```c++
    _mouseListener = EventListenerMouse::create();
    _mouseListener->onMouseMove = CC_CALLBACK_1(MouseTest::onMouseMove, this);
    _mouseListener->onMouseUp = CC_CALLBACK_1(MouseTest::onMouseUp, this);
    _mouseListener->onMouseDown = CC_CALLBACK_1(MouseTest::onMouseDown, this);
    _mouseListener->onMouseScroll = CC_CALLBACK_1(MouseTest::onMouseScroll, this);

    _eventDispatcher->addEventListenerWithSceneGraphPriority(_mouseListener, this);
```

然后一个接一个地实现每一个回调方法并绑定到监听器：

```c++
void MouseTest::onMouseDown(Event *event)
{
    EventMouse* e = (EventMouse*)event;
    string str = "Mouse Down detected, Key: ";
    str += tostr(e->getMouseButton());
    // ...
}

void MouseTest::onMouseUp(Event *event)
{
    EventMouse* e = (EventMouse*)event;
    string str = "Mouse Up detected, Key: ";
    str += tostr(e->getMouseButton());
    // ...
}

void MouseTest::onMouseMove(Event *event)
{
    EventMouse* e = (EventMouse*)event;
    string str = "MousePosition X:";
    str = str + tostr(e->getCursorX()) + " Y:" + tostr(e->getCursorY());
    // ...
}

void MouseTest::onMouseScroll(Event *event)
{
    EventMouse* e = (EventMouse*)event;
    string str = "Mouse Scroll detected, X: ";
    str = str + tostr(e->getScrollX()) + " Y: " + tostr(e->getScrollY());
    // ...
}

```

### 自定义事件（Custom Event）

上面的事件类型是系统已经定义了的，而且事件（例如触摸屏幕，按键响应）是由系统自动触发的。另外，你可以制作你自己的 _custom events_ ，它们可以不由系统触发，但是必须通过你的代码，如下：

```c++
    _listener = EventListenerCustom::create("game_custom_event1", [=](EventCustom* event){
        std::string str("Custom event 1 received, ");
        char* buf = static_cast<char*>(event->getUserData());
        str += buf;
        str += " times";
        statusLabel->setString(str.c_str());
    });

    _eventDispatcher->addEventListenerWithFixedPriority(_listener, 1);

```

上面自定义了一个事件监听器，并且带有一个响应方法。它被添加到了事件分发器里。那如何处理事件触发呢，往下看：

```c++
    static int count = 0;
    ++count;
    char* buf = new char[10];
    sprintf(buf, "%d", count);
    EventCustom event("game_custom_event1");
    event.setUserData(buf);
    _eventDispatcher->dispatchEvent(&event);
    CC_SAFE_DELETE_ARRAY(buf);
        
```

上面的例子创建了一个 `EventCustom` 对象，并且设置了他的 UserData。之后，它被 `_eventDispatcher->dispatchEvent(&event);` 手动的分发。它将触发之前定义好的事件处理方法。

###移除事件监听器

一个已经添加的监听器可以通过下方的方法移除：

```c++
    _eventDispatcher->removeEventListener(listener);

```

使用下方的代码移除事件分发器的所有监听器：

```c++
    _eventDispatcher->removeAllEventListeners();

```

当使用 `removeAll` 的时候，这个节点的所有监听器都会被移除。推荐的做法是移除指定的监听器。

注意：在使用 `removeAll` 之后，菜单将不会响应，因为它也需要接受触摸事件。