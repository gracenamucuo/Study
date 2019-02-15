//
//  Note.m
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//
//概念   应用  原理

//琐碎知识点
//Category和Extension

//====================Category 运行期添加到类中
Category 是表示一个指向分类的结构体的指针，其定义如下：
typedef struct objc_category *Category;
struct objc_category {
    char *category_name                          OBJC2_UNAVAILABLE; // 分类名
    char *class_name                             OBJC2_UNAVAILABLE; // 分类所属的类名
    struct objc_method_list *instance_methods    OBJC2_UNAVAILABLE; // 实例方法列表
    struct objc_method_list *class_methods       OBJC2_UNAVAILABLE; // 类方法列表
    struct objc_protocol_list *protocols         OBJC2_UNAVAILABLE; // 分类所实现的协议列表
}
结构体主要包含了分类定义的实例方法与类方法，其中instance_methods 列表是 objc_class 中方法列表的一个子集，而class_methods列表是元类方法列表的一个子集。
可以在分类中声明和实现实例方法和类方法，如果想实现属性的话，需要runtime手动绑定。但是依然不会生成实例变量。
如果分类中有和原有类同名的方法, 会优先调用分类中的方法, 就是说会忽略原有类的方法。所以同名方法调用的优先级为 分类 > 本类 > 父类
如果多个分类中都有和原有类中同名的方法, 那么调用该方法的时候执行谁由编译器决定；编译器会执行最后一个参与编译的分类中的方法。
1:在类的+load方法调用的时候，我们可以调用category中声明的方法;因为附加category到类的工作会先于+load方法的执行.
2:类和分类中的+load方法，调用顺序是+load的执行顺序是先类，后category，而category的+load执行顺序是根据编译顺序决定的。虽然对于+load的执行顺序是这样，但是对于“覆盖”掉的方法，则会先找到最后一个编译的category里的对应方法

//匿名类别 编译期添加到类中，
匿名类别可以声明属性，方法，和实例变量，但都是私有的。
Extension一般用来隐藏类的私有消息，你必须有一个类的源码才能添加一个类的Extension，所以对于系统一些类，如NSString，就无法添加.。
类扩展伴随着类的产生而产生，也随着类的消失而消失。
extension可以添加实例变量，category不可以，因为在运行期对象的内存布局已经确定，添加实例变量会破坏类的内部布局。
//=====================atomic====只能保证getter方法能够返回一个完整的value  属性是数组的时候，在多线程中对数组元素进行添加，取值操作，可能会崩溃
属性中不声明atomic默认就是atomic
atomic系统自动生成的getter/setter方法会进行加锁操作【这个锁仅仅保证了getter和setter存取方法的线程安全.】eg：
如果线程 A 调了 getter，与此同时线程 B 、线程 C 都调了 setter——那最后线程 A get 到的值，3种都有可能：可能是 B、C set 之前原始的值，也可能是 B set 的值，也可能是 C set 的值。同时，最终这个属性的值，可能是 B set 的值，也有可能是 C set 的值。
- (void)setCurrentImage:(UIImage *)currentImage
{
    @synchronized(self) {
        if (_currentImage != currentImage) {
            [_currentImage release];
            _currentImage = [currentImage retain];
            
        }
    }
}

- (UIImage *)currentImage
{
    @synchronized(self) {
        return _currentImage;
    }
}


nonatomic系统自动生成的getter/setter方法不会进行加锁操作
- (void)setCurrentImage:(UIImage *)currentImage
{
    if (_currentImage != currentImage) {
        [_currentImage release];
        _currentImage = [currentImage retain];
        
    }
}
- (UIImage *)currentImage
{
    return _currentImage;
}
❓❓❓❓❓❓//=========================================weak关键字================ http://ios.jobbole.com/89012/
1：弱引用，在对象释放后置为 nil，避免错误的内存访问
2:assign修饰的对象，当对象释放后，指针不会自动置为nil,再访问该指针的话，会崩溃。
eg:weak单例
+ (id)sharedInstance
{
    static __weak ASingletonClass *instance;
    ASingletonClass *strongInstance = instance;
    @synchronized(self) {
        if (strongInstance == nil) {
            strongInstance = [[[self class] alloc] init];
            instance = strongInstance;
        }
    }
    return strongInstance;
}
如果所有引用该单例的对象释放后，该单例也自动销毁。

Runtime维护了一个weak表，用于存储指向某个对象的所有weak指针。weak表其实是一个hash（哈希）表，Key是所指对象的地址，Value是weak指针的地址（这个地址的值是所指对象的地址）数组。
weak 的实现原理可以概括一下三步：
1、初始化时：runtime会调用objc_initWeak函数，初始化一个新的weak指针指向对象的地址。
2、添加引用时：objc_initWeak函数会调用 objc_storeWeak() 函数， objc_storeWeak() 的作用是更新指针指向，创建对应的弱引用表。
3、释放时，调用clearDeallocating函数。clearDeallocating函数首先根据对象地址获取所有weak指针地址的数组，然后遍历这个数组把其中的数据设为nil，最后把这个entry从weak表中删除，最后清理对象的记录。
weak会在当前runloop结束的时候被释放
如果没有strong的话
__weak修饰
获取存储weak对象的map，这个map的key是对象的地址，value是weak引用的地址。
当对象被释放的时候，根据对象的地址可以找到对应的weak引用的地址，将其置为nil即可。


//=================================关联对象================================
概念
关联策略 关联属性为block时是copy
key的几种表示
应用
分类与关联对象是OC的扩展机制的两个特性:分类用来扩展方法，关联对象用来扩展属性。
给UIButton关联对象  关联方法 能够埋点
有时候我们在分类中使用NSNotificationCenter或者KVO，推荐使用关联的对象作为观察者，尽量避免对象观察自身❓
原理
关键的几个类:
AssociationsManager
AssociationsHashMap
ObjectAssociationMap
ObjcAssociation
AssociationsManager持有一个AssociationsHashMap,hashmap以被关联对象(被包装)为key,以ObjectAssociationMap类型为value(map里存有该被关联对象上所有的关联对象)。objectAssociationMap是以设置关联对象的key为key。以policy和value封装成的ObjcAssociation类型作为value。
关联对象并不是存储在被关联对象本身内存中，而是存储在全局的统一的一个AssociationsManager中，如果设置关联对象为nil，就相当于是移除关联对象。
当被关联对象销毁的时候，其上的所有关联对象都会被销毁。不需要手动将所有关联对象置为nil
//========================属性@property=====================================================
动态生成属性的getter和setter方法的话，使用@dynamic,而且需要手动声明实例变量成员。
如果setter和getter方法都重写了，则需要手动写出合成@synthesize nameStr = _nameStr;否则，编译器没有声明对应的实例变量。
不可变对象属性修饰符使用copy，可变对象属性修饰符使用strong
//========KVC=====================
valueForKey:
1:访问器匹配:先寻找与key，isKey，getKey(还有_key)同名的方法，返回值为对象类型。
2:实例变量匹配:寻找与key,_key,isKey,_isKey同名的实例变量。
setValueForKey:
1:存取器匹配:先寻找与setKey同名的方法，且参数是一个对象类型。
2:实例变量匹配:寻找与key，_isKey,_key,isKey同名的实例变量，直接赋值。
//=========KVO====================
苹果使用了一种isa交换的技术，当objectA被观察后，objectA对象的isa指针被指向了一个新建的ASClassA的子类NSKVONotifying_ASClassA，且这个子类重写了被观察值的setter方法和class方法【重写了这个方法，是为了将得到的class类型还是原来的类，隐藏运行时生成的NSKVONotifying类。】，dealloc和_isKVO方法，然后使objectA对象的isa指针指向这个新建的类，然后事实上objectA变为了NSKVONotifying_ASClassA的实例对象，执行方法要从这个类的方法列表里找。(同时苹果警告我们，通过isa获取类的类型是不可靠的，通过class方法总是能得到正确的类).
NSKVONotifying_ASClassA作为子类重写了setage方法:1、调用willChangeValueForKey 2、调用父类的setter方法，进行赋值 3、调用didChangeValueForKey 该方法会调用监听器的监听方法，最终执行监听者的observeValueForKeyPath方法。
手动触发KVO
手动调用 willChangeValeuForKey 和 didChangeValeuForKey就可以 两者必须调。
可以在重写didChangeValeuForKey方法中调用[super didChangeValeuForKey:@""]之前(这时新值已经赋值成功，在这里做判断条件可以不触发kvo)
//=========OC对象======
 NSObjcet实际上是只有一个名为isa的指针的结构体，因此占用一个指针变量所占用的内存空间大小，如果64bit占用8个字节，如果32bit占用4个字节。
一个自定对象的内存大小是isa指针的内存加上该类的实例变量的内存。
class_getInstanceSize([m class])//可以获得一个实例的内存大小
instance 实例对象 里存储isa和实例变量的值 isa ☞ class
class 类对象 每一种类只有一个类对象    存放isa，superclass,属性信息，对象方法信息，协议信息，成员变量信息 isa ☞ meta-class
meta-class 元类对象 每个类在内存中也只要一个元类对象 存放isa,superclass,类方法信息等  isa ☞ root-meta-class ;root-meta-class 指向自己
//=========Class==========
struct objc_class : objc_object {
    // Class ISA;
    Class superclass;
    cache_t cache;             // formerly cache pointer and vtable
    class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
    
    class_rw_t *data() {
        return bits.data();
    }
    void setData(class_rw_t *newData) {
        bits.setData(newData);
    }
    
    void setInfo(uint32_t set) {
        assert(isFuture()  ||  isRealized());
        data()->setFlags(set);
    }
    
    void clearInfo(uint32_t clear) {
        assert(isFuture()  ||  isRealized());
        data()->clearFlags(clear);
    }
//----------- class_rw_t
    struct class_rw_t {
        // Be warned that Symbolication knows the layout of this structure.
        uint32_t flags;
        uint32_t version;
        
        const class_ro_t *ro;
        
        method_array_t methods;
        property_array_t properties;
        protocol_array_t protocols;
        
        Class firstSubclass;
        Class nextSiblingClass;
//------------ class_ro_t
        struct class_ro_t {
            uint32_t flags;
            uint32_t instanceStart;
            uint32_t instanceSize;
#ifdef __LP64__
            uint32_t reserved;
#endif
            
            const uint8_t * ivarLayout;
            
            const char * name;
            method_list_t * baseMethodList;
            protocol_list_t * baseProtocols;
            const ivar_list_t * ivars;
            
            const uint8_t * weakIvarLayout;
            property_list_t *baseProperties;
            
            method_list_t *baseMethods() const {
                return baseMethodList;
            }
        };
//=========方法的调用=======
1:对象调用实例方法时，通过isa指针找到类对象，在类对象的方法列表中找到对应的方法进行执行。 【如果每一个对象都保存了自己能执行的方法，那么对内存的占用有极大的影响】
2:当类调用类方法时候，通过其isa指针找到meta-class对象，在其中找到类方法的实现进行调用。
3:对象调用父类的实例方法时,通过isa找到自己的类对象，再通过其中的superclass指针找到父类类对象，然后找到对象方法实现进行调用。如果到父类里还没有找到，就进行继续往上找，直到找到NSObject的类对象。
//======autoreleasepool======
什么对象被添加到自动释放池？
在ARC环境下，以alloc/new/copy/mutableCopy开头的方法返回值取得的对象是自己生成并且持有的，其他情况是非自己持有的对象，会自动加入到autoreleasepoo【 NSString *str = [NSString stringWithFormat:@"%d",i]】此时对象的持有者就是AutoreleasePool。
自动释放池释放的时机？
没有手动加AutoreleasePool的情况下，Autorelease对象是在当前的Runloop迭代结束的时候释放的。手动添加的Autorelease对象也是自动计数的，当引用计数为0的时候，被释放掉。
        runloop中有关autorelease的两个回调是1:即将进入loop，_wrapRunLoopWithAutoreleasePoolHandler回调会_objc_autoreleasePoolPush() 创建自动释放池。2:BeforeWaiting(准备进入休眠) 时调用_objc_autoreleasePoolPop() 和 _objc_autoreleasePoolPush() 释放旧的池并创建新池；Exit(即将退出Loop) 时调用 _objc_autoreleasePoolPop() 来释放自动释放池。
自动释放池的定义？
自动释放池是由autoreleasePoolPage类型的对象以双向链表的方式实现
当对象调用autorelease方法时，会将对象加入autoreleasePoolPage的栈中。当当前page满后，会创建新的page
调用autoreleasePoolPage::pop方法会向栈中的对象发送release消息释放。
//=======内存管理=======
自己生成的对象，自己持有 alloc/new/copy/mutableCopy等方法
非自己生成的对象，自己也可以持有
不再需要自己持有的对象时释放
非自己持有的对象无法释放

ARC中通过SideTable这个数据结构来存储引用计数。这个数据结构就是存储了一个自旋锁，一个引用计数map。这个引用计数的map以对象的地址作为key，引用计数作为value
release:查找map，对引用计数减1，如果引用计数小于阈值，则调用SEL_dealloc

深浅拷贝:1：源对象是否是可变的。2:调用的是mutablecopy还是copy方法
        属性声明的属性             所有权修饰符
        assign                  __unsafe_unretained修饰符
        copy                    __strong （赋值时是副本）
        retain                  __strong
        strong                  __strong
        unsafe_unretained       __unsafe_unretained
        weak                    __weak

内存泄漏的几种情况:
1：循环引用
2：使用单例
使用单例时候可能会造成内存泄漏。特别是单例含有block回调方法时候。有些单例会强持有这些block
self.obser = [[NSNotificationCenter defaultCenter] addObserverForName:@"boyce" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    self.name = @"boyce";
}];
- (void)dealloc{
            [[NSNotificationCenter defaultCenter] removeObserver:self.obser];
}
这里就造成了内存泄漏，这是因为NSNotificationCenter强引用了usingBlock，而usingBlock强引用了self，而NSNotificationCenter是个单例不会被释放，而self在被释放的时候才会去把self.obser从NSNotificationCenter中移除。类似的情况还有很多，比如一个数组中对象等等。这些内存泄漏不容易发现
3：NSTimer
NSTimer会强引用传入的target，这时候如果加入NSRunLoop这个timer又会被NSRunLoop强引用.
解决这个方法主动stoptimer，至少是不能在dealloc中stoptimer的。另外可以设置一个中间类，把target变成中间类
//=======Block======
        __weak typeSelf(self) weakSelf = self;//block会捕获外部变量，用weakSelf保证self不会被block捕获，防止引起循环引用或者不必要的额外生命周期
        [object doSomething:^{
            __strong typeSelf(weakSelf) strongSelf = weakSelf;
            //用strongSelf则保证在block的执行过程中，对象不会被释放掉。
        }];

//=======图像相关=====
        sRGB：这个是目前比较通用的全色彩图像色域，每个像素占 4 个字节
        Wide：每个像素占 8 个字节，相比 sRGB 能表示的颜色更多
        还有占内存更小的格式：
        亮度和 alpha 8 格式：每像素 2 个字节，单色图像和 alpha，metal 着色器。
        Alpha 8 格式：每个像素 1 个字节，用于单色图像，比 SRGB 小 75％

//=========埋点========
1：页面统计，页面停留时间，页面进入次数
2:交互事件统计，包括单击，双击，手势交互
运用runtime hook要埋点的方法，交换方法后，在其中注入自己的统计逻辑。同时用plist文件来配置不同统计事件的id，进一步可以同时单元测试id和事件是否匹配或遗漏。
//======内省方法====
内省是对象揭示自己作为一个运行时对象的详细信息的一种能力。这些详细信息包括对象在继承树上的位置，对象是否遵循特定的协议，以及是否可以响应特定的消息。
-(BOOL) isKindOfClass: 判断是否是这个类或者这个类的子类的实例
-(BOOL) isMemberOfClass: 判断是否是这个类的实例

-(BOOL) respondsToSelector:  需要实现该方法才能够真正返回YES  实例调该方法，就是判断有没有该实例方法，类调该方法 就是判断有没有该类方法
+(BOOL) instancesRespondToSelector: 判断该类的实例是否有这个方法 还是检查的实例方法
conformsToProtocol:protocol检测是否遵循某个协议
class 实例对象调用的话，返回类对象，类调用的话，返回自身
objc_getClass 相当于isa指针指向
//===========反射==========
运行时选择创建哪个实例，并动态选择调用哪个方法。
通过class方法获得Class对象
反射方法:
        // SEL和字符串转换
        FOUNDATION_EXPORT NSString *NSStringFromSelector(SEL aSelector);
        FOUNDATION_EXPORT SEL NSSelectorFromString(NSString *aSelectorName);
        // Class和字符串转换
        FOUNDATION_EXPORT NSString *NSStringFromClass(Class aClass);
        FOUNDATION_EXPORT Class __nullable NSClassFromString(NSString *aClassName);
        // Protocol和字符串转换
        FOUNDATION_EXPORT NSString *NSStringFromProtocol(Protocol *proto) NS_AVAILABLE(10_5, 2_0);
        FOUNDATION_EXPORT Protocol * __nullable NSProtocolFromString(NSString *namestr) NS_AVAILABLE(10_5, 2_0);
通过这些方法，我们可以在运行时选择创建那个实例，并动态选择调用哪个方法。这些操作甚至可以由服务器传回来的参数来控制，我们可以将服务器传回来的类名和方法名，实例为我们的对象。
//======class_rw_t 和 class_ro_t=============
class_rw_t作为objc_class结构体的成员 里边存储类的方法，协议 属性列表 class_rw_t也是结构体，方法成员中含有结构体class_ro_t 里边含有实例变量，class_ro_t 中存储了当前类在编译期就已经确定的属性、方法以及遵循的协议。
//==========AppDelegate解耦=========
1：可以通过分类来扩展进行，将不同的功能或业务代码分开到不同的分类中。
2：可以单独建一个manager类，将不同的业务功能的初始化或配置代码都放在manager类里，之后在appdelegate里直接调用这个manager类的不同方法。进行不同业务的初始化或配置。【可以选择用命令模式】
3：生成不同的appdelegate的子类，不同的功能作为单独的一个类，实现自己需要实现的方法，最后将不同的子类组合起来一个组合类，在appdelegate里通过组合类来实现各个不同功能的类的调用。比上个方法更灵活。
//===========ViewController控制器解耦==============
//===========优化app启动===================
启动过程:Dyld-->Load Dylibs -->Rebase-->Bind-->Objc-->Initializers
加载dyld(dyld的全称是dynamic loader，它的作用是加载一个进程所需要的image)到app进程。
加载动态库(包括所依赖的所有动态库)
Rebase
Bind
初始化Objective-C Runtime
其他的初始化

冷启动&热启动
冷启动:App被kill掉以后一切从头开始启动的过程
热启动:按下home键的时候，iOS APP还存存在一段时间，这时点击APP马上就能恢复到原状态，这种启动我们称为热启动。
以main函数作为分水岭，启动时间其实包括了两部分: main函数之前和main函数到第一个界面的viewDidAppear:
优化的核心思路：能延迟初始化的尽量延迟初始化，不能延迟初始化的尽量放到后台初始化。【第三个SDK的初始化：分享，支付，统计等的初始化可以放在第一次用的时候】
main函数之前的优化：1：减少动态库的数量(可以把类似功能的动态库合并)2：合并类似功能的Category，删除无用的方法和类。
        
//======crash监控以及统计上报=====
系统杀死
EXC_CRASH (SIGKILL)，SIGKILL 一般代表的是系统终止了进程的运行，这种信号无法被应用捕获
常见的内存错误包含：过度释放、野指针（访问已释放对象）、内存访问越界（比如 C 数组）
EXC_BAD_ACCESS(SIGSEGV) 对只读的内存地址进行写操作; 访问不存在的内存地址 objc_msgSend 或者 retain/release 崩溃
数组相关
EXC_CRASH (SIGABRT)数组插入nil
方法没有实现
unrecognized selector 通过runtime重载NSObject的- (id)forwardingTargetForSelector:(SEL)aSelector方法，给类进入消息转发的方法增加后备接受者。
KVO
移除没有注册的观察者，重复移除
Cannot remove an observer <ViewController 0x100e09c90> for the key path "name" from <TestKVOCrash 0x280e035e0> because it is not registered as an observer
