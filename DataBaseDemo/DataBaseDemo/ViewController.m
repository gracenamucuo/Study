//
//  ViewController.m
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "JQFMDB.h"
#import "ETIMTestModel.h"
#import "ETIMDataBaseManager.h"
#import "TestLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createDataBase];
//    [self create];
//    [self test];
    [self testLabel];
}

- (void)testLabel
{
//    TestLabel *label = [[TestLabel alloc]initWithFrame:CGRectMake(40, 0, 100, 100)];
//    label.backgroundColor = [UIColor redColor];
//    label.font = [UIFont systemFontOfSize:16];
//    label.text = @"你好 1234ABBFF 得意洋洋晕晕晕dfggggggggggs";
//    label.numberOfLines = 0;
//    [self.view addSubview:label];
    
    
    TestLabel *label1 = [[TestLabel alloc]init];
//    label1.textInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    label1.backgroundColor = [UIColor redColor];
    label1.font = [UIFont systemFontOfSize:14];
    label1.text = @"回家哈刚看";
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:label1.text];
    [attri addAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]} range:NSMakeRange(0, label1.text.length)];
    label1.attributedText = attri;
   CGSize h = [self calHeightWithText:label1.text];
//    label1.numberOfLines = 0;
    label1.frame = CGRectMake(40, 120, 100, 100);
    [self.view addSubview:label1];
}

- (CGSize)calHeightWithText:(NSString *)text
{
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 2;
    
    NSDictionary* attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 NSParagraphStyleAttributeName: paragraphStyle,
                                 NSForegroundColorAttributeName: [UIColor blackColor]};
    CGSize limitSize = CGSizeMake(100, MAXFLOAT);
    CGRect rect = [text boundingRectWithSize:limitSize
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:attributes
                                          context:nil];
    return CGSizeMake(ceilf(rect.size.width), ceilf(rect.size.height));
}

- (void)test
{
//    ETIMDataBaseManager *dbManager = [ETIMDataBaseManager shareDatabaseManager];
//    NSArray *names = [dbManager allDBNames];
//    NSLog(@"%@",names);
//    [dbManager deleteDataBase:@"third"];
//    [dbManager deleteDataBase:@"secDB"];
//    [dbManager createDataBase:@"test"];
//    ETIMTestModel *model = [[ETIMTestModel alloc]initWithName:@"test" model_id:@"test_id" age:10];
//    [dbManager createTable:@"test" inDataBase:@"test" modelCls:[model class]];
//    JQFMDB *f = [[JQFMDB alloc]initWithDBName:@"test.sqlite" path:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"]];
//    [f jq_createTable:@"test" dicOrModel:model excludeName:nil];
//    [dbManager insertTable:@"test" inDataBase:@"test" model:model];
    
//    JQFMDB *f =[[JQFMDB alloc]initWithDBName:@"tt.sqlite" path:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"]];
//    [f jq_createTable:@"test" dicOrModel:[ETIMTestModel new] excludeName:nil];

//    JQFMDB *f = [JQFMDB shareDatabase:@"t.sqlite" path:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"]];
//    [f jq_createTable:@"test" dicOrModel:[ETIMTestModel new] excludeName:nil];
    
//    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(thred1) object:nil];
//    NSThread *t2  =[[NSThread alloc]initWithTarget:self selector:@selector(thread2) object:nil];
//    [t1 start];
//    [t2 start];
    
    ETIMDataBaseManager *dbManager = [ETIMDataBaseManager shareDatabaseManager];
   NSInteger pkid = [dbManager lastInsertPrimaryKeyIDTableName:@"test1" inDataBase:@"test1"];
  NSArray *arr =  [dbManager lookUpTable:@"test1" inDataBase:@"test1" model:NSClassFromString(@"ETIMTestModel") whereFormat:[NSString stringWithFormat:@"where pkid = %d",pkid]];
    NSArray *ten = [dbManager acquireTenModelsBeforeModel:[arr lastObject] tableName:@"test1" inDataBase:@"test1"];
    for (id model in ten) {
        NSLog(@"%@",[model valueForKeyPath:@"pkid"]);
    }
}

- (void)thred1
{
    ETIMDataBaseManager *dbManager = [ETIMDataBaseManager shareDatabaseManager];
    [dbManager createDataBase:@"test1"];
    [dbManager createTable:@"test1" inDataBase:@"test1" modelCls: NSClassFromString(@"ETIMTestModel")];
    ETIMTestModel *model = [[ETIMTestModel alloc]initWithName:@"1" model_id:@"1id" age:1];
    for (NSInteger i = 0; i < 1000; i++) {
        [dbManager insertTable:@"test1" inDataBase:@"test1" model:model];
    }
}

- (void)thread2
{
    ETIMDataBaseManager *dbManager = [ETIMDataBaseManager shareDatabaseManager];
    [dbManager createDataBase:@"test2"];
    
    ETIMTestModel *model = [[ETIMTestModel alloc]initWithName:@"2" model_id:@"2id" age:2];
    [dbManager createTable:@"test2" inDataBase:@"test2" modelCls:[model class]];
    for (NSInteger i = 0; i < 1000; i++) {
        [dbManager insertTable:@"test2" inDataBase:@"test2" model:model];
    }

}

- (void)createDataBase
{
    JQFMDB *dbManager = [JQFMDB shareDatabase:@"firstDB.sqlite"];
    [dbManager jq_createTable:@"table1" dicOrModel:[ETIMTestModel new]];
//    NSInteger last = [dbManager lastInsertPrimaryKeyId:@"table1"];
    
//    [dbManager jq_deleteTable:@"table1" whereFormat:[NSString stringWithFormat:@"where pkid = %ld",(long)last]];
//    [dbManager jq_deleteTable:@"table1" whereFormat:@"where pkid = 8"];
//    [dbManager jq_deleteTable:@"table1"];
//    NSArray *array = [dbManager jq_insertTable:@"table1" dicOrModelArray:[self models]];
////    NSLog(@"%@-----%@",array,[self models]);
//  NSArray *array1 =  [dbManager jq_lookupTable:@"table1" dicOrModel:[ETIMTestModel new] whereFormat:@""];
//
//    NSLog(@"%@",array1);
//    [self createDir];
//   NSString *path = [NSString stringWithFormat:@"%@/EasySale",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
//    JQFMDB *dbM1 = [JQFMDB shareDatabase:@"secDB.sqlite" path:path];
//    JQFMDB *db2 = [[JQFMDB alloc]initWithDBName:@"third.sqlite" path:path];
//    [self showAllFileWithPath:path];
    
}

- (NSArray*)models
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        ETIMTestModel *model = [[ETIMTestModel alloc]init];
        model.name = [NSString stringWithFormat:@"名字%ld",(long)i];
        model.model_id = [NSString stringWithFormat:@"mode id%ld",(long)i];
        model.age = i;
        [array addObject:model];
    }
    return array;
}

- (void)create
{
    JQFMDB *dbManager = [JQFMDB shareDatabase:@"firstDB.sqlite"];
    [dbManager jq_createTable:@"table1" dicOrModel:[ETIMTestModel new]];
//   NSInteger last = [dbManager lastInsertPrimaryKeyId:@"table1"];
//    [dbManager jq_updateTable:@"table1" dicOrModel:[ETIMTestModel new] whereFormat:@""];
//  NSArray *array = [dbManager jq_lookupTable:@"table1" dicOrModel:[ETIMTestModel class] whereFormat:[NSString stringWithFormat:@"limit %d,%d",(last - 10),last]];
////    NSLog(@"%ld",(long)last);
//    NSLog(@"%@",array);
//    if (array.count > 0) {
//        for (ETIMTestModel *model in array) {
//            NSLog(@"%ld",(long)model.pkid);
//        }
//    }
    ETIMTestModel *model = [[ETIMTestModel alloc]init];
    model.name = @"123";
    model.age = 1;
    model.model_id = @"hhhh";
    model.add1 = @"add1";
    model.add2 = 000;
    [dbManager jq_alterTable:@"table1" dicOrModel: [ETIMTestModel new]];
    [dbManager jq_insertTable:@"table1" dicOrModelArray:@[model]];
    [dbManager jq_deleteAllDataFromTable:@"table1"];
      NSArray *array0 = [dbManager jq_lookupTable:@"table1" dicOrModel:[ETIMTestModel new] whereFormat:@""];
    NSLog(@"%@",array0);
}

- (void)createDir {
    
    NSString * docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataFilePath = [docsdir stringByAppendingPathComponent:@"EasySale"]; // 在Document目录下创建 "archiver" 文件夹
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:dataFilePath isDirectory:&isDir];
    
    if (!(isDir && existed)) {
        // 在Document目录下创建一个archiver目录
        [fileManager createDirectoryAtPath:dataFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
//    [self showAllFileWithPath:dataFilePath];
//    // 在archiver下写入文件
//    NSString *path = [dataFilePath stringByAppendingPathComponent:@"my.txt"];
//    NSString *text = @"It's a beautiful day.";
//    BOOL writeSuccess = [text writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    if (writeSuccess) {
//        NSLog(@"写入成功");
//    }
}


- (void)showAllFileWithPath:(NSString *) path {
    NSFileManager * fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        if (isDir) {
            NSArray * dirArray = [fileManger contentsOfDirectoryAtPath:path error:nil];
            NSString * subPath = nil;
            for (NSString * str in dirArray) {
                subPath  = [path stringByAppendingPathComponent:str];
                BOOL issubDir = NO;
                [fileManger fileExistsAtPath:subPath isDirectory:&issubDir];
                [self showAllFileWithPath:subPath];
            }
        }else{
            NSString *fileName = [[path componentsSeparatedByString:@"/"] lastObject];
            NSLog(@"%@",fileName);
        }
    }else{
        NSLog(@"this path is not exist!");
    }
}
@end



















































































































































































































































