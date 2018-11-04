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
#import "UICollectionView+Rect.h"
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
    

    
    
    
    for (NSInteger i = 0; i < 6; i++) {
        StyleModel *model = [[StyleModel alloc]init];
        model.index = i;
        
        if (i == 0) {
            model.content = @"商品单价";
            model.type = 1;
        }
        if (i == 1) {
            model.content = @"";
            model.type =1;
        }
        
        if (i == 2 || i == 3) {
            model.type = 2;
        }
        
        if (i ==4) {
            model.content = @"颜色";
            model.type = 1;
        }
        if (i == 5) {
            model.content = @"尺码";
            model.type = 1;
        }
        
        [self.dataArray addObject:model];
    }
}

- (void)willChangeIndexPath:(NSIndexPath *)oldIndexPath
{
    
    
    if (self.dataArray.count > oldIndexPath.item) {
        StyleModel *oldModel = self.dataArray[oldIndexPath.item];
        if (oldModel.type == 2 || oldModel.content.length <= 0) {
            return;
        }
        
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

- (void)moveEndOldIndexPath:(NSIndexPath *)oldIndexPath currentIndexPath:(NSIndexPath *)newIndexPath
{
    //原位置不动
    if (oldIndexPath.item == newIndexPath.item||newIndexPath == nil) {
        if (self.dataArray.count > oldIndexPath.item) {
            StyleModel *oldModel = self.dataArray[oldIndexPath.item];
            oldModel.hidden = NO;
        }
        [self handleModelWithStyle:0];
        return;
    }
    
    
    if (self.dataArray.count > oldIndexPath.item && self.dataArray.count > newIndexPath.item) {
        StyleModel *oldModel = self.dataArray[oldIndexPath.item];
        oldModel.hidden = NO;
        StyleModel *newModel = self.dataArray[newIndexPath.item];
        if (newModel.type == 1) {//替换
            [self.dataArray replaceObjectAtIndex:newIndexPath.item withObject:oldModel];
            StyleModel *defaultModel = [[StyleModel alloc]init];
            defaultModel.type = 1;
            defaultModel.index = oldIndexPath.item;
            [self.dataArray replaceObjectAtIndex:oldIndexPath.item withObject:defaultModel];
        
            [self handleOldLineWithReplaceModel:defaultModel];
         
        }
        
        if (newModel.type == 2) {//插入
            StyleModel *defaultModel = [[StyleModel alloc]init];
            defaultModel.type = 1;
            defaultModel.index = oldIndexPath.item;
            [self.dataArray replaceObjectAtIndex:oldIndexPath.item withObject:defaultModel];
            [self handleNewLineWithNewIndexPath:newIndexPath oldModel:oldModel];
            [self handleOldLineWithReplaceModel:defaultModel];
        }
        
        [self handleModelWithStyle:0];
    }
    
    
}

///旧行处理
- (void)handleOldLineWithReplaceModel:(StyleModel *)replaceModel
{
    NSInteger index = [self.dataArray indexOfObject:replaceModel];
    NSIndexPath *replacePath = [NSIndexPath indexPathForRow:index inSection:0];
    CGRect oldFrame = [self.collectionView rectForRowAtIndexPath:replacePath];
    if (CGRectGetMaxX(oldFrame) == self.view.frame.size.width / 2) {//靠左
        if (self.dataArray.count > replacePath.item + 1) {
            StyleModel *nextModel = self.dataArray[replacePath.item + 1];
            if (nextModel.content.length <= 0 && replaceModel.content.length <= 0) {
                [self.dataArray removeObject:replaceModel];
                [self.dataArray removeObject:nextModel];
                [self.dataArray removeObjectAtIndex:self.dataArray.count - 1];
                [self.dataArray removeObjectAtIndex:self.dataArray.count - 1];
            }
        }
        
    }else{
        
        StyleModel *formerModel = self.dataArray[replacePath.item - 1];
        if (formerModel.content.length <= 0&&replaceModel.content.length <=0) {
            [self.dataArray removeObject:replaceModel];
            [self.dataArray removeObject:formerModel];
            [self.dataArray removeObjectAtIndex:self.dataArray.count - 1];
            [self.dataArray removeObjectAtIndex:self.dataArray.count - 1];
        }
        
    }

    
}

///插入处理新行
- (void)handleNewLineWithNewIndexPath:(NSIndexPath*)newIndexPath oldModel:(StyleModel *)oldModel
{
    NSMutableArray *tmp = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        StyleModel *model = [[StyleModel alloc]init];
        if (i == 0) {
            model.type = 1;
        }else{
            model.type = 2;
        }
        [tmp addObject:model];
    }
    if (newIndexPath.item %2 == 0) {
        [self.dataArray insertObject:oldModel atIndex:newIndexPath.item + 2];
        [self.dataArray insertObject:tmp[0] atIndex:newIndexPath.item + 3];
        [self.dataArray insertObject:tmp[1] atIndex:newIndexPath.item + 4];
        [self.dataArray insertObject:tmp[2] atIndex:newIndexPath.item + 5];
    }else{
        [self.dataArray insertObject:tmp[0] atIndex:newIndexPath.item + 1];
        [self.dataArray insertObject:oldModel atIndex:newIndexPath.item + 2];
        [self.dataArray insertObject:tmp[1] atIndex:newIndexPath.item + 3];
        [self.dataArray insertObject:tmp[2] atIndex:newIndexPath.item + 4];
    }
 
    
}


- (void)moveToCurrentIndexPath:(NSIndexPath *)currentIndexPath empty:(BOOL)empty
{
//    if (empty) {
//        NSLog(@"空的");
//        return;
//    }
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
            return CGSizeMake(WIDTH / 2, 30);
        }else{
            return CGSizeMake(WIDTH/2, 15);
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
