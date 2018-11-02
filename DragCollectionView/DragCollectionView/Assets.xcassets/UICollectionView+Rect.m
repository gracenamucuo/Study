//
//  UICollectionView+Rect.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/11/1.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "UICollectionView+Rect.h"

@implementation UICollectionView (Rect)

- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self layoutAttributesForItemAtIndexPath:indexPath].frame;
}

@end
