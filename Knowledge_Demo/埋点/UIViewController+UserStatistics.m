//
//  UIViewController+UserStatistics.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "UIViewController+UserStatistics.h"
#import "HookUtility.h"
#import <objc/runtime.h>

@implementation UIViewController (UserStatistics)

- (void)setNameWithRuntime:(NSString *)nameWithRuntime
{
    objc_setAssociatedObject(self, @selector(nameWithRuntime), nameWithRuntime, OBJC_ASSOCIATION_COPY);
}

- (NSString *)nameWithRuntime
{
    return objc_getAssociatedObject(self, @selector(nameWithRuntime));
}


//+ (void)load
//{
//    NSLog(@"控制器的load方法");
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
//        
//        SEL originalDisSel = @selector(viewWillDisappear:);
//        SEL swizzledDisSel = @selector(swiz_viewWillDisappear:);
//        
//        [HookUtility swizzlingInClass:self originalSelector:originalSelector swizzledSelector:swizzledSelector];
//        [HookUtility swizzlingInClass:self originalSelector:originalDisSel swizzledSelector:swizzledDisSel];
//    });
//}

- (void)swiz_viewWillAppear:(BOOL)animated
{
    NSLog(@"在viewWillAppear前插入代码");
    if (![self.nameWithRuntime isEqualToString:@"test"]) {
        self.nameWithRuntime = @"test";
        NSLog(@"赋值成功");
    }
    [self inject_viewWillAppear];
    [self swiz_viewWillAppear:animated];
}

- (void)swiz_viewWillDisappear:(BOOL)animated
{
    NSLog(@"在viewWillDisappear前插入代码");
    [self inject_viewWillDisappear];
    [self swiz_viewWillDisappear:animated];
}

- (void)inject_viewWillAppear
{
    NSString *pageID = [self pageEventID:YES];
    if (pageID) {
        NSLog(@"进入页面%@ 上传服务器",pageID);
    }
}

- (void)inject_viewWillDisappear
{
    NSString *pageID = [self pageEventID:NO];
    if (pageID) {
        NSLog(@"离开页面%@ 上传服务器",pageID);
    }
}

- (NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIds"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"UserStatistics" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}
@end
