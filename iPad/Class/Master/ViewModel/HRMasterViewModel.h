//
//  HRMasterViewModel.h
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HRDetailModel;
@interface HRMasterViewModel : NSObject

///菜单区模型数组
@property (nonatomic,strong,readonly) NSArray <HRDetailModel *> *menumItems;

@end
