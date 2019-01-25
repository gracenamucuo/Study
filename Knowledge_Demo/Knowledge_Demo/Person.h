//
//  Person.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Son.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (atomic,copy)NSString *sex;
@property (atomic,strong)NSMutableArray *arr;
@property (nonatomic,strong)Son *son;
@property (nonatomic,copy)NSString *nameStr;
@property (nonatomic,strong)NSMutableString *mutableStr;
@property (nonatomic,copy)NSString *dynamicProperty;//动态合成属性 需要自己手动生成setter和getter方法。如果不手动实现的话，调用两个setter或getter方法的时候，会崩溃
@property (nonatomic,assign,getter=isGetMarry)BOOL marray;
- (void)originalMethod;

@end

NS_ASSUME_NONNULL_END
