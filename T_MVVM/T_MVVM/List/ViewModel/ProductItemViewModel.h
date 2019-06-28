//
//  ProductViewModel.h
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductModel;

NS_ASSUME_NONNULL_BEGIN

@interface ProductItemViewModel : NSObject

@property (nonatomic,strong,readonly)ProductModel *product;
@property (nonatomic,strong,readonly)NSAttributedString *productName;
@property (nonatomic,strong,readonly)NSAttributedString *productStatus;

- (instancetype)initWithProduct:(ProductModel *)product;
@end

NS_ASSUME_NONNULL_END
