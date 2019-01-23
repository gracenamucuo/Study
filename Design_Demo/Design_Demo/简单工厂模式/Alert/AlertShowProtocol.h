//
//  AlertShowProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2019/1/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AlertShowProtocol <NSObject>

@optional
- (void)showConfirmAlertTitle:(NSString *)title confirm:(void(^)(void))confirm;
- (void)showSelectAlertTitle:(NSString *)title done:(void(^)(void))done cancel:(void(^)(void))cancel;

@end

NS_ASSUME_NONNULL_END
