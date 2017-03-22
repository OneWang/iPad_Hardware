//
//  HRDetailModel.h
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRDetailModel : NSObject

// 按钮的标题
@property (nonatomic,copy) NSString *title;
// 按钮的图片名
@property (nonatomic,copy) NSString *imageName;
// 视图控制器名
@property (nonatomic,copy) NSString *controllerClassName;

// 类方法
+ (instancetype)itemWithDict:(NSDictionary *)dict;


@end
