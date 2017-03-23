//
//  HRHomeListController.h
//  iPad
//
//  Created by LI on 2017/3/23.
//  Copyright © 2017年 LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HRHomeListControllerDelegate <NSObject>

@optional
- (void)hr_homeListControllerDidSelecteIndexPath:(NSIndexPath *)indexPath;

@end

@interface HRHomeListController : UITableViewController

@property (weak, nonatomic) id<HRHomeListControllerDelegate> delegate;

@end
