//
//  HRMasterViewController.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRMasterViewController.h"
#import "HRDetailViewController.h"
#import "HRMasterButton.h"
#import "HRMasterViewModel.h"
#import "HRDetailModel.h"
#import <Masonry.h>

@interface HRMasterViewController ()

@property (weak, nonatomic) HRMasterButton *selectedBtn;

@property (strong, nonatomic) HRMasterViewModel *buttonViewModel;

// 菜单区StackView
@property (nonatomic,strong) UIStackView *menuArea_StackView;
/// 子控制器缓存
@property (strong, nonatomic) NSMutableDictionary *subViewControllers;

@end

@implementation HRMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

#pragma mark -
- (void)setupUI{
    self.view.backgroundColor = [UIColor colorWithWhite:34/255.0 alpha:1.0];
    for (HRDetailModel *model in self.buttonViewModel.menumItems) {
        HRMasterButton *button = [HRMasterButton buttonWithItem:model];
        [button setTitle:model.title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        [self.menuArea_StackView addArrangedSubview:button];
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    HRMasterButton *btn = self.menuArea_StackView.subviews[0];
    [self clickBtn:btn];
}

#pragma mark - event response
- (void)clickBtn:(HRMasterButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;

    //从缓存中取子控制器
    HRDetailViewController *detailVC = self.subViewControllers[btn.detailItem.title];
    if (!detailVC) {
        detailVC = [[HRDetailViewController alloc] initWithMasterItem:btn.detailItem];
        [self.subViewControllers setObject:detailVC forKey:btn.detailItem.title];
    }
    
    //切换子控制器
    [self.splitViewController showDetailViewController:detailVC sender:self];
}

#pragma mark - setter and getter
- (HRMasterViewModel *)buttonViewModel{
    if (!_buttonViewModel) {
        _buttonViewModel = [[HRMasterViewModel alloc] init];
    }
    return _buttonViewModel;
}

- (UIStackView *)menuArea_StackView{
    if (!_menuArea_StackView) {
        _menuArea_StackView = [[UIStackView alloc] init];
        [self.view addSubview:_menuArea_StackView];
        _menuArea_StackView.axis = UILayoutConstraintAxisVertical;
        [_menuArea_StackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view).offset(50);
        }];
    }
    return _menuArea_StackView;
}

- (NSMutableDictionary *)subViewControllers{
    if (!_subViewControllers) {
        _subViewControllers = [NSMutableDictionary dictionary];
    }
    return _subViewControllers;
}

@end
