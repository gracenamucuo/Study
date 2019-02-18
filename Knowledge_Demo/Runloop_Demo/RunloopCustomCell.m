//
//  CustomCell.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/2/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "RunloopCustomCell.h"

@interface RunloopCustomCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;

@end

@implementation RunloopCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)renderUIWithIndex:(NSInteger)index completion:(void(^)())completionhandler
{
    if (index % 2 == 0) {
    self.bigImage.image = [UIImage imageNamed:@"bigImage"];
    }else{
        self.bigImage.image = [UIImage imageNamed:@"home"];
    }
    completionhandler();
}

@end
