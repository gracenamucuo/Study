//
//  TestDataProvider.m
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestDataProvider.h"

@implementation TestDataProvider
- (NIMKitInfo *)infoByUser:(NSString *)userId
                    option:(NIMKitInfoFetchOption *)option {
    NIMKitInfo *info;
    info = [[NIMKitInfo alloc] init];
    info.infoId = userId;
    info.showName = userId;
    return info;
}
@end
