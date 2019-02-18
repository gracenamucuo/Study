//
//  CustomCell.h
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/2/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RunloopCustomCell : UITableViewCell

- (void)renderUIWithIndex:(NSInteger)index completion:(void(^)())completionhandler;
@end

NS_ASSUME_NONNULL_END
