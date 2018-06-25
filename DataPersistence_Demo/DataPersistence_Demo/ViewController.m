//
//  ViewController.m
//  DataPersistence_Demo
//
//  Created by 戴运鹏 on 2018/6/20.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "YYModel.h"
#import "Food.h"
#import "ETSafeAccessHelper.h"
@interface ViewController ()
@property (nonatomic,copy)NSString *fileName;
@property (nonatomic,copy)NSString *file;
@end
/*
 NSArray;
 NSMutableArray;
 NSDictionary;
 NSMutableDictionary;
 NSData;
 NSMutableData;
 NSString;
 NSMutableString;
 NSNumber;
 NSDate;
*/
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    [self storageByPlist];
//    [self storageByPreference];
//    [self storageByArchive];
//        [self storageByYYModel];
    [self storageByYYCache];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    ETSafeAccessHelper *helper = [[ETSafeAccessHelper alloc]init];
    if ([helper objectForKey:@"letter"]) {
//        return;
    }
    [helper setObject:@[@"AAAAAA",@"BBBBB"] forKey:@"letter"];
    
   
}

///plist
- (void)storageByPlist
{
    //1 plist
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"test.plist"];
    self.fileName = fileName;
    Person *p = [[Person alloc]init];
    p.name = @"1";
    Food *f = [[Food alloc]init];
    f.foodName = @"苹果";
//    p.food = f;
    NSArray *array = @[@"112",@"3"];//plist文件保存不了自定义对象 如果加入自定义的对象，会保存失败
    [array writeToFile:fileName atomically:YES];
    
    NSArray *result = [NSArray arrayWithContentsOfFile:self.fileName];

}
///Preference
- (void)storageByPreference
{
    //2 Preference
    Person *p = [[Person alloc]init];
    p.name = @"1";
    Food *f = [[Food alloc]init];
    f.foodName = @"苹果";
//    p.food = f;
    
    NSUserDefaults *userDeafaults = [NSUserDefaults standardUserDefaults];
    [userDeafaults setObject:@"test" forKey:@"test"];//偏好设置不能直接保存自定义的对象，需要将其转换为NSData来保存，或者直接用归档
    [userDeafaults setURL:[NSURL URLWithString:@"testUrl"] forKey:@"url"];
    [userDeafaults setObject:@12 forKey:@"UUU"];
    [userDeafaults setObject:@[@"你好"] forKey:@"ttt"];
    [userDeafaults setObject:@{@"name":@"你好"} forKey:@"dic"];
    [userDeafaults setObject:[NSDate date] forKey:@"date"];
    [userDeafaults synchronize];
    NSLog(@"%d", [NSURL conformsToProtocol:@protocol(NSCoding)]);
   
    id obj = [[NSUserDefaults standardUserDefaults]objectForKey:@"test"];

}
///归档 解档
- (void)storageByArchive
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    //3
    Person *p = [[Person alloc]init];
    p.name = @"你好";
    p.age = @"123";
    Food *f = [[Food alloc]init];
    f.foodName = @"苹果";
        p.food = f;
    
    //3.1
    [[NSUserDefaults standardUserDefaults]setObject:[NSKeyedArchiver archivedDataWithRootObject:p] forKey:@"p"];
    //3.2
    NSString *file = [path stringByAppendingPathComponent:@"person"];//归解档一般情况下保存在doucoments文件夹下 此方法是拼接的生成的文件的名称。如果对自定义的对象进行归档和解档 需要实现<NSCOding>协议
    self.file = file;
    [NSKeyedArchiver archiveRootObject:p toFile:file];
    //3.1
    [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"p"]];
    //3.2
    [NSKeyedUnarchiver unarchiveObjectWithFile:self.file];
}


///YYModel
- (void)storageByYYModel
{
    Person *p = [[Person alloc]init];
    p.name = p.age = @"123";
    Food *f = [[Food alloc]init];
    f.foodName = @"apple";
    p.food = f;
    
    Person *p1 = [[Person alloc]init];
    p1.name = p1.age = @"ddd";
    
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[p,p1]];
   id value = [arr yy_modelToJSONString];
   id va = [NSArray yy_modelWithJSON:value];
    
    NSDictionary *dic = [p yy_modelToJSONObject];
//    Person *p1 = [Person yy_modelWithDictionary:dic];
    
    
}


///YYCache
- (void)storageByYYCache
{
    ETSafeAccessHelper *helper = [[ETSafeAccessHelper alloc]init];
    
    if ([helper objectForKey:@"num"]) {
//        return;
    }
    [helper setObject:@[@"苹果",@"梨子"] forKey:@"num"];
}


@end


















