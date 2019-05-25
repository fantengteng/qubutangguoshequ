//
//  HomeCatTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeCatTableV.h"
#import "HomeCatCell.h"
@implementation HomeCatTableV

#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCatCell *Cell = [HomeCatCell cellWithTableView:tableView CellClass:[HomeCatCell class]];
    [Cell configData:self.infodata[indexPath.row]];
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 77;
}

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法


#pragma mark 存取方法

@end
