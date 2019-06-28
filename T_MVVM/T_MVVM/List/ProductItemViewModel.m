//
//  ProductViewModel.m
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ProductItemViewModel.h"
#import "ProductModel.h"
@interface ProductItemViewModel ()

@property (nonatomic,strong,readwrite)ProductModel *product;
@property (nonatomic,strong,readwrite)NSAttributedString *productName;
@property (nonatomic,strong,readwrite)NSAttributedString *productStatus;

@end

@implementation ProductItemViewModel


- (instancetype)initWithProduct:(ProductModel *)product
{
    if ([self init]) {
        self.product = product;
        
        NSString *nameText = [NSString stringWithFormat:@"商品名称:%@",product.productName];
        NSMutableAttributedString *nameAttri = [[NSMutableAttributedString alloc]initWithString:nameText];
        [nameAttri setAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]} range:NSMakeRange(0, nameAttri.string.length)];
        self.productName = nameAttri;
        
        NSString *state = @"";
        UIColor *stateColor = [UIColor blackColor];
        switch ([product.status integerValue]) {
            case 1:
            {
                state = @"商品在售中";
            }
                break;
            case 2:
            {
                state = @"商品下架了";
                stateColor = [UIColor lightGrayColor];
            }
                break;
            case 3:
            {
                state = @"商品补货中";
                stateColor = [UIColor redColor];
            }
                break;
            default:
                break;
        }
        
        NSMutableAttributedString *stateAttri = [[NSMutableAttributedString alloc]initWithString:state];
        [stateAttri addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14],NSForegroundColorAttributeName:stateColor} range:NSMakeRange(0, stateAttri.string.length)];
        self.productStatus = stateAttri;
        
    }
    return self;
}

@end
