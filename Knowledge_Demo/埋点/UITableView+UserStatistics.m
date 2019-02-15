//
//  UITableView+UserStatistics.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "UITableView+UserStatistics.h"
#import "HookUtility.h"
@implementation UITableView (UserStatistics)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL orginalSel = @selector(setDelegate:);
        SEL swizzSel = @selector(swiz_setDelegate:);
        [HookUtility swizzlingInClass:self originalSelector:orginalSel swizzledSelector:swizzSel];
    });
}

- (void)swiz_setDelegate:(id<UITableViewDelegate>)delegate
{
    
    [self swiz_setDelegate:delegate];
}

- (void)handleDelegate:(id<UITableViewDelegate>)delegate{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
            
        }
    });

}
@end
