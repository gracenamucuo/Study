//
//  BaseCell.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "BaseCell.h"
#import "UIView+Screenshot.h"

@interface BaseCell ()

@property (nonatomic,assign)CGPoint location;
@property (nonatomic,strong)UIImageView *im;
@end

@implementation BaseCell
//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//    UILongPressGestureRecognizer *longGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
//    [self addGestureRecognizer:longGr];
//    [longGr addObserver:self forKeyPath:@"view" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//
//    UIImageView *ig = [[UIImageView alloc]init];
//    self.im = ig;
//    [self.collectionView addSubview:ig];
//
//}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
//    if ([keyPath isEqualToString:@"view"]) {
//        NSLog(@"%@",change);
//    }
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesMoved:touches withEvent:event];
//    NSArray *arr = [touches allObjects];
//    UITouch *touch = arr[0];
//    self.location = [touch locationInView:self.collectionView];
//    
//    
//    self.im.image = [self screenShotByFrame:self.bounds];
//    if (!self.im.superview) {
//        [self.collectionView addSubview:self.im];
//    }
//    self.im.center = self.location;
//    CGRect frame = self.im.frame;
//    frame.size.height = self.bounds.size.height;
//    frame.size.width = self.bounds.size.width;
//    self.im.frame = frame;
//    NSLog(@"拖动");
//}

- (void)longAction:(UILongPressGestureRecognizer *)gr
{
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[gr locationInView:self.collectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
//            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
//            self.location = [gr locationInView:self];
//            self.contentView.hidden = YES;
//            [self captureSelf];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
//            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
//            [self.collectionView endInteractiveMovement];
            break;
        default:
//            [self.collectionView cancelInteractiveMovement];
            break;
    }

}

- (void)captureSelf
{

    self.im.center = self.location;
}

@end
