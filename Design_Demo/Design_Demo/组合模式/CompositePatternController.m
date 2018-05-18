//
//  CompositePatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CompositePatternController.h"
#import "MenuComponentProtocol.h"
#import "MenuItemLeaf.h"
#import "MenuComposite.h"
@interface CompositePatternController ()

@end

@implementation CompositePatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MenuComposite *dinnerMenu = [[MenuComposite alloc]initWithMenuItemWithName:@"晚餐菜单" withDesc:@"粤菜"];
    MenuComposite *cafeMenu = [[MenuComposite alloc]initWithMenuItemWithName:@"咖啡馆菜单" withDesc:@"下午茶"];
    MenuComposite *allMenu = [[MenuComposite alloc]initWithMenuItemWithName:@"所有菜单" withDesc:@"所有菜品"];
    MenuComposite *dessertMenu = [[MenuComposite alloc]initWithMenuItemWithName:@"甜点菜单" withDesc:@"各种甜点"];
    [dinnerMenu add:dessertMenu];
    [allMenu add:dinnerMenu];
    [allMenu add:cafeMenu];
    
    MenuItemLeaf *item1 = [[MenuItemLeaf alloc]initMenuItemLeafWithName:@"红烧肉" desc:@"好吃" price:30 isVege:NO];
    MenuItemLeaf *item2 = [[MenuItemLeaf alloc]initMenuItemLeafWithName:@"西蓝花" desc:@"健康食品" price:20 isVege:YES];
    [dinnerMenu add:item1];
    [dinnerMenu add:item2];
    
    MenuItemLeaf *item3 = [[MenuItemLeaf alloc]initMenuItemLeafWithName:@"蛋挞" desc:@"甜食" price:5 isVege:YES];
    MenuItemLeaf *item4 = [[MenuItemLeaf alloc]initMenuItemLeafWithName:@"蘑菇汤" desc:@"咸汤" price:10 isVege:NO];
    [dessertMenu add:item3];
    [dessertMenu add:item4];
    
    
    [allMenu print];
    [allMenu remove:item4];
    NSLog(@"----------");
    [allMenu print];
    
}


@end






