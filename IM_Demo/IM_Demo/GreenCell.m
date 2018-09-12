//
//  GreenCell.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "GreenCell.h"

@interface GreenCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation GreenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor greenColor];
    }
    return self;
}
- (void)refreshData:(NSString *)data
{
    self.titleLabel.text = [NSString stringWithFormat:@"我是绿色%@",data];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
