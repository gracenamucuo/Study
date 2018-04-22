//
//  ViewController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+GIF.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lotteryLogo" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    self.imageView.image = image;
}

///寄宿图
- (void)contentsView
{
    UIView *contentsView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 200)];
    contentsView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@""].CGImage);//通过桥接，返回cocoa对象
                            //[UIImage imageNamed:@""].CGImage是一个 CGImageRef的指针
    
    //layer的contentsGravity属性(NSString类型)类似view的contentMode属性
    /*
     kCAGravityCenter
     kCAGravityTop
     kCAGravityBottom
     kCAGravityLeft
     kCAGravityRight
     kCAGravityTopLeft
     kCAGravityTopRight
     kCAGravityBottomLeft
     kCAGravityBottomRight
     kCAGravityResize
    //会拉伸图片
     kCAGravityResizeAspect  //等同UIView的UIViewContentModeScaleAspectFit
     kCAGravityResizeAspectFill
     */
    
    //contentsScale layer的属性 类似UIView的contentScaleFactor 支持高分辨率的一个属性
    /*
     “如果contentsScale设置为1.0，将会以每个点1个像素绘制图片，如果设置为2.0，则会以每个点2个像素绘制图片，这就是我们熟知的Retina屏幕”
     layer.contentsScale = [UIScreen mainScreen].scale;手动设置
     layer.masksToBounds属性对应UIView的clipsToBounds属性
     */
 
    
    //contentsRect“属性允许我们在图层边框里显示寄宿图的一个子域” contentsRect默认是{0，0，1，1} 可以用这个属性，将图片分成许多块加载到不同的layer上。
    //contentsCenter是一个CGRect，它定义了一个固定的边框和一个在图层上可拉伸的区域。和UIImage的resizableImageWithCapInset属性相似。
    
}



@end

















































