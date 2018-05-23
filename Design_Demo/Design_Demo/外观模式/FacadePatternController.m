//
//  FacadePatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FacadePatternController.h"
#import "Facade.h"
#import "TravelAgency.h"
@interface FacadePatternController ()

@end

@implementation FacadePatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    Facade *facade = [[Facade alloc]init];
    [facade operation];
    
    //将旅行的事情完全交给旅行社办理
    TravelAgency *travelFacade = [[TravelAgency alloc]init];
    [travelFacade travel];
}



@end
