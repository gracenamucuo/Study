//
//  ViewController.m
//  DragCollectionView
//
//  Created by 戴运鹏 on 2018/10/31.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "SpaceCell.h"
#import "TestCell.h"
#import "StyleModel.h"
#import "BaseCollectionView.h"
#define WIDTH [[UIScreen mainScreen]bounds].size.width
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,BaseCollectionViewOperateDelegate>
@property (weak, nonatomic) IBOutlet BaseCollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
static NSString *spaceCellID = @"spaceCellID";
static NSString *testCellID = @"testCellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    self.dataArray = [NSMutableArray array];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TestCell class]) bundle:nil] forCellWithReuseIdentifier:testCellID];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SpaceCell class]) bundle:nil] forCellWithReuseIdentifier:spaceCellID];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing =0;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.operateDelegate = self;
    for (NSInteger i = 0; i < 4; i++) {
        StyleModel *model = [[StyleModel alloc]init];
        model.index = i;
        if (i < 2) {
            model.type = 1;
        }else{
            model.type = 2;
        }
        [self.dataArray addObject:model];
    }
}

- (void)willChangeIndexPath:(NSIndexPath *)oldIndexPath
{
    if (self.dataArray.count > oldIndexPath.item) {
        StyleModel *oldModel = self.dataArray[oldIndexPath.item];
        oldModel.hidden = YES;
    }
    
    [self handleModelWithStyle:1];
    
}

- (void)handleModelWithStyle:(NSInteger)style
{
    for (StyleModel *model in self.dataArray) {
        model.style = style;
    }
}

- (void)showOldIndexPath:(NSIndexPath *)oldIndexPath
{
    if (self.dataArray.count > oldIndexPath.item) {
        StyleModel *oldModel = self.dataArray[oldIndexPath.item];
        oldModel.hidden = NO;
    }
    [self handleModelWithStyle:0];
}

- (void)moveToCurrentIndexPath:(NSIndexPath *)currentIndexPath empty:(BOOL)empty
{
    if (self.dataArray.count > currentIndexPath.item) {
      
        for (NSInteger i = 0; i < self.dataArray.count; i++) {
            StyleModel *model = self.dataArray[i];
            if (i == currentIndexPath.item && !empty) {
                model.style = 2;
            }else{
                model.style = 1;
            }
        }
        
    }
}

///==================================================================================================================================================================================================================
#pragma mark -- 原生代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray.count > indexPath.row) {
        StyleModel *model = self.dataArray[indexPath.row];
        if (model.type == 1) {
            TestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:testCellID forIndexPath:indexPath];

            [cell configUIWithModel:model];
            return cell;
        }else{
            SpaceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:spaceCellID forIndexPath:indexPath];

            [cell configUIWithModel:model];
            return cell;
        }
        
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray.count > indexPath.row) {
        StyleModel *model = self.dataArray[indexPath.row];
        if (model.type == 1) {
            return CGSizeMake(WIDTH / 2, 50);
        }else{
            return CGSizeMake(WIDTH/2, 20);
        }
    }
    return CGSizeZero;
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
@end
