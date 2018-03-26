//
//  NSObject+AssociatedObject.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
@implementation NSObject (AssociatedObject)

@dynamic associatedObject;
- (void)setAssociatedObject:(id)associatedObject
{
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject
{
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

/*
 OBJC_EXPORT void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);
 
 OBJC_EXPORT id objc_getAssociatedObject(id object, const void *key)
 __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);
 
 OBJC_EXPORT void objc_removeAssociatedObjects(id object)
 __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);

 const void *key 参数的三种写法:
 1，使用&AssociatedObjectKey作为key值
 static char AssociatedObjectKey = "AssociatedKey";
2,使用AssociatedKey 作为key值
 static const void *AssociatedKey = "AssociatedKey";
3,使用@selector
 @selector(associatedKey)
 
 //关联对象的存储策略
 OBJC_ASSOCIATION_ASSIGN @property (assign) / @property (unsafe_unretained) 弱引用关联对象
 【注意:这里需要注意的是标记成OBJC_ASSOCIATION_ASSIGN的关联对象和
 @property (weak) 是不一样的，上面表格中等价定义写的是 @property (unsafe_unretained)，对象被销毁时，属性值仍然还在。如果之后再次使用该对象就会导致程序闪退。所以我们在使用OBJC_ASSOCIATION_ASSIGN时，要格外注意。】
 OBJC_ASSOCIATION_RETAIN_NONATOMIC @property (nonatomic, strong) 强引用关联对象，且为非原子操
 OBJC_ASSOCIATION_COPY_NONATOMIC @property (nonatomic, copy) 复制关联对象，且为非原子操作
 OBJC_ASSOCIATION_RETAIN @property (atomic, strong) 强引用关联对象，且为原子操作
 OBJC_ASSOCIATION_COPY @property (atomic, copy) 复制关联对象，且为原子操作
 
 
 
 关于关联对象还有一点需要说明的是objc_removeAssociatedObjects。这个方法是移除源对象中所有的关联对象，并不是其中之一。所以其方法参数中也没有传入指定的key。要删除指定的关联对象，使用 objc_setAssociatedObject 方法将对应的 key 设置成 nil 即可。
 objc_setAssociatedObject(self, associatedKey, nil, OBJC_ASSOCIATION_COPY_NONATOMIC);

 
 关联对象使用的3种场景
 1.为现有的类添加私有变量
 2.为现有的类添加公有属性
 3.为KVO创建一个关联的观察者。
 */
@end































