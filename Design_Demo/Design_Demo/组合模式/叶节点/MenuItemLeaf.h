//
//  MenuItemLeaf.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuComponentProtocol.h"
@interface MenuItemLeaf : NSObject<MenuComponentProtocol>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,assign)BOOL isVegetarain;
@property (nonatomic,assign)CGFloat price;

- (instancetype)initMenuItemLeafWithName:(NSString *)name desc:(NSString *)desc price:(CGFloat)price isVege:(BOOL)isvege;
@end
