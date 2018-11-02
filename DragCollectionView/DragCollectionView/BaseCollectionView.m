//
//  BaseCollectionView.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "BaseCollectionView.h"
#import "UIView+Screenshot.h"

@interface BaseCollectionView ()

@property (nonatomic,strong)UIView *snapedView;
@property (nonatomic,strong)UILongPressGestureRecognizer *longGesture;
@property (nonatomic,strong)NSIndexPath *oldIndexPath;
@property (nonatomic,assign)CGPoint oldPoint;
@property (nonatomic,strong)NSIndexPath *currentIndexPath;
@end

@implementation BaseCollectionView


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initConfig];
}
- (void)initConfig
{
    [self addGestureRecognizer:self.longGesture];
}

- (void)handleLongGesture:(UILongPressGestureRecognizer*)longGesture
{
    CGPoint point = [longGesture locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];//
   
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            NSLog(@"开始---");
            
//            self.userInteractionEnabled = NO;
            //delegate:更新model 隐藏当前 显示黑色线框

             self.oldIndexPath = indexPath;
            UICollectionViewCell *cell = [self cellForItemAtIndexPath:indexPath];
            self.snapedView = [cell snapshotViewAfterScreenUpdates:NO];
            self.snapedView.frame = cell.frame;
            self.snapedView.backgroundColor = [UIColor blueColor];
            if (!self.snapedView.superview) {
                [self addSubview:self.snapedView];
            }

            if ([self.operateDelegate respondsToSelector:@selector(willChangeIndexPath:)]) {
                [self.operateDelegate willChangeIndexPath:indexPath];
                [self reloadData];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:{
            NSLog(@"改变---");
        self.snapedView.center = point;
        self.currentIndexPath = [self _getChangedIndexPath];
            if ([self.operateDelegate respondsToSelector:@selector(moveToCurrentIndexPath:empty:)]) {
                [self.operateDelegate moveToCurrentIndexPath:self.currentIndexPath empty:self.currentIndexPath==nil];
                [self reloadData];
            }
        self.oldPoint = [self cellForItemAtIndexPath:self.currentIndexPath].center;
            break;
        }
        
        default:
        {
            self.userInteractionEnabled = YES;
            self.snapedView.center = point;
            [self.snapedView removeFromSuperview];
            if ([self.operateDelegate respondsToSelector:@selector(showOldIndexPath:)]) {
                [self.operateDelegate showOldIndexPath:self.oldIndexPath];
                [self reloadData];
            }
        }
            break;
    }
}


- (NSIndexPath *)_getChangedIndexPath {
    __block NSIndexPath *index = nil;
    CGPoint point = [self.longGesture locationInView:self];
    // 遍历拖拽的Cell的中心点在哪一个Cell里
    [[self visibleCells] enumerateObjectsUsingBlock:^(__kindof UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(obj.frame, point)) {
            index = [self indexPathForCell:obj];
            *stop = YES;
        }
    }];
    // 找到而且不是当前的Cell就返回此 index
    if (index) {
        if ((index.item == self.oldIndexPath.item) && (index.row == self.oldIndexPath.row)) {
            return nil;
        }
        return index;
    }
    
    // 获取最应该交换的Cell
    __block CGFloat width = MAXFLOAT;
    __weak typeof(self) weakSelf = self;
    [[self visibleCells] enumerateObjectsUsingBlock:^(__kindof UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(obj.frame, point)) {
            index = [self indexPathForCell:obj];
            *stop = YES;
        }
        __strong typeof(weakSelf) self = weakSelf;
        CGPoint p1 = self.snapedView.center;
        CGPoint p2 = obj.center;
        // 计算距离
        CGFloat distance = sqrt(pow((p1.x - p2.x), 2) + pow((p1.y - p2.y), 2));
        if (distance < width) {
            width = distance;
            index = [self indexPathForCell:obj];
        }
    }];
    if (!index) {
        return nil;
    }
    if ((index.item == self.oldIndexPath.item) && (index.row == self.oldIndexPath.row)) {
        // 最近的就是隐藏的Cell时,return nil
        return nil;
    }
    return index;
}

#pragma mark -- LAXY
- (UILongPressGestureRecognizer *)longGesture
{
    if (!_longGesture) {
        _longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongGesture:)];
        _longGesture.minimumPressDuration = 0.3;
    }
    return _longGesture;
}
@end












