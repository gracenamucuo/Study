//
//  ProductCell.m
//  T_MVVM
//
//  Created by dyp on 2019/6/27.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ProductCell.h"
#import "ProductItemViewModel.h"

@interface ProductCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindViewModel:(id)viewModel
{
    if ([viewModel isKindOfClass:[ProductItemViewModel class]]) {
        ProductItemViewModel *item = (ProductItemViewModel *)viewModel;
        self.nameLabel.attributedText = item.productName;
        self.stateLabel.attributedText = item.productStatus;
    }
}
@end
