//
//  PerforemanceController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "PerforemanceController.h"
#define WIDTH 10
#define HEIGHT 10
#define DEPTH 10
#define SIZE 100
#define SPACING 150
#define CAMERA_DISTANCE 500
@interface PerforemanceController ()
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation PerforemanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self matrix];
}

- (void)matrix
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    self.scrollView.contentSize = CGSizeMake((WIDTH - 1) * SPACING, (HEIGHT - 1) * SPACING);
    [self.view addSubview:self.scrollView];

    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/500;

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"试一下";
    [self.view addSubview:label];
    label.layer.transform = transform;

    self.scrollView.layer.transform = transform;
//    for (NSInteger z = DEPTH - 1; z >= 0 ; z--) {
//        for (NSInteger y = 0 ; y < HEIGHT; y++) {
//            for (NSInteger x = 0 ; x < WIDTH; x++ ) {
//                CALayer *layer = [CALayer layer];
//                layer.frame = CGRectMake(0, 0, SIZE, SIZE);
//                layer.position = CGPointMake(x * SPACING, y * SPACING);
//                layer.zPosition = -z*SPACING;
//                layer.backgroundColor = [UIColor colorWithWhite:1-z*(1/DEPTH) alpha:1].CGColor;
//                [self.scrollView.layer addSublayer:layer];
//            }
//        }
//    }
    self.scrollView.backgroundColor = [UIColor redColor];
}

//===========================================================================
///圆角
- (void)cornerLayer
{
    CAShapeLayer *blueLayer = [CAShapeLayer layer];
    blueLayer.fillColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(0, 64, 100, 100);
    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:20].CGPath;
    [self.view.layer addSublayer:blueLayer];
}

@end


