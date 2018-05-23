//
//  Worker.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Worker : NSObject

+ (instancetype)sharedWorker;

- (void)makeMuttonWork:(NSString *)work;

- (void)makeChickenWorK:(NSString *)work;

- (void)makeDuckWork:(NSString *)work;
@end
