//
//  ETRefreshHeader.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETRefreshHeader.h"
#import "ETRefreshNormalHeader.h"
#import "ETRefreshGifHeader.h"
@implementation ETRefreshHeader
///正常
+ (id)normalHeaderWithRefreshingBlock:(ETRefreshHeaderRefreshingBlock)refreshingBlock
{
    ETRefreshNormalHeader *normal = [[ETRefreshNormalHeader alloc]init];
    normal.refreshingBlock = refreshingBlock;
    
    return normal;
}

+ (id)normalHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    ETRefreshNormalHeader *normal = [[ETRefreshNormalHeader alloc]init];
    [normal setRefreshingTarget:target refreshingAction:action];
    return normal;
}
///gif
+ (id)gifHeaderWithRefreshingBlock:(ETRefreshHeaderRefreshingBlock)refreshingBlock
{
    ETRefreshGifHeader *gif = [[ETRefreshGifHeader alloc]init];
    gif.refreshingBlock = refreshingBlock;
    return gif;
}

+ (id)gifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    ETRefreshGifHeader *gif = [[ETRefreshGifHeader alloc]init];
    [gif setRefreshingTarget:target refreshingAction:action];
    return gif;
}
@end
