//
//  MenuComposite.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MenuComposite.h"

@implementation MenuComposite

- (instancetype)initWithMenuItemWithName:(NSString *)name withDesc:(NSString *)desc
{
    if (self = [super init]) {
        _name = name;
        _desc = desc;
        _menuChildArr = [NSMutableArray array];
    }
    return self;
}

- (NSString *)getDescription
{
    return self.desc;
}

- (NSString *)getName
{
    return self.name;
}

- (void)add:(id<MenuComponentProtocol>)component
{
    [self.menuChildArr addObject:component];
}

- (void)remove:(id<MenuComponentProtocol>)component
{
    [self.menuChildArr enumerateObjectsUsingBlock:^(id<MenuComponentProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == component) {//直接就是该节点的叶节点
            [self.menuChildArr removeObject:component];
        }else{//在该节点的子节点中
            if ([obj isKindOfClass:[MenuComposite class]]) {
                    [obj remove:component];//递归删除
            }
        }
    }];
}

- (id<MenuComponentProtocol>)getChild:(NSInteger)position
{
    return self.menuChildArr[position];
}

- (void)print{
    NSLog(@"菜单名称：%@ | 菜单描述：%@",self.name,self.desc);
    if (self.menuChildArr.count > 0) {
        for (id<MenuComponentProtocol> component in self.menuChildArr) {
            [component print];
        }
    }
}
@end





















