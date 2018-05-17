//
//  SearchInfoProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@protocol SearchInfoProtocol <NSObject>

- (void)setSearchCity:(City*)city;

@end
