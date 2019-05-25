//
//  HomeDetailTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeDetailTableV.h"
#import "HomeDetailCell.h"
#import "HomeDetailSecondCell.h"
@implementation HomeDetailTableV

#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    if (indexPath.row == 0) {
        HomeDetailCell *Cell = [HomeDetailCell cellWithTableView:tableView CellClass:[HomeDetailCell class]];
        Cell.model = self.infodata[indexPath.row];
        @weakify(self)
        Cell.currencyClose = ^(NSInteger num) {
            @strongify(self)
            [self celltapCloseNum:num  data:self.infodata[indexPath.row]];
        };
        return Cell;
    }else {
        HomeDetailSecondCell *secondCell = [HomeDetailSecondCell cellWithTableView:tableView CellClass:[HomeDetailSecondCell class]];
        secondCell.secondmodel = self.infodata[indexPath.row];
        return secondCell;
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
         return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[HomeDetailCell class] contentViewWidth:KScreenWidth];
    }else {
        return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"secondmodel" cellClass:[HomeDetailSecondCell class] contentViewWidth:KScreenWidth];
    }
   
}

#pragma mark 触发方法

- (void)celltapCloseNum:(NSInteger)num data:(id)data {
    if (self.tapClose) {
        self.tapClose(num, data);
    }
}
#pragma mark 公开方法

- (void)changeDefaultConfigguration {
    self.Page = 0;
}

#pragma mark 私有方法



@end
