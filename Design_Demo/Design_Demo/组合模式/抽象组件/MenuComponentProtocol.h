//
//  MenuComponentProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol MenuComponentProtocol <NSObject>

- (void)add:(id<MenuComponentProtocol>)component;
- (void)remove:(id<MenuComponentProtocol>)component;
- (id<MenuComponentProtocol>)getChild:(NSInteger)position;
- (NSString*)getName;
- (NSString*)getDescription;
- (CGFloat)getPrice;
- (BOOL)isVegetarian;
- (void)print;
@end
