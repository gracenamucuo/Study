//
//  StyleModel.h
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StyleModel : NSObject

@property (nonatomic,assign)NSInteger type;//内容
@property (nonatomic,assign)NSInteger style;//样式  1显示黑线  2显示蓝线高亮  0正常
@property (nonatomic,assign)BOOL hidden;//是否隐藏
@property (nonatomic,assign)NSInteger index;
@end

NS_ASSUME_NONNULL_END
