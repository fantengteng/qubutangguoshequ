//
//  HomeBannerV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeBannerV.h"
#import "ZKCycleScrollView.h"
#import "MallBannerCell.h"
#import "HomeCatV.h"
#import "HomecellinfoModel.h"
@interface HomeBannerV ()<ZKCycleScrollViewDelegate, ZKCycleScrollViewDataSource>
@property (nonatomic , strong) ZKCycleScrollView *BannerV;
@property (nonatomic , strong) HomeCatV *CatV;
@property (nonatomic , strong) NSMutableArray *Banner;
@end
@implementation HomeBannerV

#pragma mark 生命周期

#pragma mark 回调协议
- (NSInteger)numberOfItemsInCycleScrollView:(ZKCycleScrollView *)cycleScrollView {
    return self.Banner.count;
}

- (__kindof ZKCycleScrollViewCell *)cycleScrollView:(ZKCycleScrollView *)cycleScrollView cellForItemAtIndex:(NSInteger)index {
    MallBannerCell *cell = [cycleScrollView dequeueReusableCellWithReuseIdentifier:@"Cellbanner" forIndex:index];
    HomeBannerModel *infoModel = self.Banner[index];
    cell.imageURL = [NSURL URLWithString:infoModel.imgUrl];
    return cell;
}

- (void)cycleScrollView:(ZKCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    HomeBannerModel *infoModel = self.Banner[index];
    if (self.ViewtapClose) {
        self.ViewtapClose(-1, infoModel.linkUrl);
    }
}


#pragma mark 触发方法

- (void)tt_configClose {
    @weakify(self)
    self.CatV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.ViewtapClose) {
            self.ViewtapClose(num, @"");
        }
    };

}

#pragma mark 公开方法

#pragma mark 私有方法
- (void)tt_setupViews {
    self.backgroundColor = Col_ECE;
    [self addSubview:self.BannerV];
    [self addSubview:self.CatV];
    self.BannerV.delegate = self;
    self.BannerV.dataSource = self;
    [self tt_configClose];
}

#pragma mark 存取方法
- (ZKCycleScrollView *)BannerV {
    if (!_BannerV) {
        _BannerV = [[ZKCycleScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, KScreenWidth , (KScreenWidth - 20) / 25 * 9 + 10)];
        _BannerV.backgroundColor = Col_FFF;
        [_BannerV registerCellClass:[MallBannerCell class] forCellWithReuseIdentifier:@"Cellbanner"];
    }
    return _BannerV;
}

- (HomeCatV *)CatV {
    if (!_CatV) {
        _CatV = [[HomeCatV alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.BannerV.frame) + 10, KScreenWidth, (KScreenWidth - 24) / 2  * 0.56 + (KScreenWidth - 32) / 3 + 20)];
    }
    return _CatV;
}

- (NSMutableArray *)Banner {
    if (!_Banner) {
        _Banner = [NSMutableArray new];
    }
    return _Banner;
}

- (void)setData:(NSMutableArray *)data {
    self.Banner = data;
    [self.BannerV reloadData];
    
}

@end
