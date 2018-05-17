//
//  AbstractFactoryController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AbstractFactoryController.h"
#import "SqliteFactory.h"
#import "User.h"
#import "City.h"
#import "SqliteUserInfo.h"
#import "SqliteSearchInfo.h"
#import "SqliteSettingsInfo.h"
@interface AbstractFactoryController ()

@end

@implementation AbstractFactoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    User *user = [[User alloc]init];
    City *city = [[City alloc]init];
    
    SqliteFactory *sqliteFactory = [[SqliteFactory alloc]init];
    SqliteUserInfo *userInfo = [sqliteFactory createUserInfo];
    [userInfo setUserName:user];
    
    SqliteSearchInfo *searchInfo = [sqliteFactory cerateSearchInfo];
    [searchInfo setSearchCity:city];
    
    SqliteSettingsInfo *settingInfo = [sqliteFactory createSettingsInfo];
    [settingInfo resetAllSettings];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
