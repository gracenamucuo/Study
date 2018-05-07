//
//  CustomLayout.m
//  CollectionViewCustomLayout_Demo
//
//  Created by 戴运鹏 on 2018/5/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CircleLayout.h"
#define ITEM_SIZE 70

@interface CircleLayout()
@property (nonatomic,assign)CGPoint center;

@property (nonatomic,assign)CGFloat radius;
@property (nonatomic, strong) NSMutableArray *deleteIndexPaths;
@property (nonatomic, strong) NSMutableArray *insertIndexPaths;
@end

@implementation CircleLayout

- (void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView]numberOfItemsInSection:0];
    _center = CGPointMake(size.width / 2, size.height / 2);
    _radius = MIN(size.width, size.height) / 2.5;
}

- (CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item*M_PI/_cellCount), _center.y+_radius *sinf(2 * indexPath.item * M_PI / _cellCount));
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0; i < self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

//- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems
//{
//    [super prepareForCollectionViewUpdates:updateItems];
//    self.deleteIndexPaths = [NSMutableArray array];
//    self.insertIndexPaths = [NSMutableArray array];
//    
//    for (UICollectionViewUpdateItem *update in updateItems) {
//        if (update.updateAction == UICollectionUpdateActionDelete) {
//            [self.deleteIndexPaths addObject:update.indexPathBeforeUpdate];
//        }else if (update.updateAction == UICollectionUpdateActionInsert){
//            [self.insertIndexPaths addObject:update.indexPathAfterUpdate];
//        }
//    }
//}
//
//- (void)finalizeCollectionViewUpdates
//{
//    [super finalizeCollectionViewUpdates];
//    self.deleteIndexPaths = nil;
//    self.insertIndexPaths = nil;
//}
//
//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
//    if ([self.insertIndexPaths containsObject:itemIndexPath]) {
//        
//        if (!attributes) {
//            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//            
//            attributes.alpha = 0;
//            attributes.center = CGPointMake(_center.x, _center.y);
//        }
//    }
//    return attributes;
//}
//
//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
//    if ([self.deleteIndexPaths containsObject:itemIndexPath]) {
//        if (!attributes) {
//            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//            attributes.alpha = 0.5;
//            attributes.center = CGPointMake(_center.x, _center.y);
//            attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1);
//        }
//    }
//    return attributes;
//}



@end










