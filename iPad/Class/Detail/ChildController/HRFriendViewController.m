//
//  HRFriendViewController.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRFriendViewController.h"
#import "HRBrokenLine.h"

@interface HRFriendViewController ()

@end

@implementation HRFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    HRBrokenLine *lineView = [[HRBrokenLine alloc] initWithFrame:CGRectMake(100, 100, 700, 400)];
    lineView.time = @"138";
    [self.view addSubview:lineView];
}



@end
