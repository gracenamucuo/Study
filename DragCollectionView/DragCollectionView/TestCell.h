//
//  TestCell.h
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@class StyleModel;
NS_ASSUME_NONNULL_BEGIN

@interface TestCell : BaseCell
@property (nonatomic,strong)StyleModel *model;
- (void)configUIWithModel:(StyleModel *)model;

@end

NS_ASSUME_NONNULL_END
