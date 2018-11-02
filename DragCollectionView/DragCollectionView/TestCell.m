//
//  TestCell.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "TestCell.h"
#import "StyleModel.h"

@interface TestCell ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UILabel *replaceLabel;

@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.redView.layer.borderColor = [UIColor yellowColor].CGColor;
//    self.redView.layer.borderWidth = 1.f;
}
- (void)configUIWithModel:(StyleModel *)model
{
    self.replaceLabel.text = [NSString stringWithFormat:@"可替换%ld",model.index];
    self.hidden = model.hidden;
    switch (model.style) {
        case 1:
            self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
            self.contentView.layer.borderWidth = 1.5f;
            break;
        case 2:
            self.contentView.layer.borderColor = [UIColor blueColor].CGColor;
            self.contentView.layer.borderWidth = 2.f;
            break;
        default:
            self.contentView.layer.borderColor = nil;
            self.contentView.layer.borderWidth = 0;
            break;
    }
}
@end
