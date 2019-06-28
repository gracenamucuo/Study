//
//  BindProtocol.h
//  T_MVVM
//
//  Created by dyp on 2019/6/27.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BindProtocol <NSObject>

- (void)bindViewModel:(id)viewModel;
@end

NS_ASSUME_NONNULL_END
