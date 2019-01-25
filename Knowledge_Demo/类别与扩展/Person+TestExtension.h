//
//  Person+TestExtension.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person ()//该分类文件也是和

@property (nonatomic,copy)NSString *name;
- (void)testExtensionMethod;
@end

NS_ASSUME_NONNULL_END
