//
//  Note.m
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

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
Extension一般用来隐藏类的私有消息，你必须有一个类的源码才能添加一个类的Extension，所以对于系统一些类，如NSString，就无法添加类扩展
伴随着类的产生而产生，也随着类的消失而消失。
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
//=================================关联对象================================

//========================属性@property=====================================================
动态生成属性的getter和setter方法的话，使用@dynamic,而且需要手动声明实例变量成员。
如果setter和getter方法都重写了，则需要手动写出合成@synthesize nameStr = _nameStr;否则，编译器没有声明对应的实例变量。
不可变对象属性修饰符使用copy，可变对象属性修饰符使用strong
