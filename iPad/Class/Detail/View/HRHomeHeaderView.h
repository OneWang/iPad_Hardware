//
//  HRHomeHeaderView.h
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HRHomeHeaderView;
@protocol HRHomeHeaderViewDelegate <NSObject>

@optional
- (void)hr_homeHeaderView:(HRHomeHeaderView *)headerView didSelectedTeam:(UIButton *)button;

@end

@interface HRHomeHeaderView : UIView

@property (weak, nonatomic) id<HRHomeHeaderViewDelegate> delegate;

@end
