//
//  HRHomeListController.m
//  iPad
//
//  Created by LI on 2017/3/23.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRHomeListController.h"

@interface HRHomeListController ()
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation HRHomeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake(300, 400);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"homeList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(hr_homeListControllerDidSelecteIndexPath:)]) {
        [self.delegate hr_homeListControllerDidSelecteIndexPath:indexPath];
    }
}

#pragma mark - setter and getter
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"队伍1",@"队伍2",@"队伍3",@"队伍4", nil];
    }
    return _dataArray;
}

@end
