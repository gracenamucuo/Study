//
//  Sqlite_DemoTests.m
//  Sqlite_DemoTests
//
//  Created by 戴运鹏 on 2018/9/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SqliteTool.h"
@interface Sqlite_DemoTests : XCTestCase

@end

@implementation Sqlite_DemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuery
{
    NSString *sql = @"select * from t_stu";
    NSMutableArray *arr = [SqliteTool querySql:sql user_id:nil];
    NSLog(@"%@",arr);
}

- (void)testExample {
    NSString *sql = @"create table if not exists t_stu(id integer primary key autoincrement,name text not null,age integer, score real)";
    BOOL result = [SqliteTool deal:sql user_id:nil];
    XCTAssertEqual(result,YES);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}













@end













