//
//  HRMasterButton.m
//  iPad
//
//  Created by LI on 2017/3/21.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRMasterButton.h"
#import "HRDetailModel.h"
#import <Masonry.h>

@implementation HRMasterButton

+ (instancetype)buttonWithItem:(HRDetailModel *)item{
    return [[self alloc] initWithItem:item];
}

- (instancetype)initWithItem:(HRDetailModel *)item{
    if (self = [super init]) {
        _detailItem = item;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    // 取消系统默认的高亮状态渲染
    self.adjustsImageWhenHighlighted = NO;
    
    // 设置正常状态图片
    [self setImage:[UIImage imageNamed:_detailItem.imageName] forState:UIControlStateNormal];
    
    // 设置选中背景图
    [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    
    // 分隔线
    UIImageView *seperatorImageView = [[UIImageView alloc] init];
    [self addSubview:seperatorImageView];
    
    // button自身约束
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
    }];
        
    // 分割线ImageView
    seperatorImageView.image = [UIImage imageNamed:@"tabbar_separate_line"];
    [seperatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(2);
    }];

}

@end
