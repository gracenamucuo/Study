//
//  TestAttechMent.h
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NIMSDK/NIMSDK.h>
@interface TestAttechMent : NSObject<NIMCustomAttachment>
@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *subTitle;
@end
