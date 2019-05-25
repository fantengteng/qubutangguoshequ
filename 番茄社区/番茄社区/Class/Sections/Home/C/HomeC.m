//
//  HomeC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeC.h"
#import "HomeTableV.h"
#import "HomeCatDetailC.h"
#import "HomeCatModel.h"
#import "HomecellinfoModel.h"
#import "HomeDetailC.h"
#import "HomeCatC.h"
@interface HomeC ()
@property (nonatomic , strong) HomeTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@property (nonatomic , strong) HomecellinfoModel *model;
@end

@implementation HomeC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}
#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(HomecellinfoModel *)model {
    [self jumpHomeDetailC:model];
}

- (void)tapviewActiontype:(NSInteger)type model:(id)model {
    if (type == -1) {
        NSString *RL = model;
        if (![RL isEqualToString:@""]) {
            CurrenC *CC = [[CurrenC alloc]init];
            CC.web_url = model;
            [self JumpController:CC];
        }
    }else {
        if (type == 1000) {
            [self jumpHomeCatC];
        }else {
            HomeCatModel *model = [[HomeCatModel alloc]init];
            model.categoryId = type - 1000;
            [self jumpHomeCatDetailC:model];
        }
    }
}


- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, HomecellinfoModel *data) {
        @strongify(self)
        [[TabBarTool Share_TabBarTool]configisLoginv:self];
        [self configchuafafangfa:num data:data];
    };
}

#pragma mark 界面跳转

- (void)jumpHomeDetailC:(HomecellinfoModel *)model {
    HomeDetailC *DC = [[HomeDetailC alloc]init];
    DC.model = model;
    [self JumpController:DC];
}

- (void)jumpHomeCatC {
    HomeCatC *CAT = [[HomeCatC alloc]init];
    CAT.type = 1;
    [self JumpController:CAT];
}

- (void)jumpHomeCatDetailC:(HomeCatModel *)model {
    HomeCatDetailC *CC = [[HomeCatDetailC alloc]init];
    CC.model = model;
    [self JumpController:CC];
}


#pragma mark 触发方法

- (void)configchuafafangfa:(NSInteger)num data:(HomecellinfoModel *)data{
    self.model = data;
    [[FTT_HudTool share_FTT_HudTool]CreateMBProgressHUDModeIndeterminateForVeiw:self.view];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (num == 0) {
        [dic setValue:self.model.publisher[@"userCode"] forKey:@"relatedUserCode"];
        [dic setValue:[NSString stringWithFormat:@"%ld", (long)data.followed] forKey:@"operateType"];
        [self configDataforNewnetWorkname:followUserMark params:dic networkClass:[HomeAPI class]];
    }else if (num == 1) {
        [dic setValue:@(data.blogId) forKey:@"blogId"];
        [dic setValue:@(data.upCnt) forKey:@"operateType"];
        [self configDataforNewnetWorkname:bloglikeMARK params:dic networkClass:[HomeAPI class]];
    }else if (num == 3) {
        [dic setValue:self.model.publisher[@"userCode"] forKey:@"relatedUserCode"];
        [dic setValue:@(0) forKey:@"operateType"];
        [self configDataforNewnetWorkname:blockUserMARK params:dic networkClass:[HomeAPI class]];
    }
}





#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HomeTableV class] Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
    [self setupVM:[HomeVM class]];
    self.TableV.is_hideHeader = 1;
    [self tt_allClose];
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [self configDataforNewnetWorkname:blogindexMARK
                               params:dic
                         networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    NSString *STR = @"" ;
    if ([mark isEqualToString:followUserMark]) {
        if (self.model.followed == 1) {
            self.model.followed = 0;
            STR = @"取消关注";
        }else {
            self.model.followed = 1;
            STR = @"关注成功";
        }
    }else if ([mark isEqualToString:bloglikeMARK]) {
        if (self.model.upCnt == 1) {
            STR = @"取消点赞";
            self.model.upCnt = 0;
            self.model.praised = self.model.praised - 1;
        }else {
            STR = @"点赞成功";
            self.model.praised = self.model.praised + 1;
            self.model.upCnt = 1;
        }
    }else if ([mark isEqualToString:blockUserMARK]) {
        STR = @"屏蔽成功";
        [self configData];
    }
    if (![STR isEqualToString:@""]) {
        [self.TableV reloadData];
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:STR
                                          AndView:self.view
                                          AndMode:MBProgressHUDModeText
                                         AndImage:@"NNOO"
                                    AndAfterDelay:1
                                          AndBack:nil];
    }
    
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"趣步糖果社区";
    [self wr_setNavBarShadowImageHidden:NO];
    self.TableV.is_refreshfoot = YES;
    self.TableV.is_refreshHeader = YES;
    
}

#pragma mark 存取方法


@end
