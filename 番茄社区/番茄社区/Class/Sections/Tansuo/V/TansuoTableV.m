//
//  TansuoTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TansuoTableV.h"
#import "TansuoCell.h"
@implementation TansuoTableV
#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TansuoCell *Cell = [TansuoCell cellWithTableView:tableView CellClass:[TansuoCell class]];
    Cell.model = self.infodata[indexPath.row];
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[TansuoCell class] contentViewWidth:KScreenWidth];
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)changeDefaultConfigguration {
    self.Page = 0;
}


#pragma mark 私有方法


#pragma mark 存取方法
@end
