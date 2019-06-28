//
//  ProductModel.h
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductModel : NSObject

@property (nonatomic,copy)NSString *productName;
@property (nonatomic,copy)NSString *status;//1 在售 2 下架 3补货中


@end

NS_ASSUME_NONNULL_END
