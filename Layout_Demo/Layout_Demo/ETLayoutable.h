//
//  ETLayoutable.h
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Masonry.h"

typedef void(^LayoutMaker)(MASConstraintMaker *maker);

@protocol ETLayoutable <NSObject>

- (LayoutMaker)layoutMaker;

@end
