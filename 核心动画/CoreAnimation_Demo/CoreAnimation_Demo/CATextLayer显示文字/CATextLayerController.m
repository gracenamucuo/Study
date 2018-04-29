//
//  CATextLayerController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CATextLayerController.h"
#import <CoreText/CoreText.h>
@interface CATextLayerController ()

@end

@implementation CATextLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///CATextLayer显示文字
- (void)showWordsByCATextLayer
{
    UIView *layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    layerView.center = self.view.center;
    [self.view addSubview:layerView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = layerView.bounds;
    [layerView.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontsize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontsize, NULL);
    
    NSString *text = @"“Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam";
    textLayer.string = text;
    //避免像素化
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
    //富文本属性
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc]initWithString:text];
    NSDictionary *attri = @{(__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,(__bridge id)kCTFontFormatAttribute:(__bridge id)fontRef};
    [string setAttributes:attri range:NSMakeRange(0, [text length])];
    
    attri = @{(__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor redColor].CGColor,(__bridge id)kCTFontAttributeName:(__bridge id)fontRef,(__bridge id)kCTUnderlineStyleAttributeName:@(kCTUnderlineStyleSingle)};
    [string setAttributes:attri range:NSMakeRange(6, 5)];
    
    CFRelease(fontRef);
    textLayer.string = string;
}
@end
