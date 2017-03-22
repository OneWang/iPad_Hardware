//
//  HRDetailViewController.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRDetailViewController.h"
#import "HRDetailModel.h"
#import <Masonry.h>

@interface HRDetailViewController ()

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation HRDetailViewController{
    HRDetailModel *_masterItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置子控制器
    [self setupChildViewController];
    
    [self.navigationController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        // 这里直接设置上左下右是无效的,需要设置内边距
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 0, 0, 0));
    }];

}

- (instancetype)initWithMasterItem:(HRDetailModel *)item{
    if (self = [super init]) {
        _masterItem = item;
        
        UIView *maskView = [[UIView alloc ] init];
        maskView.backgroundColor = [UIColor colorWithWhite:34/255.0 alpha:1.0];
        [self.view insertSubview:maskView atIndex:0];
        [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, -2, 0, 0));
        }];

    }
    return self;
}

- (void)setupChildViewController{
    // 获取控制器类名
    NSString *className = _masterItem.controllerClassName;
    // 使用运行时机制将类名转为类
    Class class = NSClassFromString(className);
    
    // 导航控制器的根控制器
    UIViewController *viewController = [[class alloc] init];
    
    // 设置导航控制器的根控制器
    viewController.navigationItem.title = _masterItem.title;
    
    // 创建导航控制器
    self.navigationController =[[UINavigationController alloc] initWithRootViewController:viewController];
    // 添加子控制器
    [self addChildViewController:self.navigationController];
    // 添加子视图
    [self.view addSubview:self.navigationController.view];

}

@end
