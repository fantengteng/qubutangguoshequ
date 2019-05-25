//
//  HomeTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeTableV.h"
#import "HomeBannerV.h"
#import "HomeTableCell.h"
@interface HomeTableV ()

@property (nonatomic , strong) HomeBannerV *bannerV;



@end
@implementation HomeTableV

#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableCell *Cell = [HomeTableCell cellWithTableView:tableView CellClass:[HomeTableCell class]];
    Cell.model = self.infodata[indexPath.row];
    @weakify(self)
    Cell.currencyClose = ^(NSInteger num) {
        @strongify(self)
         [self celltapCloseNum:num data:self.infodata[indexPath.row]];
    };
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[HomeTableCell class] contentViewWidth:KScreenWidth];
}


- (void)configClose {
    @weakify(self)
    self.bannerV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.TT_delegate && [self.TT_delegate respondsToSelector:@selector(tapviewActiontype:model:)]) {
            [self.TT_delegate tapviewActiontype:num model:data
             ];
        }
    };
}
#pragma mark 触发方法

- (void)celltapCloseNum:(NSInteger)num data:(id)data {
    if (self.tapClose) {
        self.tapClose(num, data);
    }
}
#pragma mark 公开方法

- (void)configDataNew:(NSMutableArray *)Data has_more:(BOOL)has_more {
    if (self.Page == 0) {
        [self.infodata removeAllObjects];
    }
    if (self.is_hideHeader == 1) {
        self.bannerV.data = Data[0];
        self.infodata = Data[1];
    }else {
        [self.infodata addObjectsFromArray:Data];
    }
    
    self.havemore = has_more;
    self.Is_firstload = NO;

    self.is_twoarr = NO;
    if (!has_more && self.is_refreshfoot) {
        self.mj_footer.state = MJRefreshStateNoMoreData;
    }
    [self endRefresh];
}

#pragma mark 私有方法


#pragma mark 存取方法

- (void)setIs_hideHeader:(NSInteger)is_hideHeader {
    _is_hideHeader = is_hideHeader;
    if (is_hideHeader == 1) {
        self.tableHeaderView = self.bannerV;
        [self configClose];
    }
}

- (HomeBannerV *)bannerV {
    if (!_bannerV) {
        _bannerV = [[HomeBannerV alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 147 +  (KScreenWidth - 24) / 2  * 0.56 + (KScreenWidth - 32) / 3 + 20)];
    }
    return _bannerV;
}

@end
