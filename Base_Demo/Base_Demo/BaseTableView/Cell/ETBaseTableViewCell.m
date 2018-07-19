//
//  ETBaseTableViewCell.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETBaseTableViewCell.h"
#import "ETRowConvertableProtocol.h"
#import "ETBaseCellViewModel.h"
@interface ETBaseTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleName;

@end

@implementation ETBaseTableViewCell

- (void)renderUIWithModel:(id<ETRowConvertableProtocol>)row
{
    if (![row isKindOfClass:[ETBaseCellViewModel class]]) {
        return;
    }
    ETBaseCellViewModel *vm = (ETBaseCellViewModel *)row;
    self.iconImage.image = [UIImage imageNamed:vm.icon];
    self.titleName.text = vm.title;
}

@end
