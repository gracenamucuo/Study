//
//  TableToolTest.m
//  Sqlite_DemoTests
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TableTool.h"
#import "Student.h"
@interface TableToolTest : XCTestCase

@end

@implementation TableToolTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [TableTool tableSortedColumnNamesCls:[Student class] uid:nil];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
