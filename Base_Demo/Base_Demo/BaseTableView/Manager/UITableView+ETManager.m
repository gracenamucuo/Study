//
//  UITableView+ETManager.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UITableView+ETManager.h"
#import "ETTableManager.h"
#import <objc/runtime.h>

@implementation UITableView (ETManager)
@dynamic manager;
- (void)setManager:(ETTableManager *)manager
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [manager bindToTableView:self];
            objc_setAssociatedObject(self, @selector(manager), manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });

}

- (ETTableManager *)manager
{
    return objc_getAssociatedObject(self, @selector(manager));
}

@end
