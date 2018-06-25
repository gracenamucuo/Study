//
//  RedViewLayout.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "RedViewLayout.h"
#import "ETLayoutAttributeMaker.h"
@interface RedViewLayout()
@property (nonatomic,strong) MASConstraintMaker *maker;


@end
@implementation RedViewLayout

- (LayoutMaker)layoutMaker
{
    return ^(MASConstraintMaker *maker){
//        maker.left.equalTo(self.superView).offset(10);
//        maker.top.equalTo(self.superView).offset(10);
        
        maker.height.width.mas_equalTo(100);
        self.maker = maker;
        [self layout];
    };
}

- (void)layout{
    if (self.layoutAttris.count == 0) return;
    for (NSDictionary *dic in self.layoutAttris) {
        NSLayoutAttribute attri = [dic[@"direction"] integerValue];
        UIView *view = dic[@"view"];
        CGFloat offset = [dic[@"offset"] floatValue];
        if (attri == 1) {
            self.maker.left.equalTo([ETLayoutAttributeMaker makeLayoutAttributeWithView:view direction:attri]).offset(offset);
        }else if (attri == 3){
              self.maker.top.equalTo([ETLayoutAttributeMaker makeLayoutAttributeWithView:view direction:attri]).offset(offset);
        }
        
    }
}

@end
