//
//  HRMasterViewModel.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRMasterViewModel.h"
#import "HRDetailModel.h"

@implementation HRMasterViewModel
{
    NSArray<HRDetailModel *> *_menumItems;
}

- (NSArray<HRDetailModel *> *)menumItems{
    if (!_menumItems) {
        NSArray *data =  @[
                            @{ @"title":@"首页", @"controllerClassName":@"HRHomeViewController"},
                            @{ @"title":@"数据", @"controllerClassName":@"HRDataViewController"},
                            @{ @"title":@"朋友", @"controllerClassName":@"HRFriendViewController"},
                            @{ @"title":@"设置", @"controllerClassName":@"HRSettingViewController"}
                            ];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in data) {
            HRDetailModel *model = [HRDetailModel itemWithDict:dict];
            [array addObject:model];
        }
        _menumItems = array.copy;
    }
    return _menumItems;
}

@end
