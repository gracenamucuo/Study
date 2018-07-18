//
//  UITableView+ETRefresh.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UITableView+ETRefresh.h"
#import "ETRefreshNormalHeader.h"
#import "ETRefreshGifHeader.h"
#import "ETRefreshAutoNormalFooter.h"
#import "ETRefreshAutoGifFooter.h"
#import "ETRefreshBackNormalFooter.h"
#import "ETRefreshBackGifFooter.h"
@implementation UITableView (ETRefresh)
- (void)et_beginRefreshing
{
    [self.mj_header beginRefreshing];
}

- (void)et_endRefresh
{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}
- (void)et_noMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark --Header
- (void)et_normalHeaderWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshNormalHeader *normal = [ETRefreshNormalHeader headerWithRefreshingBlock:^{
        block();
    }];
    normal.headerHeight = 100;
    normal.stateLabel.textColor = [UIColor whiteColor];
    normal.stateLabel.font = [UIFont boldSystemFontOfSize:25];
    self.mj_header =normal;
}

- (void)et_gifHeaderWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshGifHeader *gif = [ETRefreshGifHeader headerWithRefreshingBlock:^{
        block();
    }];
    gif.headerHeight = 100;
    gif.stateLabel.textColor = [UIColor whiteColor];
    gif.stateLabel.font = [UIFont boldSystemFontOfSize:25];
    NSMutableArray *logoImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_a_%ld",i]];
        [logoImages addObject:image];
    }
    gif.lastUpdatedTimeLabel.textColor = [UIColor whiteColor];
    [gif setImages:logoImages forState:MJRefreshStateIdle];
    [gif setImages:logoImages forState:MJRefreshStatePulling];
    [gif setImages:logoImages forState:MJRefreshStateRefreshing];
    self.mj_header = gif;
}

#pragma mark -- BackFooter
- (void)et_backNormalFooterWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshBackNormalFooter *normal = [ETRefreshBackNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
    normal.footerHeight = 100;
    normal.stateLabel.textColor = [UIColor whiteColor];
    normal.stateLabel.font = [UIFont boldSystemFontOfSize:30];
    self.mj_footer = normal;
}
- (void)et_backGifFooterWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshBackGifFooter *gif = [ETRefreshBackGifFooter footerWithRefreshingBlock:^{
        block();
    }];
    gif.stateLabel.textColor = [UIColor whiteColor];
    gif.stateLabel.font = [UIFont boldSystemFontOfSize:20];
    gif.footerHeight = 100;
    NSMutableArray *logoImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_a_%ld",i]];
        [logoImages addObject:image];
    }
    [gif setImages:logoImages forState:MJRefreshStateIdle];
    [gif setImages:logoImages forState:MJRefreshStatePulling];
    [gif setImages:logoImages forState:MJRefreshStateRefreshing];
    self.mj_footer = gif;
    
    
}
#pragma mark -- AutoFooter
- (void)et_autoNormalFooterWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshAutoNormalFooter *normal = [ETRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
    normal.footerHeight = 100;
    normal.stateLabel.textColor = [UIColor whiteColor];
    normal.stateLabel.font = [UIFont boldSystemFontOfSize:30];
    self.mj_footer = normal;
}

- (void)et_autoGifFooterWithRefreshingBlock:(void (^)(void))block
{
    ETRefreshAutoGifFooter *gif = [ETRefreshAutoGifFooter footerWithRefreshingBlock:^{
        block();
    }];
    gif.stateLabel.textColor = [UIColor whiteColor];
    gif.stateLabel.font = [UIFont boldSystemFontOfSize:20];
    gif.footerHeight = 100;
    NSMutableArray *logoImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_a_%ld",i]];
        [logoImages addObject:image];
    }
    [gif setImages:logoImages forState:MJRefreshStateIdle];
    [gif setImages:logoImages forState:MJRefreshStatePulling];
    [gif setImages:logoImages forState:MJRefreshStateRefreshing];
    self.mj_footer = gif;
}
@end
