//
//  HRHomeHeaderView.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRHomeHeaderView.h"
#import <Masonry.h>

@interface HRHomeHeaderView ()



@end

@implementation HRHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        
        //标题
        UILabel *title = [[UILabel alloc] init];
        [self addSubview:title];
        title.font = [UIFont systemFontOfSize:25];
        title.text = @"示例队名";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self).offset(50);
        }];
        
        //按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:25];
        [btn setTitle:@"选择队员" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectedClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        //训练类型
        UIButton *type = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:type];
        type.titleLabel.font = [UIFont systemFontOfSize:25];
        [type setTitle:@"训练类型" forState:UIControlStateNormal];
        [type setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [type addTarget:self action:@selector(trainType:) forControlEvents:UIControlEventTouchUpInside];
        [type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.right.mas_equalTo(self).offset(-50);
        }];
        
    }
    return self;
}

- (void)selectedClick:(UIButton *)sender{
    UIPopoverController *popVC = [[UIPopoverController alloc] initWithContentViewController:[[UIViewController alloc] init]];
    popVC.popoverContentSize = CGSizeMake(200, 300);
    popVC.backgroundColor = [UIColor redColor];
    [popVC presentPopoverFromRect:sender.frame inView:self permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (void)trainType:(UIButton *)sender{
    
}

@end
