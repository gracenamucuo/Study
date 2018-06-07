//
//  ChangerDecrator.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Transformers.h"
@interface ChangerDecrator : Transformers//装饰者

@property (nonatomic,strong)Transformers *transformer;
/*
 装饰者模式的用途就是给类增加功能。OC的类别能实现该效果。
 有四个角色：抽象组件；具体组件(就是要增加功能的类)；抽象装饰者；具体装饰者(分别增加不同的功能)。
 具体组件和抽象装饰者都继承于抽象组件。抽象装饰者并且持有一个组件的引用。最后在调用具体装饰者的方法(move)的时候，能给具体组件增加功能(talk)。具体装饰者在重写move方法的时候，会调用新增的方法。
 
 */

///更为恰当的例子；星巴克点餐系统；黑咖啡 白咖啡 拿铁 让后将用装饰者给各种主饮料增加调料。(奶泡，豆浆等)

@end
