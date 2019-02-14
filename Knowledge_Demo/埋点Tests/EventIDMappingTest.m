//
//  EventIDMappingTest.m
//  埋点Tests
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
@interface EventIDMappingTest : XCTestCase

@end

@implementation EventIDMappingTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testUserStatisticsIDMapping
{
    NSDictionary *configDic  = [self dictionaryFromUserStatisticsConfigPlist];
    XCTAssertNotNil(configDic,@"埋点plist文件加载失败");
    [configDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        XCTAssert([obj isKindOfClass:[NSDictionary class]],@"plist文件数据结构变了");
        NSString *targetPageName = key;
        Class pageCls = NSClassFromString(targetPageName);
        id pageInstance = [[pageCls alloc]init];
        NSDictionary *pageDic = (NSDictionary *)obj;
        
        //页面
        NSDictionary *pageEventIDDic = pageDic[@"PageEventIds"];
        
        NSDictionary *controlEventDic = pageDic[@"ControlEventIds"];
        XCTAssert(pageEventIDDic,@"没有pageIds");
        XCTAssert(controlEventDic,@"没有保护eventids");
        
        [pageEventIDDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            XCTAssert([obj isKindOfClass:[NSString class]],@"文件结构变更");
            XCTAssertNotNil(obj,@"id为空");
        }];
        
        [controlEventDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString *actionName = key;
            SEL actionSel = NSSelectorFromString(actionName);
            XCTAssert([pageInstance respondsToSelector:actionSel], @"代码与plist文件函数不匹配，请确认：-[%@ %@]", targetPageName, actionName);
            
            //EVENT_ID不能为空
            XCTAssertNotNil(obj, @"EVENT_ID为空，请确认");
        }];
    }];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"UserStatistics" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}
@end






























