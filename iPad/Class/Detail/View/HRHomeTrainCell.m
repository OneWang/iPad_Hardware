//
//  HRHomeTrainCell.m
//  iPad
//
//  Created by LI on 2017/3/23.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRHomeTrainCell.h"

@implementation HRHomeTrainCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"HRHomeTrainCell";
    HRHomeTrainCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HRHomeTrainCell" owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
