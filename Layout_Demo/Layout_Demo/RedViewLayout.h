//
//  RedViewLayout.h
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETLayoutable.h"
@interface RedViewLayout : NSObject<ETLayoutable>
@property (nonatomic,strong)UIView *superView;
@property (nonatomic,strong)NSArray<NSDictionary *> *layoutAttris;
//- (instancetype)initWithLeft:()

@end
