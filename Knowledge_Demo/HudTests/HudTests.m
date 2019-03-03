//
//  HudTests.m
//  HudTests
//
//  Created by 戴运鹏 on 2019/3/2.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MBProgressHUD.h"


#define weakify(var) __weak typeof(var) weak_##var = var;

#define strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = weak_##var; \
_Pragma("clang diagnostic pop")

#define MBTestHUDIsVisible(hud, rootView) \
do { \
XCTAssertEqualObjects(hud.superview, rootView, @"The hud should be added to the view."); \
XCTAssertEqual(hud.alpha, 1.f, @"The HUD should be visible."); \
XCTAssertFalse(hud.hidden, @"The HUD should be visible."); \
XCTAssertEqual(hud.bezelView.alpha, 1.f, @"The HUD should be visible."); \
} while (0)

#define MBTestHUDIsHiden(hud, rootView) \
do { \
XCTAssertEqual(hud.alpha, 0.f, @"The hud should be faded out."); \
} while (0)

#define MBTestHUDIsHidenAndRemoved(hud, rootView) \
do { \
XCTAssertFalse([rootView.subviews containsObject:hud], @"The HUD should not be part of the view hierarchy."); \
MBTestHUDIsHiden(hud, rootView); \
XCTAssertNil(hud.superview, @"The HUD should not have a superview."); \
} while (0)

@interface HudTests : XCTestCase<MBProgressHUDDelegate>

@property (nonatomic) XCTestExpectation *hideExpectation;
@property (nonatomic, copy) dispatch_block_t hideChecks;

@end

@implementation HudTests

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

- (void)testInitializers {
    XCTAssertNotNil([[MBProgressHUD alloc] initWithView:[UIView new]]);
    UIView *nilView = nil;
    XCTAssertThrows([[MBProgressHUD alloc] initWithView:nilView]);
    XCTAssertNotNil([[MBProgressHUD alloc] initWithFrame:CGRectZero]);
    NSKeyedUnarchiver *dummyUnarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[NSData data]];
    XCTAssertNotNil([[MBProgressHUD alloc] initWithCoder:dummyUnarchiver]);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
