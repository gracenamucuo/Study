//
//  ConfirmAlert.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2019/1/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ConfirmAlert.h"

@interface ConfirmAlert ()
@property (nonatomic,copy) void(^confirmBlock)(void);
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation ConfirmAlert

- (void)showConfirmAlertTitle:(NSString *)title confirm:(void (^)(void))confirm
{
    self.title.text = title;
    self.confirmBlock = confirm;
    
}
- (IBAction)confirmAction:(UIButton *)sender {
    self.confirmBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
