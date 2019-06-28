//
//  ProductListViewModel.h
//  T_MVVM
//
//  Created by dyp on 2019/6/27.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductListViewModel : NSObject

@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,assign)BOOL allowRefresh;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger pageSize;
@property (nonatomic,assign,readonly)BOOL loaded;
- (void)refresh;
- (void)loadMore;
- (void)requestDataParam:(NSDictionary*)param success:(void(^)(NSArray *data))success fail:(void(^)(NSString *failMsg))fail;
@end

NS_ASSUME_NONNULL_END
