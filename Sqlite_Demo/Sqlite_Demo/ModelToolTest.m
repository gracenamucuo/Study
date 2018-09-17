//
//  ModelToolTest.m
//  Sqlite_DemoTests
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ModelTool.h"
#import "Student.h"
@interface ModelToolTest : XCTestCase

@end

@implementation ModelToolTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIvarNameType {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *dic = [ModelTool columnNameAndTypesStr:[Student class]];
    NSLog(@"%@",dic);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
