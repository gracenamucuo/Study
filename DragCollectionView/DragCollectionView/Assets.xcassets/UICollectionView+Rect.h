//
//  UICollectionView+Rect.h
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/11/1.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Rect)
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
