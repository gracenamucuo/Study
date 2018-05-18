//
//  AdapterTestView.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AdapterTestView.h"

@interface AdapterTestView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation AdapterTestView


- (void)renderViewWithDataModel:(id<TargetModelProtocol>)model
{
    self.imageView.image = [model getRenderImage];
    self.infoLabel.text = [model getRenderInfo];
}


@end
