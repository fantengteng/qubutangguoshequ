//
//  MyPhoneC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyPhoneC.h"
#import "MyphoneModel.h"
#import "MyPhoneCollectionV.h"
@interface MyPhoneC ()

@end

@implementation MyPhoneC

#pragma mark 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}

#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

- (void)tt_addSubviews {
    [self setupCollectionV:[MyPhoneCollectionV class]];
    [self setupVM:[HomeVM class]];
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:bloglistMyPhotoMARK params:dic networkClass:[HomeAPI class]];
}

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的相册";
    [self wr_setNavBarBackgroundAlpha:0];
}


#pragma mark 存取方法


@end
