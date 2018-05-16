//
//  FlowerFactory.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FlowerFactory.h"
#import "FlowerView.h"
@implementation FlowerFactory

- (UIView *)flowerViewWithType:(FlowerType)type
{
    if (self.flowerPool == nil) {
        self.flowerPool = [[NSMutableDictionary alloc]init];
    }
    
    UIView *flowerView = [self.flowerPool objectForKey:[NSNumber numberWithInteger:type]];
    
    if (flowerView == nil) {
        UIImage *flowerImage;
        switch (type) {
            case FlowerType_ball:
                flowerImage = [UIImage imageNamed:@"ball"];
                break;
            case FlowerType_door:
                flowerImage = [UIImage imageNamed:@"door"];
                break;
            case FlowerType_fire:
                flowerImage = [UIImage imageNamed:@"fire"];
                break;
            case FlowerType_room:
                flowerImage = [UIImage imageNamed:@"room"];
                break;
            case FlowerType_ship:
                flowerImage = [UIImage imageNamed:@"ship"];
                break;
            case FlowerType_snow:
                flowerImage = [UIImage imageNamed:@"snow"];
                break;
            default:
                break;
        }
        
        flowerView = [[FlowerView alloc]initWithImage:flowerImage];
        [self.flowerPool setObject:flowerView forKey:[NSNumber numberWithInteger:type]];
    }
    return flowerView;
}

@end

































