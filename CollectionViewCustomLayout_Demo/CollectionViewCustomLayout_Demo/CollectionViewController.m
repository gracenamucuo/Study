//
//  CollectionViewController.m
//  CollectionViewCustomLayout_Demo
//
//  Created by 戴运鹏 on 2018/5/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CollectionViewController.h"
#import "CircleLayout.h"
@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger cellCount;
@end
static NSString *cellID = @"cellID";
@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tap];
    [self.collectionView reloadData];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
     self.cellCount = 20;
    CircleLayout *layout = [[CircleLayout alloc]init];
    layout.cellCount = self.cellCount;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
   
}

- (void)handleTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint initialPinchPoint = [gesture locationInView:self.collectionView];
        NSIndexPath *tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath != nil) {
            self.cellCount = self.cellCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
            } completion:nil];
        }else{
            self.cellCount += 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end





















