//
//  BaseCollectionView.h
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BaseCollectionViewOperateDelegate <NSObject>

- (void)willChangeIndexPath:(NSIndexPath *)oldIndexPath;
- (void)moveEndOldIndexPath:(NSIndexPath *)oldIndexPath currentIndexPath:(NSIndexPath *)newIndexPath;
- (void)moveToCurrentIndexPath:(NSIndexPath*)currentIndexPath empty:(BOOL)empty;
@end

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionView : UICollectionView

@property (nonatomic,weak)id<BaseCollectionViewOperateDelegate> operateDelegate;

@end

NS_ASSUME_NONNULL_END
