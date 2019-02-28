//
//  EqualModel.h
//  Eqaul_Demo
//
//  Created by 戴运鹏 on 2019/2/28.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EqualModel : NSObject<NSCopying>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger identifier;
- (BOOL)isEqualToModel:(EqualModel *)model;
@end

NS_ASSUME_NONNULL_END
