//
//  CubeController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CubeController.h"

@interface CubeController ()
@property (nonatomic,weak)UIView *contaierView;

@end

@implementation CubeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)addCube
{
    self.contaierView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.contaierView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.contaierView];
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1/ 500;
    self.contaierView.layer.sublayerTransform = pt;
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.contaierView.layer addSublayer:cube1];
    
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.contaierView.layer addSublayer:cube2];
    
}

- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    face.transform = transform;
    
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    CATransformLayer *cube = [CATransformLayer layer];
    
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containerSize = self.contaierView.bounds.size;
    cube.position  = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    
    cube.transform = transform;
    
    return cube;
}

@end
