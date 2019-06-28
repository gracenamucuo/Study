//
//  ProductListViewModel.m
//  T_MVVM
//
//  Created by dyp on 2019/6/27.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ProductListViewModel.h"
#import "ProductItemViewModel.h"
#import "ProductModel.h"

@interface ProductListViewModel ()
@property (nonatomic,readwrite,assign)BOOL loaded;
@end

@implementation ProductListViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _page = 1;
        _pageSize = 10;
    }
    return self;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)refresh
{
    [self requestDataParam:@{@"page":@(1),@"size":@(self.pageSize)} success:^(NSArray * _Nonnull data) {
        [self.dataSource removeAllObjects];
        for (NSInteger i = 0; i < self.pageSize; i++) {
            ProductModel *model = [[ProductModel alloc]init];
            model.productName = [NSString stringWithFormat:@"第%ld页 第%ld个东西",self.page,i];
            NSInteger status = arc4random_uniform(2) + 1;
            model.status = [NSString stringWithFormat:@"%ld",status];
            
            ProductItemViewModel *itemViewModel = [[ProductItemViewModel alloc]initWithProduct:model];
            [self.dataSource addObject:itemViewModel];
        }
        
        self.loaded = YES;
    } fail:^(NSString * _Nonnull failMsg) {
        
    }];
}

- (void)loadMore
{
    self.page += 1;
    [self requestDataParam:@{@"page":@(self.page),@"size":@(self.pageSize)} success:^(NSArray * _Nonnull data) {
        for (NSInteger i = 0; i < self.pageSize; i++) {
            ProductModel *model = [[ProductModel alloc]init];
            model.productName = [NSString stringWithFormat:@"第%ld页 第%ld个东西",self.page,i];
            NSInteger status = arc4random_uniform(3) + 1;
            model.status = [NSString stringWithFormat:@"%ld",status];
            
            ProductItemViewModel *itemViewModel = [[ProductItemViewModel alloc]initWithProduct:model];
            [self.dataSource addObject:itemViewModel];
        }
        
        self.loaded = YES;
    } fail:^(NSString * _Nonnull failMsg) {
        
    }];
}

- (void)requestDataParam:(NSDictionary *)param success:(void (^)(NSArray * _Nonnull))success fail:(void (^)(NSString * _Nonnull))fail
{
    sleep(1);
    success(@[]);
}


@end
