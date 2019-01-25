//
//  WeakInstance.h
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakInstance : NSObject

+ (id)sharedInstance;
@end

NS_ASSUME_NONNULL_END
