//
//  ViewController.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "ETIMDataBaseManager.h"
#import "JQFMDB.h"
#import "YYText/YYLabel.h"
#import "Sec.h"
#import "ETIMCellLayoutConfig.h"
#import "TestLabel.h"
#import "YYModel/YYModel.h"
@interface ViewController ()
@property (nonatomic,strong)dispatch_source_t timer;
@property (nonatomic,assign)NSInteger count;
@end

@implementation ViewController
- (IBAction)pushAction:(UIButton *)sender {
    Sec *secvc = [[Sec alloc]init];
    [self.navigationController pushViewController:secvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    self.count = 10;
//    NSLog(@"======");
    [self testYYLabel];
////    [self testDataBase];
//    [self testModel];
    
}

- (void)testModel
{
    TestModel *model = [[TestModel alloc]init];
    
    NSDictionary *dic = [model yy_modelToJSONObject];
    
}


- (void)testYYLabel
{
    TestLabel *label = [[TestLabel alloc]init];
//    label.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    label.textInsets = UIEdgeInsetsMake(0, 30, 0, 30);
    label.backgroundColor = [UIColor redColor];
    TestModel *model = [TestModel initWithStr:@"2春宵一刻值千金，花有清香月有阴。\n歌管楼台声细细，秋千院落夜沉沉。"];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:model.content];
    ETIMCellLayoutConfig *config = [ETIMCellLayoutConfig new];
    [attri addAttributes:[config textMsgAtttiDicWithTextColor:nil] range:NSMakeRange(0, model.content.length)];
    label.attributedText = attri;
    label.numberOfLines = 0;// that, 'Hey, there's this Scotchgard chemical and uh, it's getting into the fish right next to the old tannery that, you know, by the way happened to use this stuff Ellison said as he walked along the Rogue River in Rockford.Scotchgard, made by 3M, was used to waterproof the Wolverine company's Hush Puppy line of shoes. Scotchgard is made with a PFAS chemical. The tannery was right next to the Rogue River in downtown Rockford.
    label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];
    CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    label.frame = CGRectMake(0, 90, size.width + 60, size.height);
    
    
    
//   CGFloat boundsHeght = [model textHeight];
//       label.frame = CGRectMake(0, 90, [[UIScreen mainScreen] bounds].size.width, boundsHeght);
    [self.view addSubview:label];
}

- (void)testDataBase
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < 20; i++) {
            TestModel *t = [TestModel initWithStr:[NSString stringWithFormat:@"第三%ld",(long)i]];
            [arr addObject:t];
        }
         NSLog(@"%@",[NSThread currentThread]);
        [[ETIMDataBaseManager shareDatabaseManager]insertTable:@"IM123" inDataBase:@"Test" modelArray:arr completion:^(NSArray * _Nonnull unInsertArray) {
            
        }];
    });

//    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//    });
    
//  dispatch_async(dispatch_get_main_queue(), ^{
//      [[ETIMDataBaseManager shareDatabaseManager]lookUpTable:@"IM123" inDataBase:@"Test" model:[TestModel class] whereFormat:@"where pkid > 15" completion:^(NSArray * _Nonnull result) {
//          NSLog(@"%@",[NSThread currentThread]);
//          if (result.count > 0) {
//              for (TestModel *model in result) {
//                  NSLog(@"啊啊%d",model.pkid);
//              }
//          }
//      }];
//  });
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSMutableArray *arr = [NSMutableArray array];
//        for (NSInteger i = 0; i < 10; i++) {
//            TestModel *t = [TestModel initWithStr:[NSString stringWithFormat:@"第四%ld",(long)i]];
//            [arr addObject:t];
//        }
//
//        [[ETIMDataBaseManager shareDatabaseManager]insertTable:@"IM123" inDataBase:@"Test" modelArray:arr completion:^(NSArray * _Nonnull unInsertArray) {
//
//        }];
   
//    });
    
}



@end
