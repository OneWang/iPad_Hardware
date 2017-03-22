//
//  HRSplitViewController.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRSplitViewController.h"
#import "HRMasterViewController.h"

@interface HRSplitViewController ()
@property (weak, nonatomic) HRMasterViewController *masterVC;
@end

@implementation HRSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置子控制器
    [self setupChildViewController];

}

- (void)setupChildViewController{
    HRMasterViewController *masterVC = [[HRMasterViewController alloc] init];
    self.masterVC = masterVC;
    [self addChildViewController:masterVC];
    
    self.maximumPrimaryColumnWidth = 80;
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    // 监听设备朝向变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChangeNotification) name:UIDeviceOrientationDidChangeNotification object:nil];
}

// 监听设备朝向变化时调用的方法
- (void)orientationDidChangeNotification{
    BOOL isPortrait = UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation);
    
    // 根据横竖屏变化,设置不同的主视图宽度
    if (isPortrait) {
        // 竖屏
        self.maximumPrimaryColumnWidth = 80;
    }else {
        // 横向
        self.maximumPrimaryColumnWidth = 200;
    }
    
    // 根据横竖屏更新撰写区子控件布局
//    [self.masterVC updateSubViewsWithPortrait:isPortrait];
    
}


@end
