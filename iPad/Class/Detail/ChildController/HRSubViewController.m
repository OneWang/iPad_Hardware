//
//  HRSubViewController.m
//  iPad
//
//  Created by Jack on 2018/6/7.
//  Copyright © 2018年 LI. All rights reserved.
//

#import "HRSubViewController.h"
#import <Masonry.h>

@interface HRSubViewController ()
@property (weak, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) NSTimer *timer;
@end

static int i = 0;
@implementation HRSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    i = 0;
    //开启
    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //暂停
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *time = [[UILabel alloc] init];
    [self.view addSubview:time];
    time.font = [UIFont systemFontOfSize:30];
    self.timeLabel = time;
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(loop) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)loop{
    i++;
    self.timeLabel.text = [self displayTime:i];
}

- (NSString *)displayTime:(int)timeInterval{
    NSString *time = @"";
    int seconds = timeInterval % 60;
    int minutes = (timeInterval / 60) % 60;
    int hours = timeInterval / 3600;
    NSString *secondStr = seconds < 10 ? [NSString stringWithFormat:@"0%d",seconds] : [NSString stringWithFormat:@"%d",seconds];
    NSString *minuteStr = minutes < 10 ? [NSString stringWithFormat:@"0%d",minutes] : [NSString stringWithFormat:@"%d",minutes];
    NSString *hourStr = hours < 10 ? [NSString stringWithFormat:@"0%d",hours] : [NSString stringWithFormat:@"%d",hours];
    time = [NSString stringWithFormat:@"%@:%@:%@",hourStr,minuteStr,secondStr];
    return time;
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}


@end
