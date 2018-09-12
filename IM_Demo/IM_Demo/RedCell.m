//
//  RedCell.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "RedCell.h"

@interface RedCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation RedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)refreshData:(NSString *)data
{
    self.titleLabel.text = [NSString stringWithFormat:@"我是红色%@",data];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
