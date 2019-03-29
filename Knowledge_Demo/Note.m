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
1:生成原子操作的getter和setter。，atomic只能保证代码进入getter或者setter函数内部时是安全的，一旦出了getter和setter，多线程安全只能靠程序员自己保障了。
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
动态生成属性的getter和setter方法的话，使用@dynamic,而且需要手动声明实例变量成员。例如:
//@interface Student : NSObject
//{
//    NSString *_sex;
//}


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
//=======iOS编译======
    iOS编译 预处理 ：头文件引入 宏替换 编译指令处理 注释删除
    词法分析 token
    语法分析 AST
    codegen 生成中间代码IR
    汇编 生成汇编代码
    汇编器以汇编代码输入 将其转换为机器码 最后输出目标文件
    链接把编译产生的.o文件和其他相关文件生成mach-o文件
    
    增量编译 因为XCode会对每一个Task生成一个哈希值，只有哈希值改变的时候才会重新编译。
//=======iOS签名======
sender  receiver
对称加密:加密和解密使用的秘钥是同一个秘钥。
非对称加密：加密和解密使用的秘钥不是同一个秘钥，分为公钥和私钥两个秘钥，公钥加密的数据，需要私钥来解密，私钥加密的数据，需要公钥来解密。
发送方自己生成一对秘钥，公钥和私钥，把公钥给到接收方。要给接受放发送数据时。sender通过摘要算法生成一段摘要，然后通过自己的私钥进行加密(成为签名), 这样数据和签名一起发给接收方，接收方收到数据后，通过摘要算法对数据进行摘要，通过公钥对摘要进行解密，比较两份摘要是否相同，如果相同则说明数据安全。
    保证公钥安全通过CA颁发的数字证书来解决【数字证书包含:签发者，申请方的公钥，申请方使用的hash算法，证书的数字签名，到期时间等】
iOS App签名能够让iOS识别出是谁签名了App，并且签名后App没有被篡改过
http://blog.cnbang.net/tech/3386/
1：Mac上生成一对公私钥，公钥L【从 keychain 里的 “从证书颁发机构请求证书”，这里就本地生成了一对公私钥，保存的 CertificateSigningRequest 就是公钥，私钥保存在本地电脑里】
2：苹果自己有固定的一对公私钥，私钥在苹果后台，公钥在每个iOS设备上公钥A【苹果处理】
3：把公钥L(CSR文件)传到苹果后台，用苹果后台里的私钥A去签名公钥L，得到包含公钥L以及签名的证书下载到本地【目前本地有两个证书，一个是生成CSR文件的时候生成的，一个是这一步下载的，keychain把这两个证书关联起来，因为两个证书的公私钥匙对应的，Xcode在选择下载回来的证书的时候，实际上会找到keychain里对应的私钥去签名，私钥只有生成它的mac有，如果别的mac想要的话，需要从keychain里导出私钥，就会存成.p12文件，其他mac也就有了私钥】
4：在苹果后台开发者网站上申请AppID，配置好ID列表和APP可使用的权限，再加上第三部的证书，组成的数据用私钥A签名，把数据和签名一起组成一个provisioning profile文件(配置文件)，下载到mac上（现在配置文件Xcode来自动管理了）
5：编译完一个APP后，用本地的私钥L对app进行签名，同时把第四步的配置文件打包进APP 文件名为embedded.mobileprovision，把APP安装到手机上
6：安装时，iOS系统取得证书，通过系统内置的公钥A，去验证embedded.mobileprovision的数字签名是否正确，也会验证里边的证书签名。
7：知道embedded.mobileprovision是苹果授权的后，取出里边的数据，做各种验证，包括用公钥L验证APP签名，验证设备ID是否在ID列表上，权限开关是否跟APP里的Entitlements对应等。
【概念】
    证书：内容是公钥或私钥，由其他机构对其签名组成的数据包。
    Entitlements：包含了 App 权限开关列表。
    CertificateSigningRequest：本地公钥。
    p12：本地私钥，可以导入到其他电脑。
    Provisioning Profile：包含了 证书 / Entitlements 等数据，并由苹果后台私钥签名的数据包
//=========https=======
客户端                                                             服务器
C        客户端向服务器发起安全请求--->                                  S
C        <---服务器发送数字证书(包含服务器的public key)                   S
C        浏览器用预置的CA列表验证证书，如果有问题，则提示风险
C         浏览器生成随机的对称密钥，用服务器的public key加密----->          S
            服务器用自己的private key进行解密，得到对称密钥                S
C          <----双方都知道了对称密钥，用来加密通信-->                      S
//========wkwebView=====
//======runloop==========
1:定时器不带[NSTimer timerWithTimeInterval:]方法需要加入到common的modes 避免滑动的时候定时器失效
2：imageView设置图片的时候需要将其加在[self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"1"] afterDelay:2.0 inModes:@[NSRunLoopCommonModes]];当对象执行performSelector时需要清楚当前的runloop的mode
runloop与线程的关系
每条线程都有唯一的一个与之对应的RunLoop对象
RunLoop保存在一个全局的Dictionary里，线程作为key,RunLoop作为value
主线程的RunLoop已经自动创建好了，子线程的RunLoop需要主动创建
RunLoop在第一次获取时创建，在线程结束时销毁
        
        static void __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__();
        static void __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__();
        static void __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__();
        static void __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__();
        static void __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__();
        static void __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__();
        
        1:Observer事件，runloop中状态变化时进行通知。（微信卡顿监控就是利用这个事件通知来记录下最近一次main runloop活动时间，在另一个check线程中用定时器检测当前时间距离最后一次活动时间过久来判断在主线程中的处理逻辑耗时和卡主线程）。这里还需要特别注意，CAAnimation是由RunloopObserver触发回调来重绘，接下来会讲到。
        
        2:Block事件，非延迟的NSObject PerformSelector立即调用，dispatch_after立即调用，block回调。
        
        3:Main_Dispatch_Queue事件：GCD中dispatch到main queue的block会被dispatch到main loop执行。
        
        4:Timer事件：延迟的NSObject PerformSelector，延迟的dispatch_after，timer事件。
        
        5:Source0事件：处理如UIEvent，CFSocket这类事件。需要手动触发。触摸事件其实是Source1接收系统事件后在回调 __IOHIDEventSystemClientQueueCallback() 内触发的 Source0，Source0 再触发的 _UIApplicationHandleEventQueue()。source0一定是要唤醒runloop及时响应并执行的，如果runloop此时在休眠等待系统的 mach_msg事件，那么就会通过source1来唤醒runloop执行。
        
        6:Source1事件：处理系统内核的mach_msg事件。（推测CADisplayLink也是这里触发）。
        
        伪代码
        SetupThisRunLoopRunTimeoutTimer(); // by GCD timer
        //通知即将进入runloop__CFRUNLLOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__(KCFRunLoopEntry);
        do {
            __CFRunLoopDoObservers(kCFRunLoopBeforeTimers);
            __CFRunLoopDoObservers(kCFRunLoopBeforeSources);
            
            __CFRunLoopDoBlocks();  //一个循环中会调用两次，确保非延迟的NSObject PerformSelector调用和非延迟的dispatch_after调用在当前runloop执行。还有回调block
            __CFRunLoopDoSource0(); //例如UIKit处理的UIEvent事件
            
            CheckIfExistMessagesInMainDispatchQueue(); //GCD dispatch main queue
            
            __CFRunLoopDoObservers(kCFRunLoopBeforeWaiting); //即将进入休眠，会重绘一次界面
            var wakeUpPort = SleepAndWaitForWakingUpPorts();
            // mach_msg_trap，陷入内核等待匹配的内核mach_msg事件
            // Zzz...
            // Received mach_msg, wake up
            __CFRunLoopDoObservers(kCFRunLoopAfterWaiting);
            // Handle msgs
            if (wakeUpPort == timerPort) {
                __CFRunLoopDoTimers();
            } else if (wakeUpPort == mainDispatchQueuePort) {
                //GCD当调用dispatch_async(dispatch_get_main_queue(),block)时，libDispatch会向主线程的runloop发送mach_msg消息唤醒runloop，并在这里执行。这里仅限于执行dispatch到主线程的任务，dispatch到其他线程的仍然是libDispatch来处理。
                __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__()
            } else {
                __CFRunLoopDoSource1();  //CADisplayLink是source1的mach_msg触发？
            }
            __CFRunLoopDoBlocks();
        } while (!stop && !timeout);
        
        //通知observers，即将退出runloop
        __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBERVER_CALLBACK_FUNCTION__(CFRunLoopExit);
        
        https://mp.weixin.qq.com/s?__biz=MzAwNDY1ODY2OQ==&mid=400417748&idx=1&sn=0c5f6747dd192c5a0eea32bb4650c160&3rd=MzA3MDU4NTYzMw==&scene=6#rd
//======性能优化=================
//=========多线程和锁==========
https://www.jianshu.com/p/938d68ed832c
一段代码段在同一个时间只能允许被一个线程访问，比如一个线程A进入加锁代码之后由于已经加锁，另一个线程B就无法访问，只有等待前一个线程A执行完加锁代码后解锁，B线程才能访问加锁代码。
原子性能保证代码串行的执行，能保证代码执行到一半的时候，不会有另一个线程介入。
@synchronized(token)
NSLock
dispatch_semaphore_t
OSSpinLock
这几种锁都可以带来原子性，性能的损耗从上至下依次更小。
除了用锁来保证操作原子性外，还可以Atomic Operations 但是只能应用于32位或者64位的数据类型
递归锁NSRecursiveLock
有时候“加锁代码”中存在递归调用，递归开始前加锁，递归调用开始后会重复执行此方法以至于反复执行加锁代码最终造成死锁，这个时候可以使用递归锁来解决

线程间通信
// 返回主线程
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
// 返回指定线程
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;
/*
 OSSpinLock:                           46.15 ms
 dispatch_semaphore:           56.50 ms
 pthread_mutex:                     178.28 ms
 NSCondition:                          193.38 ms
 NSLock:                                   175.02 ms
 pthread_mutex(recursive):   172.56 ms
 NSRecursiveLock:                   157.44 ms
 NSConditionLock:                   490.04 ms
 @synchronized:                       371.17 ms
 
 */
//=============通知中心 NSNotificationCenter=====
通知中心对响应者observer是使用unsafe_unretained修饰，当响应者释放会出现野指针，向野指针发送消息造成崩溃；
在 iOS9 系统之后，[NSNotificationCenter defaultCenter]会在响应者observer调用-dealloc方法的时候执行-removeObserver:方法。
添加通知时，若指定了object参数，那么该响应者只会接收发送通知时object参数指定为同一实例的通知。
通知发送线程和通知接收线程是一致的。
//============响应链============
    
        手势识别器与UIResponder对于事件响应的联系：
        Window先将绑定了触摸对象的事件传递给触摸对象上绑定的手势识别器，再发送给触摸对象对应的hit-tested view。
        手势识别器识别手势期间，若触摸对象的触摸状态发生变化，事件都是先发送给手势识别器再发送给hit-test view。
        手势识别器若成功识别了手势，则通知Application取消hit-tested view对于事件的响应，并停止向hit-tested view发送事件；
        若手势识别器未能识别手势，而此时触摸并未结束，则停止向手势识别器发送事件，仅向hit-test view发送事件。
        若手势识别器未能识别手势，且此时触摸已经结束，则向hit-tested view发送end状态的touch事件以停止对事件的响应。
手势识别器比响应链具有更高的事件响应优先级。
UIControl会阻止父视图上的手势识别器行为，也就是UIControl处理事件的优先级比UIGestureRecognizer高，但前提是相比于父视图上的手势识别器。
        【事件的传递:从收指点击屏幕，系统将点击包装成一个事件，有系统判断事件给哪个进程，如果当前app正处于前台，会将事件给到当前app,触发当前app主线程Runloop的Source1回调，source1回调触发source0的回调，source0的回调将事件包装成UIEvent,source0的回调将UIEvent传给UIWindow，通过UIEvent中的UITouch的hitTest View 来找到hitTestedView,(hitTesting过程)找到最适合响应的View,从下往上找(UIApplication ——> UIWindow ——> 子视图 ——> ... ——> 子视图)，核心方法是hitTest:withEvent:方法】
    hitTest:withEvent: 方法返回一个UIView对象，作为当前视图层次中的响应者。默认实现是：
        
        若当前视图无法响应事件，则返回nil
        若当前视图可以响应事件，但无子视图可以响应事件，则返回自身作为当前视图层次中的事件响应者
        若当前视图可以响应事件，同时有子视图可以响应，则返回子视图层次中的事件响应者

事件的响应:响应链是自上而下
UITextField ——> UIView ——> UIView ——> UIViewController ——> UIWindow ——> UIApplication ——> UIApplicationDelegation
//==================源码解析==================
//********************************MJRefresh
继承的设计
基类：  MJRefreshComponent 制定控件的所有状态，回调，接口，以及声明需要子类实现的方法
控制层：MJRefreshHeader/MJRefreshFooter 控制header和footer的大小以及位置，
显示层：加label MJRefreshStateHeader/ 根据不同状态设置label里显示的文字。【重写prepare；placeSubviews;setState:】
显示层: 加菊花(gif) MJRefreshNormalHeader 【重写prepare；placeSubviews;setState:】

//********************************    VVeboTableView 优化tableView
//减少CPU/GPU计算量                            按需加载Cell                                      异步处理Cell
cell的重用机制                               cellForRow里只加载可见的cell                           异步加载网络图片
将cell高度甚至里边控件的frame缓存在model         监听tableView的快速滚动，保存目标滚动范围的前后三行          异步绘制本地图片
减少cell内部控件的层级                                                                               异步绘制UIView
优化圆角的效率                                                                                     异步绘制NSString UILabel

//******************************** YYCache=============
线程安全的高性能缓存组件
技术点：双向链表，线程锁，数据库操作相关的知识
缓存淘汰算法：（LRU）淘汰使用频率较低的缓存。
缓存清理策略：分别通过count cost age 来清理某一维度的缓存。
YYCache：提供对外调用的接口，包括YYMemoryCache和YYDiskCache
YYMemoryCache：负责处理容量小，相对高速的内存缓存，线程安全的。
_YYLinkedMap：YYMemoryCache使用的双向链表类
_YYLinkedMapNode：是_YYLinkedMap使用的节点类。
YYDiskCache：负责容量大，相对低速的磁盘缓存，线程安全，支持异步操作
YYKVStorage：YYDiskCache的底层实现类，用于管理磁盘缓存。
YYKVStorageItem：内置在YYKVStorage中，是YYKVStorage用于封装某个缓存的类。
//==================SDWebImage================

//================id和instancetype===
1:id在编译的时候不能判断对象的真实类型 instancetype在编译的时候可以判断对象的真实类型
2:id可以用来定义变量, 可以作为返回值, 可以作为形参
//==============UI相关====
界面布局管理
渲染及动画
事件响应
//---
UIViewController的作用:
管理view；
管理数据
响应用户交互
管理资源
适配不同尺寸屏幕
//====轻VC=====
将数据源等复杂接口从VC中剥离
把业务逻辑代码抽到Model层
将复杂的View抽象成独立的类
将一个VC中分离的界面模块剥离成为多个子VC

