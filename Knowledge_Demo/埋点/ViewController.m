//
//  ViewController.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "YYModel/YYModel.h"
#import "Model.h"
#import "NSArray+safe.h"
#import "SecController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"jj" ofType:@"json"];
    
//    NSString *json = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
//    Model *model = [Model yy_modelWithJSON:json];
//    NSLog(@"%@",model.c);
    
//    NSLog(@"%lld",[model.b[@"test"] longLongValue]);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    UIImage *image = [UIImage imageNamed:@"qq"];
//   UIImage *im = [self scaleImage:image ToSize:CGSizeMake(image.size.width, image.size.height)];
//    UIColor *color = [UIColor colorWithPatternImage:image];
//    label.backgroundColor = color;
    label.text = @"124";
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    v.backgroundColor = [UIColor redColor];
    [label addSubview:v];
    [self.view addSubview:label];
    
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    SecController *sec1 = [[SecController alloc]init];
    [self presentViewController:sec1 animated:YES completion:nil];
}

-(UIImage *)scaleImage:(UIImage *)img ToSize:(CGSize)itemSize{
    UIImage *i;
    // 创建一个bitmap的context,并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect=CGRectMake(0, 0, itemSize.width, itemSize.height);
    // 绘制改变大小的图片
    [img drawInRect:imageRect];
    // 从当前context中创建一个改变大小后的图片
    i=UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return i;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    CGAffineTransform transform = CGAffineTransformMakeScale(1, 2);
//    self.view.layer.affineTransform = transform;
}

- (IBAction)shareBtnPressed:(UIButton *)sender {
    NSLog(@"主页分享");
}

- (IBAction)favBtnPressed:(UIButton *)sender {
    NSLog(@"主页点赞");
}
@end
