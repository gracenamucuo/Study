//
//  CustomRefreshHeader.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "BaseCustomRefreshHeader.h"

@implementation BaseCustomRefreshHeader

- (void)placeSubviews
{
    [super placeSubviews];
    if (self.refreshHeader) {
        self.refreshHeader.frame = self.bounds;
        [self addSubview:self.refreshHeader];
    }
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    if ([self.refreshHeader respondsToSelector:@selector(refreshState:)]) {
        [self.refreshHeader refreshState:state];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    if ([self.refreshHeader respondsToSelector:@selector(refreshHeaderPulling:)]) {
        [self.refreshHeader refreshHeaderPulling:self.pullingPercent];
    }
}
@end
