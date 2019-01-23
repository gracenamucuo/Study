//
//  SelectAlert.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2019/1/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "SelectAlert.h"

@interface SelectAlert ()
@property (nonatomic,copy) void(^cancelBlock)(void);
@property (nonatomic,copy) void(^doneBlock)(void);
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation SelectAlert
- (void)showSelectAlertTitle:(NSString *)title done:(void (^)(void))done cancel:(void (^)(void))cancel
{
    self.title.text = title;
    self.doneBlock = done;
    self.cancelBlock = cancel;
    
}
- (IBAction)cancelAction:(UIButton *)sender {
    self.cancelBlock();
}
- (IBAction)doneAction:(UIButton *)sender {
    self.doneBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
