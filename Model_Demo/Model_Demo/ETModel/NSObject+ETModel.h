//
//  NSObject+ETModel.h
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ETModel)

/**
 返回对应的model

 @param json 通过json格式数据转过来NSDictionary，NSString，NSData
 @return 返回model或nil
 */
+ (nullable instancetype)et_modelWithJSON:(id)json;

/**
 返回Model

 @param dictionary 通过json格式数据转过来的NSDictionary
 @return 返回model或nil
 */
+ (nullable instancetype)et_modelWithDictionary:(NSDictionary *)dictionary;

/**
 是否将json中对应的数据映射到model实例上

 @param json 通过json格式数据转过来NSDictionary，NSString，NSData
 @return 是否映射成功。
 */
- (BOOL)et_modelSetWithJson:(id)json;

/**
 通过字典将将其value映射到model实例

 @param dic 和model属性名称对应的key的字典
 @return 是否映射成功
 */
- (BOOL)et_modelSetWithDictionary:(NSDictionary *)dic;


/**
 将model按照属性名称及对应的值 生成符合json格式的对象，NSDictionary NSArray

 @return json对象
 */
- (nullable id)et_modelToJSONObject;


/**
 生成json string的NSData对象

 @return NSData对象
 */
- (nullable NSData *)et_modelToJSONData;

/**
 将model按照属性生成json字符串

 @return json字符串
 */
- (nullable NSString *)et_modelToJSONString;


/**
 copy一份实例

 @return model的copy
 */
- (nullable id)et_modelCopy;


/**
 通过归档对象，编码model

 @param aCoder 归档对象
 */
- (void)et_modelEncodeWithCoder:(NSCoder *)aCoder;


/**
 将编码的对象解码

 @param aDecoder 归档对象
 @return 解码的对象
 */
- (id)et_modelInitWithCoder:(NSCoder *)aDecoder;


/**
 对比两个model是否相等 要地址也相等？？

 @param model 进行对比的model
 @return 是否相等 
 */
- (BOOL)et_modelIsEqual:(id)model;


/**
 返回基于model属性的描述信息

 @return 属性字符串
 */
- (NSString *)et_modelDescription;
@end

#pragma mark -- NSArray 的model分类
@interface NSArray (ETModel)


/**
 返回一个model数组

 @param cls model的类型
 @param json 最外层是数组的json对象 (数组/json字符串/data)
 @return model数组
 */
+ (nullable NSArray *)et_modelArrayWithClass:(Class)cls json:(id)json;

@end

#pragma mark -- NSDictioary 的model分类
@interface NSDictionary (ETModel)

/**
 返回value时model的字典

 @param cls model的类型
 @param json dictionary格式的json对象(NSDictionary/NSString/NSData)
 @return 返回字典
 */
+ (nullable NSDictionary *)et_modelDictionaryWithClass:(Class)cls json:(id)json;

@end


