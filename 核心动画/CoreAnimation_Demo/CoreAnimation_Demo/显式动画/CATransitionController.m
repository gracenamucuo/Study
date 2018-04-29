//
//  CATransitionController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CATransitionController.h"

@interface CATransitionController ()<UITabBarControllerDelegate>
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)NSArray *imagesArray;
@end
///过渡动画
/*
 过渡动画的基本原则是对原始的图层外观截图，然后添加一段动画，平滑过渡到图层改变之后的那个截图效果。
 */
@implementation CATransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
//    self.imageView.center = self.view.center;
//    self.imageView.image = [UIImage imageNamed:@"fire"];
//    [self.view addSubview:self.imageView];
//    self.imagesArray = @[[UIImage imageNamed:@"fire"],[UIImage imageNamed:@"snow"],[UIImage imageNamed:@"room"],[UIImage imageNamed:@"ship"]];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    self.imageView.userInteractionEnabled = YES;
//    [self.imageView addGestureRecognizer:tap];
    
}

- (void)switchImage
{
    
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionMoveIn;
//    transition.subtype = kCATransitionFromLeft;
//    [self.imageView.layer addAnimation:transition forKey:nil];
//    
//    UIImage *currentImage = self.imageView.image;
//    NSInteger index = [self.imagesArray indexOfObject:currentImage];;
//    index = (index + 1) % self.imagesArray.count;
//    self.imageView.image = self.imagesArray[index];
    
    ///用UIView的api实现过渡动画
    [UIView transitionWithView:self.imageView duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        UIImage *currentImage = self.imageView.image;
        NSInteger index = [self.imagesArray indexOfObject:currentImage];;
        index = (index + 1) % self.imagesArray.count;
        self.imageView.image = self.imagesArray[index];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    [self switchImage];
    
    //自定义过渡动画
    [self performTransition];
}
///==================================================
///图层树动画
- (void)tapAction
{
    UITabBarController *tap = [[UITabBarController alloc]init];
    UIViewController *vc1 = [[UIViewController alloc]init];
    
    vc1.view.backgroundColor = [UIColor redColor];
    tap.delegate = self;
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"火" image:[UIImage imageNamed:@"fire"] tag:0];
    
     UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"雪" image:[UIImage imageNamed:@"snow"] tag:1];
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc1.tabBarItem = item1;
    vc2.tabBarItem = item2;
    tap.viewControllers = @[vc1,vc2];
    [self.navigationController pushViewController:tap animated:YES];
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    /*
     type
     CA_EXTERN NSString * const kCATransitionFade
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCATransitionMoveIn
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCATransitionPush
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     CA_EXTERN NSString * const kCATransitionReveal
     CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);

    subtype
    CA_EXTERN NSString * const kCATransitionFromRight
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromLeft
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromTop
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromBottom
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
     */
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [tabBarController.view.layer addAnimation:transition forKey:nil];
    
    
}


///自定义
- (void)performTransition
{
    //通过对当前界面截图，获得动画前的视图，并将其加在最上层，之后对该视图进行各种动画，结束之后将截图视图移除
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
     UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageView *coverView = [[UIImageView alloc]initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    [self.view addSubview:coverView];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    //执行动画
    [UIView animateWithDuration:1 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        coverView.transform = transform;
        coverView.alpha = 0;
    }completion:^(BOOL finished) {
        [coverView removeFromSuperview];
    }];
    
}


@end
























































































































