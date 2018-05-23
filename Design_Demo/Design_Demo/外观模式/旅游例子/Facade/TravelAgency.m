//
//  TravelAgency.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TravelAgency.h"
#import "Hotel.h"
#import "Restaurant.h"
#import "Transportation.h"
#import "Spots.h"
@interface TravelAgency()

@property (nonatomic,strong)Hotel *hotel;
@property (nonatomic,strong)Restaurant *restaurant;
@property (nonatomic,strong)Transportation *transport;
@property (nonatomic,strong)Spots *spot;

@end

@implementation TravelAgency

- (instancetype)init
{
    self = [super init];
    if (self) {
        _hotel = [[Hotel alloc]init];
        _restaurant = [[Restaurant alloc]init];
        _transport = [[Transportation alloc]init];
        _spot = [[Spots alloc]init];
    }
    return self;
}

- (void)travel
{
    [self.hotel sleep];
    [self.restaurant eat];
    [self.transport traffic];
    [self.spot enjoy];
}

@end
