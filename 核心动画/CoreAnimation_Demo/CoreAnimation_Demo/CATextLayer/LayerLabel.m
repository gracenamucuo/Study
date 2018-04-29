//
//  LayerLabel.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel

/*
 LayerLabel *layerlabel = [[LayerLabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
 layerlabel.text = @"你还会或或或或";
 layerlabel.backgroundColor = [UIColor whiteColor];
 layerlabel.textColor = [UIColor blackColor];
 layerlabel.font = [UIFont systemFontOfSize:18];
 [self.view addSubview:layerlabel];
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

+ (Class)layerClass
{
    return [CATextLayer class];
}

- (CATextLayer *)textLayer
{
    return (CATextLayer *)self.layer;
}

- (void)setUp
{
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    [self textLayer].contentsScale = [UIScreen mainScreen].scale;
    [self.layer display];
}

- (void)setText:(NSString *)text
{
//    super.text = text;
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor
{
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font
{
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}


@end
