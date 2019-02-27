//
//  Person.h
//  C语言
//
//  Created by 戴运鹏 on 2019/2/21.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Person : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;
//@property (nonatomic,copy)NSString *sex;
//@property (nonatomic,assign)double height;
//@property (nonatomic,assign)double width;
//@property (nonatomic,copy)NSString *name;
//@property (nonatomic,copy)NSString *name;

+ (void)staticMethod;

@end

NS_ASSUME_NONNULL_END
