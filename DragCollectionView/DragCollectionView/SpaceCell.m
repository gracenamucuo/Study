//
//  SpaceCell.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "SpaceCell.h"
#import "StyleModel.h"
@interface SpaceCell ()


@property (weak, nonatomic) IBOutlet UIView *spaceView;
@property (weak, nonatomic) IBOutlet UILabel *insertLabel;

@end

@implementation SpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.spaceView.layer.borderColor = [UIColor blueColor].CGColor;
//    self.spaceView.layer.borderWidth = 1.f;
}


- (void)configUIWithModel:(StyleModel *)model
{
    _model = model;
    self.userInteractionEnabled = NO;
    self.hidden = model.hidden;
    
    switch (model.style) {
        case 1:
            self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.contentView.layer.borderWidth = 0.5f;
            break;
        case 2:
            self.contentView.layer.borderColor = [UIColor blueColor].CGColor;
            self.contentView.layer.borderWidth = 0.5f;
            break;
        default:
            self.contentView.layer.borderColor = nil;
            self.contentView.layer.borderWidth = 0;
            break;
    }

    
}
@end
