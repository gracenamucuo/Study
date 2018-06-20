//
//  ViewController.m
//  DataPersistence_Demo
//
//  Created by 戴运鹏 on 2018/6/20.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy)NSString *fileName;
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
    //1 plist
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"test.plist"];
    self.fileName = fileName;
    NSArray *array = @[@"112",@"3"];
    [array writeToFile:fileName atomically:YES];
    //2
    NSUserDefaults *userDeafaults = [NSUserDefaults standardUserDefaults];
    [userDeafaults setObject:@"test" forKey:@"test"];
//    [userDeafaults synchronize];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSArray *result = [NSArray arrayWithContentsOfFile:self.fileName];
    
    NSString *test = [[NSUserDefaults standardUserDefaults]objectForKey:@"test"];
    
}


@end


















