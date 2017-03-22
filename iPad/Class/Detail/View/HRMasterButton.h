//
//  HRMasterButton.h
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HRDetailModel;
@interface HRMasterButton : UIButton

@property (strong, nonatomic) HRDetailModel *detailItem;

// 类方法创建
+ (instancetype)buttonWithItem:(HRDetailModel *)item;

@end
