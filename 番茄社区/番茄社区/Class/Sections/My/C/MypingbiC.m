//
//  MypingbiC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MypingbiC.h"
#import "MyguanzhuTableV.h"
#import "MyguanzhuModel.h"
@interface MypingbiC ()
@property (nonatomic , strong) MyguanzhuTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation MypingbiC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}

#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

- (void)quxiaopingbi:(MyguanzhuModel *)model{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:model.relatedUserCode forKey:@"relatedUserCode"];
    [dic setValue:@(1) forKey:@"operateType"];
    [self configDataforNewnetWorkname:blockUserMARK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[MyguanzhuTableV class]];
    [self setupVM:[HomeVM class]];
    self.TableV.Type = 2;
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, MyguanzhuModel * data) {
        @strongify(self)
        [self quxiaopingbi:data];
    };
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:listBlockedUserMARK params:dic networkClass:[HomeAPI class]];
}


- (void)configSuccessTankuang:(NSString *)mark {
    if ([mark isEqualToString:blockUserMARK]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"取消成功" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONO" AndAfterDelay:1 AndBack:^{
            [self configData];
        }];
    }
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的屏蔽";
    [self wr_setNavBarShadowImageHidden:NO];
    
}

#pragma mark 存取方法
@end
