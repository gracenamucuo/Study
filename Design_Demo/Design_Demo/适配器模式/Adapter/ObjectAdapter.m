//
//  ObjectAdapter.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ObjectAdapter.h"
#import "FlyModel.h"
@interface ObjectAdapter()

@property (nonatomic,strong)FlyModel *flyModel;

@end

@implementation ObjectAdapter

- (instancetype)initWithAdaptee:(FlyModel *)fly
{
    if (self = [super init]) {
        _flyModel = fly;
    }
    return self;
}

- (UIImage *)getRenderImage
{
    UIImage *image = [UIImage imageNamed:self.flyModel.flyImage];
    return image;
}

- (NSString *)getRenderInfo
{
    return self.flyModel.flyInfo;
}

@end
