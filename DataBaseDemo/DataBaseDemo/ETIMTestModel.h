//
//  ETIMTestModel.h
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETIMTestModel : NSObject
@property (nonatomic,assign)NSInteger pkid;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *model_id;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,copy)NSString *add1;
@property (nonatomic,assign)NSInteger add2;

- (instancetype)initWithName:(NSString *)name model_id:(NSString *)model_id age:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
