//
//  CGAffineTransformController.m
//  Transform_Demo
//
//  Created by 戴运鹏 on 2018/4/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TransformController.h"
//度数和弧度的转变
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//传入弧度 M_PI_4
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//传入度数  45度
@interface TransformController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TransformController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.method) {
        case 0:
            [self test0];
            break;
        case 1:
            [self test1];
            break;
        case 2:
            [self test2];
            break;
        case 3:
            [self mixTest0];
            break;
        case 4:
            [self test3D_x];
            break;
        case 5:
            [self test3D_y];
            break;
        case 6:
            [self test3D_z];
            break;
        case 7:
            [self testPerspective_x];
            break;
        case 8:
            [self testPerspective_y];
            break;
        case 9:
            [self testPerspective_z];
            break;
        default:
            break;
    }
}

///仿射变换
- (void)test0
{
    ///右转90度
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
    
    //以下两个赋值效果一样。最终都是作用于layer上。
    self.label.transform = transform;
//    self.label.layer.affineTransform = transform;
}

- (void)test1
{
    //水平方向缩小0.5倍，竖直方向缩小0.8倍
    CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 0.8);
    self.label.layer.affineTransform = transform;
}

- (void)test2
{
    //水平方向上平移20；竖直方向平移10
    CGAffineTransform transform = CGAffineTransformMakeTranslation(20, 10);
    self.label.layer.affineTransform = transform;
}

///混合变换
/*
 CGAffineTransformIdentity: 单位矩阵
 
 “CGAffineTransformRotate(CGAffineTransform t, CGFloat angle)
 CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy)
 CGAffineTransformTranslate(CGAffineTransform t, CGFloat tx, CGFloat ty)”
 
 //两个变换的基础上生成另一个变换
 “CGAffineTransformConcat(CGAffineTransform t1, CGAffineTransform t2);”
 */
- (void)mixTest0
{
    CGAffineTransform transfrom = CGAffineTransformIdentity;
    transfrom = CGAffineTransformRotate(transfrom,DEGREES_TO_RADIANS(60));//旋转60度
    transfrom = CGAffineTransformScale(transfrom, 0.5, 0.6);
    transfrom = CGAffineTransformTranslate(transfrom, 0, 50);//没有垂直向下移动50，因为会叠加上两个形变的结果，相当于向斜下方移动了50 * 0.6
    self.label.layer.affineTransform = transfrom;
    //“也就是说旋转之后的平移和平移之后的旋转结果可能不同”
    
}

///3D变换
/*
 “CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
 CATransform3DMakeScale(CGFloat sx, CGFloat sy, CGFloat sz)
 CATransform3DMakeTranslation(Gloat tx, CGFloat ty, CGFloat tz)”
 */

- (void)test3D_x//在竖直方向压缩了 实际是沿着竖直方向倾斜了45度去看  如果是90度则完全看不到
{
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 1, 0, 0);
    self.label.layer.transform = transform;
}

- (void)test3D_y//效果是在水平方向压缩了  实际是沿着水平方向倾斜了45度去看 如果是90度则完全看不到
{
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.label.layer.transform = transform;
}

- (void)test3D_z//效果是在正对着用户的方向上旋转了45度
{
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    self.label.layer.transform = transform;
}

///透视效果后旋转
//“设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位” “通常500-1000就已经很好了”
- (void)testPerspective_x
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 0, 0);
    self.label.layer.transform = transform;
}

- (void)testPerspective_y
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.label.layer.transform = transform;
}

- (void)testPerspective_z
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 0, 1);
    self.label.layer.transform = transform;
}
@end





































































