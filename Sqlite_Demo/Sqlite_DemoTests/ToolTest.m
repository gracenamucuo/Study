//
//  ToolTest.m
//  Sqlite_DemoTests
//
//  Created by 戴运鹏 on 2018/9/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUnit.h"
@interface ToolTest : XCTestCase

@end

@implementation ToolTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdd
{
    int result = [TestUnit add:2 b:4];
    XCTAssertEqual(result, 6);
    
    int result1 = [TestUnit add:2 b:2];
    XCTAssertEqual(result1, 4);
    
    
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

@end
