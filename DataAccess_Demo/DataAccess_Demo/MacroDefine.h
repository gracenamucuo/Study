//
//  MacroDefine.h
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//


#import <objc/runtime.h>
#define encodeRuntime(ClassName) \
\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([ClassName class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[aCoder encodeObject:value forKey:key];\
}\
free(ivars);\
\


#define initCoderRuntime(ClassName) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([ClassName class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [aDecoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

