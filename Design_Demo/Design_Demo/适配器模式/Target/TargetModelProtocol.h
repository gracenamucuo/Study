//
//  TargetModelProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TargetModelProtocol <NSObject>

- (UIImage *)getRenderImage;
- (NSString *)getRenderInfo;
@end
