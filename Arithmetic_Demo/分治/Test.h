//
//  Test.h
//  分治
//
//  Created by 戴运鹏 on 2018/10/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Test : NSObject
    //递归求数组和
- (NSInteger)sum:(NSArray*)array;
    
    //快排
- (NSArray *)quicksort:(NSArray *)array;
    
//二分查找
//- (NSInteger)index

//BFS
//用字典表示图，创建一个队列，先将一度关系的节点加入到队列中，队列中节点，以此出队，判断出队的节点是否是要找的目标节点，如果不是，将该节点的关系（二度或更多）也加入队列，继续从队列中出队，找是否是目标节点，直至队列为空。检查节点时，要检查该节点是否被检查过。用一个列表来检查是已被检查过的人。
@end


