//
//  MyFabuTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyFabuTableV.h"
#import "MyfabuCell.h"
@implementation MyFabuTableV




#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyfabuCell *Cell = [MyfabuCell cellWithTableView:tableView CellClass:[MyfabuCell class]];
    Cell.model = self.infodata[indexPath.row];
    @weakify(self)
    Cell.currencyClose = ^(NSInteger num) {
        @strongify(self)
        [self celltapCloseNum:num data:self.infodata[indexPath.row]];
    };
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[MyfabuCell class] contentViewWidth:KScreenWidth];
}

#pragma mark 触发方法

- (void)celltapCloseNum:(NSInteger)num data:(id)data {
    if (self.tapClose) {
        self.tapClose(num, data);
    }
}
#pragma mark 公开方法

#pragma mark 私有方法


#pragma mark 存取方法

@end
