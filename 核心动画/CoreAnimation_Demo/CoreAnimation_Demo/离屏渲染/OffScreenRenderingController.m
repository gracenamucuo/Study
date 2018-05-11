//
//  OffScreenRenderingControllerController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/10.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "OffScreenRenderingController.h"
#import "UIImage+ImageByAlphaComponent.h"
@interface OffScreenRenderingController ()

@end

@implementation OffScreenRenderingController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self offScreenRendering];
//    [self cornerMethod1];
//    [self cornerMethod2];
//    [self shadowMethod];
    [self colorBlend];
}

- (void)offScreenRendering//但是用instrument检测没有离屏渲染
{
    /*
     iOS 9.0 之前UIimageView跟UIButton设置圆角都会触发离屏渲染。
     
     iOS 9.0 之后UIButton设置圆角会触发离屏渲染，而UIImageView里png图片设置圆角不会触发离屏渲染了，如果设置其他阴影效果之类的还是会触发离屏渲染的。
     */
    UIImageView *im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"door"]];
    im.frame = CGRectMake(100, 100, 100, 100);
    im.layer.cornerRadius = 50;
    im.layer.masksToBounds = YES;
//    im.layer.shouldRasterize = YES;
    [self.view addSubview:im];
}

//====切圆角1
- (void)cornerMethod1
{
    UIImageView *im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"door"]];
    im.frame = CGRectMake(0, 300, 100, 100);
    
    UIGraphicsBeginImageContextWithOptions(im.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:im.bounds cornerRadius:20]addClip];
    [im drawRect:im.bounds];
    im.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    im.layer.shouldRasterize = YES;
    [self.view addSubview:im];
    
}

- (void)cornerMethod2
{//检测有渲染
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    imageView.image = [UIImage imageNamed:@"door"];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(70, 70)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
//    imageView.layer.shouldRasterize = YES;
    [self.view addSubview:imageView];
}

//=====阴影
- (void)shadowMethod
{
    UIImageView *im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"door"]];
    im.frame = CGRectMake(10, 100, 100,100);
    im.layer.shadowColor = [UIColor grayColor].CGColor;
    im.layer.shadowOpacity = 1;
    im.layer.shadowRadius = 2;
    
    //设置阴影的路径则不会出现离屏渲染
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:im.bounds];
    im.layer.shadowPath = path.CGPath;
    
    im.layer.shouldRasterize = YES;//强制开启了离屏渲染，即便是设置了阴影的路径
    [self.view addSubview:im];
}

//------颜色混合--
- (void)colorBlend
{
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imView = [[UIImageView alloc]init];
        imView.backgroundColor = [UIColor redColor];
        imView.frame = CGRectMake(0, 64 + 100 * i, 100, 100);
        UIImage *im = [UIImage imageNamed:@"door"];
        UIImage *nonAlpha = [im imageByApplyingAlpha:1];
        UIImage *alphaIm = [im imageByApplyingAlpha:0.5];
        if (i == 0) {
            imView.alpha = 1;
            imView.image = nonAlpha;
        }else if (i==1){
            imView.alpha = 1;
            imView.image = alphaIm;
        }else if (i == 2){
            imView.alpha = 0.5;
            imView.image = nonAlpha;
        }else if (i == 3){
            imView.alpha = 0.5;
            imView.image = alphaIm;
        }
        [self.view addSubview:imView];
        
    }
}










@end
































































