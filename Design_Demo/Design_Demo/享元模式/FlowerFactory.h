//
//  FlowerFactory.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FlowerType)
{
    FlowerType_ball,
    FlowerType_door,
    FlowerType_fire,
    FlowerType_room,
    FlowerType_ship,
    FlowerType_snow,
};

@interface FlowerFactory : NSObject
@property (nonatomic,strong)NSMutableDictionary *flowerPool;
- (UIView *)flowerViewWithType:(FlowerType)type;
@end
