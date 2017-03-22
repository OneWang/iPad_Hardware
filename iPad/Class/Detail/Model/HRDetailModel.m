//
//  HRDetailModel.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRDetailModel.h"

@implementation HRDetailModel

+ (instancetype)itemWithDict:(NSDictionary *)dict{
    // 创建模型对象
    HRDetailModel *item = [[self alloc] init];
    // KVC
    [item setValuesForKeysWithDictionary:dict];
    return item;
}


@end
