//
//  CaffeineBeverage.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaffeineBeverage : NSObject

- (void)prepareRecipe;//模板方法  该方法里的某些步骤可以放出来让子类重写。从而进行区别不同
// 1烧水  2泡茶或泡咖啡豆 3倒入杯子  4加佐料(茶加柠檬；咖啡加牛奶)
//这个模板方法中有四个步骤，1和3步骤是必须的，而且还是一样的，可以放在基类中实现。2和4是子类自己实现的，要有其自己实现。而且4是可有可无的，可以用一个钩子方法将方法4的有无由子类去决定。
- (void)brew;//第2步冲泡
- (void)addCondiments;//第4步加入佐料
- (BOOL)addHook;//是否加入佐料的钩子方法。
@end
