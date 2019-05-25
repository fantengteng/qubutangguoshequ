//
//  MyguanzhuTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyguanzhuTableV.h"
#import "MyguanzhuCell.h"
@implementation MyguanzhuTableV


#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyguanzhuCell *Cell = [MyguanzhuCell cellWithTableView:tableView CellClass:[MyguanzhuCell class]];
    Cell.type = self.Type;
    Cell.model = self.infodata[indexPath.row];
    @weakify(self)
    Cell.currencyClose = ^(NSInteger num) {
        @strongify(self)
        [self celltapCloseNum:num data:self.infodata[indexPath.row]];
    };
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
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


#pragma mark 存取方法

@end
