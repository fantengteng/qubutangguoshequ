//
//  MyguanzhuC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyguanzhuC.h"
#import "MyguanzhuTableV.h"
#import "MyguanzhuModel.h"
@interface MyguanzhuC ()

@property (nonatomic , strong) MyguanzhuTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;

@end

@implementation MyguanzhuC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configData];
}
#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

- (void)quxiaoguanzhua:(MyguanzhuModel *)model {
    NSMutableDictionary *dic = [NSMutableDictionary  new];
    [dic setValue:model.relatedUserCode forKey:@"relatedUserCode"];
    [dic setValue:@"1" forKey:@"operateType"];
    [self configDataforNewnetWorkname:followUserMark params:dic networkClass:[HomeAPI class]];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[MyguanzhuTableV class]];
    self.TableV.Type = 1;
    [self setupVM:[HomeVM class]];
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, MyguanzhuModel * data) {
        @strongify(self)
        [self quxiaoguanzhua:data];
    };
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:listFollowUserMARK params:dic networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    if ([mark isEqualToString:followUserMark]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"取关成功" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONO" AndAfterDelay:1 AndBack:^{
            [self configData];
        }];
    }
}
#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的关注";
    [self wr_setNavBarShadowImageHidden:NO];
    
}

#pragma mark 存取方法


@end
