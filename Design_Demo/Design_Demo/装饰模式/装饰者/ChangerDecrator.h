//
//  ChangerDecrator.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Transformers.h"
@interface ChangerDecrator : Transformers//装饰者

@property (nonatomic,strong)Transformers *transformer;

@end
