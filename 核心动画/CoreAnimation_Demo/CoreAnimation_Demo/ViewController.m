//
//  ViewController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self moveAnchorPoint];
        [self groupOpacity];
    
}

///组透明
- (void)groupOpacity
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn1 = [self customButton];
    btn1.center = CGPointMake(50, 150);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [self customButton];
    btn2.center = CGPointMake(250, 150);
    btn2.alpha = 0.5;
    //以下两句现在好像没有用了，加不加效果一样。
    btn2.layer.shouldRasterize = YES;
    btn2.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [self.view addSubview:btn2];
    
}

- (UIButton*)customButton
{
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;

    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
}

///anchorPoint  锚点
- (void)moveAnchorPoint
{
    UIView *anchorPointView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 300)];
    anchorPointView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:anchorPointView];
    NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    
    anchorPointView.layer.anchorPoint = CGPointMake(0, 0);
    NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    
    anchorPointView.layer.anchorPoint = CGPointMake(1, 1);
        NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    /*
     2018-04-24 13:16:09.221163+0800 CoreAnimation_Demo[48116:285105] frame{{50, 50}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{0.5, 0.5}---center{150, 200}--position{150, 200}
     2018-04-24 13:16:09.221322+0800 CoreAnimation_Demo[48116:285105] frame{{150, 200}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{0, 0}---center{150, 200}--position{150, 200}
     2018-04-24 13:16:09.221470+0800 CoreAnimation_Demo[48116:285105] frame{{-50, -100}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{1, 1}---center{150, 200}--position{150, 200}

     */
    //改变锚点会影响到frame，没有影响到center和position
    
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
 
    
    //*将一张图片分为多张子图片展示。
    //contentsRect“属性允许我们在图层边框里显示寄宿图的一个子域” contentsRect默认是{0，0，1，1} 可以用这个属性，将图片分成许多块加载到不同的layer上。
    
    //*拉伸的属性
    //contentsCenter是一个CGRect，它定义了一个固定的边框和一个在图层上可拉伸的区域。和UIImage的resizableImageWithCapInset属性相似。
    
}



@end

















































