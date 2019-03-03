//
//  CustomCell.m
//  Progress_Demo
//
//  Created by 戴运鹏 on 2019/3/2.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "CustomCell.h"
#import "Custom.h"

@interface CustomCell ()
@property (nonatomic,weak)Custom *custom;
@property (nonatomic,weak)Custom *custom1;
@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    Custom *custom = [[Custom alloc]init];
    self.custom = custom;
    [self.contentView addSubview:custom];
    
    Custom *custom1 = [[Custom alloc]init];
    self.custom1 = custom1;
    [self.contentView addSubview:custom1];
  
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.custom.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.width / 2);
       self.custom1.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.width / 2);
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
