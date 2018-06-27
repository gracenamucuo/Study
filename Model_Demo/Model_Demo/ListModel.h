//
//  ListModel.h
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ListModel;
@interface ListTotalModel:NSObject

@property (nonatomic,strong)NSArray<ListModel *> *list;

@end

@interface ListModel : NSObject

@property (nonatomic,copy)NSString *item_no_names;
@property (nonatomic,copy)NSString *receivable_fee;
@property (nonatomic,copy)NSString *order_date;
@property (nonatomic,copy)NSString *cloud_order_status;
@property (nonatomic,copy)NSString *order_id;
@property (nonatomic,copy)NSString *cloud_channel_name;
@property (nonatomic,copy)NSString *cloud_refund_status;
@property (nonatomic,copy)NSString *arrear_fee;
@property (nonatomic,copy)NSString *remark;
@property (nonatomic,copy)NSString *cloud_channel_id;
@property (nonatomic,copy)NSString *is_delivery;
@property (nonatomic,copy)NSString *item_num;
@property (nonatomic,copy)NSString *order_no;
@property (nonatomic,copy)NSString *customer_is_delete;
@property (nonatomic,copy)NSString *spu_num;
@property (nonatomic,copy)NSString *customer_name;
@property (nonatomic,copy)NSString *status;

@end
