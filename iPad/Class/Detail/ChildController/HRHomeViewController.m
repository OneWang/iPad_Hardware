//
//  HRHomeViewController.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRHomeViewController.h"
#import "HRHomeHeaderView.h"
#import "HRHomeListController.h"
#import "HRHomeTrainCell.h"
#import "HRSubViewController.h"

@interface HRHomeViewController ()<HRHomeHeaderViewDelegate,
                                   UIPopoverPresentationControllerDelegate,
                                   HRHomeListControllerDelegate>

///选择队伍
@property (weak, nonatomic) HRHomeListController *listVC;

@end

@implementation HRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationController.navigationBar.translucent = NO;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRHomeTrainCell *cell = [HRHomeTrainCell cellWithTableView:tableView];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HRHomeHeaderView *header = [[HRHomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    header.delegate = self;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HRSubViewController *subVC = [[HRSubViewController alloc] init];
    [self.navigationController pushViewController:subVC animated:YES];
}

#pragma mark - HRHomeHeaderViewDelegate
- (void)hr_homeHeaderView:(HRHomeHeaderView *)headerView didSelectedTeam:(UIButton *)button{
    HRHomeListController *listVC = [[HRHomeListController alloc] init];
    self.listVC = listVC;
    listVC.delegate = self;
    listVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popVC = listVC.popoverPresentationController;
    popVC.delegate = self;
    popVC.sourceRect = button.frame;
    popVC.sourceView = self.view;
    popVC.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:listVC animated:YES completion:nil];
}

#pragma mark - HRHomeListControllerDelegate
- (void)hr_homeListControllerDidSelecteIndexPath:(NSIndexPath *)indexPath{
    [self.listVC dismissViewControllerAnimated:YES completion:nil];
}

@end
