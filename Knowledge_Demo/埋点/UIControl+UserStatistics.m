//
//  UIControl+UserStatistics.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "UIControl+UserStatistics.h"
#import "HookUtility.h"
@implementation UIControl (UserStatistics)

+ (void)load
{
    NSLog(@"control的load方法");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL orginalSel = @selector(sendAction:to:forEvent:);
        SEL swizzSel = @selector(swiz_sendAction:to:forEvent:);
        [HookUtility swizzlingInClass:self originalSelector:orginalSel swizzledSelector:swizzSel];
    });
}

- (void)swiz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self performUserStatisticsAction:action to:target forEvent:event];
    [self swiz_sendAction:action to:target forEvent:event];
}
- (void)performUserStatisticsAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
//    NSLog(@"hook 点击成功%@ %@ %@",NSStringFromSelector(action),target,event);
    NSString *eventID = nil;
    if ([[[event allTouches]anyObject]phase] == UITouchPhaseEnded) {
        NSString *actionStr = NSStringFromSelector(action);
        NSString *targetName = NSStringFromClass([target class]);
        NSDictionary *dic = [self dictionaryFromUserStatisticsConfigPlist];
        eventID = dic[targetName][@"ControlEventIds"][actionStr];
        
    }
    if (eventID) {
        NSLog(@"%@ 上传服务器",eventID);
    }
}

- (NSString *)controlEventID:(BOOL)bEnterPage
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
